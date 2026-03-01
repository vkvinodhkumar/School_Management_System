from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib import messages
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth import logout

def logout_view(request):
    logout(request)
    return redirect("login")
def login_view(request):

    if request.method == "POST":
        email = request.POST.get("email")
        password = request.POST.get("password")

        user = authenticate(request, email=email, password=password)

        if user is not None:
            login(request, user)

            # Force password change only for student & parent
            if user.must_change_password and user.role in ["STUDENT", "PARENT"]:
                return redirect("change_password")

            return redirect("role_redirect")

        else:
            messages.error(request, "Invalid email or password")

    return render(request, "accounts/login.html")
@login_required
def role_redirect(request):
    user = request.user

    if user.role == "ADMIN":
        return redirect("/admin/")
    elif user.role == "PRINCIPAL":
        return redirect("principal_dashboard")
    elif user.role == "TEACHER":
        return redirect("teacher_dashboard")
    elif user.role == "STUDENT":
        return redirect("student_dashboard")
    elif user.role == "PARENT":
        return redirect("parent_dashboard")

    return redirect("login")

@login_required
def change_password(request):

    if request.method == "POST":
        new_password = request.POST.get("new_password")

        if not new_password:
            messages.error(request, "Password cannot be empty")
            return redirect("change_password")

        user = request.user
        user.set_password(new_password)
        user.must_change_password = False
        user.save()

        # keep user logged in
        update_session_auth_hash(request, user)

        messages.success(request, "Password changed successfully")
        return redirect("role_redirect")

    return render(request, "accounts/change_password.html")