from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.utils.translation import gettext_lazy as _
from .models import CustomUser


class CustomUserAdmin(UserAdmin):

    model = CustomUser

    # What shows in admin list page
    list_display = ("email", "role", "is_staff", "is_active")
    list_filter = ("role", "is_staff", "is_active")

    # Remove username ordering issue
    ordering = ("email",)
    search_fields = ("email",)

    # Fields shown when editing user
    fieldsets = (
        (None, {"fields": ("email", "password")}),
        (_("Role Information"), {"fields": ("role",)}),
        (_("Permissions"), {
            "fields": (
                "is_active",
                "is_staff",
                "is_superuser",
                "groups",
                "user_permissions",
            ),
        }),
        (_("Important dates"), {"fields": ("last_login",)}),
    )

    # Fields shown when creating new user
    add_fieldsets = (
        (None, {
            "classes": ("wide",),
            "fields": (
                "email",
                "first_name",
                "last_name",
                "password1",
                "password2",
                "role",
                "is_staff",
                "is_active",
            ),
        }),
    )

    filter_horizontal = ("groups", "user_permissions")


admin.site.register(CustomUser, CustomUserAdmin)