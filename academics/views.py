from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.hashers import make_password
from django.contrib import messages
from accounts.models import CustomUser
from accounts.decorators import role_required
from .models import AdmissionApplication,Student,Exam, Mark, Student, Subject ,QuestionPaper,Homework,HomeworkSubmission, TeacherSubjectAssignment
from django.db.models import Avg, Count
from .models import Student, Mark, AttendanceRecord
from .models import AttendanceSession, AttendanceRecord, Class, Section
from .models import TeacherSubjectAssignment, AttendanceSession ,Homework
from django.db.models import Q
from django.http import HttpResponse
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib import utils
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table
from reportlab.lib.styles import ParagraphStyle
from reportlab.lib import colors
from datetime import date
from reportlab.lib.pagesizes import A4
from django.db import transaction
from reportlab.platypus import TableStyle
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib.units import inch
from reportlab.platypus import TableStyle
from django.utils import timezone
from .utils import generate_admission_number
from django.contrib.auth.decorators import login_required
@login_required
def principal_dashboard(request):

    if request.user.role != "PRINCIPAL":
        return redirect("login")

    # =========================
    # SUMMARY COUNTS
    # =========================
    total_students = Student.objects.count()
    total_teachers = CustomUser.objects.filter(role="TEACHER").count()
    total_classes = Class.objects.count()

    # =========================
    # TODAY ATTENDANCE %
    # =========================
    today = date.today()

    today_records = AttendanceRecord.objects.filter(date=today)
    present_today = today_records.filter(status="PRESENT").count()

    if total_students > 0:
        today_attendance_percent = round(
            (present_today / total_students) * 100,
            2
        )
    else:
        today_attendance_percent = 0
    # =========================
    # ADMISSION APPLICATIONS
    # =========================
    applications = AdmissionApplication.objects.all().order_by("-id")

    approved_students = applications.filter(status="APPROVED").count()
    pending_students = applications.filter(status="PENDING").count()
    rejected_students = applications.filter(status="REJECTED").count()

    # =========================
    # CONTEXT
    # =========================
    context = {
        "applications": applications,

        "total_students": total_students,
        "total_teachers": total_teachers,
        "total_classes": total_classes,
        "today_attendance_percent": today_attendance_percent,

        "approved_students": approved_students,
        "pending_students": pending_students,
        "rejected_students": rejected_students,
    }

    return render(
        request,
        "academics/principal_dashboard.html",
        context
    )


def admission_form(request):

    classes = Class.objects.all()

    if request.method == "POST":
        student_name = request.POST.get("student_name")
        parent_name = request.POST.get("parent_name")
        parent_email = request.POST.get("parent_email")
        class_id = request.POST.get("class_id")

        AdmissionApplication.objects.create(
            student_name=student_name,
            parent_name=parent_name,
            parent_email=parent_email,
            class_obj=Class.objects.get(id=class_id),
            status="PENDING"
        )

        return redirect("login")

    return render(request, "academics/admission_form.html", {
        "classes": classes
    })
@role_required(["PRINCIPAL"])
@transaction.atomic
def approve_application(request, pk):

    app = get_object_or_404(AdmissionApplication, id=pk)

    if app.status == "APPROVED":
        return redirect("principal_dashboard")

    if request.method == "POST":

        section_id = request.POST.get("section_id")
        section = get_object_or_404(Section, id=section_id)

        admission_number = generate_admission_number()
        default_password = make_password("eduflow@123")

        # GET OR CREATE PARENT
        parent_user, created = CustomUser.objects.get_or_create(
            email=app.parent_email,
            defaults={
                "first_name": app.parent_name,
                "role": "PARENT",
                "must_change_password": True,
                "password": default_password,
            }
        )

        if parent_user.role != "PARENT":
            parent_user.role = "PARENT"
            parent_user.save()

        # CREATE STUDENT USER
        student_email = f"{admission_number}@gmail.com"

        student_user = CustomUser.objects.create(
            email=student_email,
            first_name=app.student_name,
            role="STUDENT",
            must_change_password=True,
            password=default_password
        )

        # CREATE STUDENT PROFILE
        Student.objects.create(
            user=student_user,
            parent=parent_user,
            full_name=app.student_name,
            admission_number=admission_number,
            class_obj=app.class_obj,
            section=section
        )

        # IMPORTANT — SAVE SECTION TO APPLICATION ALSO
        app.status = "APPROVED"
        app.admission_number = admission_number
        app.section = section
        app.save()

        return redirect("principal_dashboard")

    sections = Section.objects.filter(class_obj=app.class_obj)

    return render(
        request,
        "academics/approve_application.html",
        {
            "application": app,
            "sections": sections
        }
    )
@role_required(["PRINCIPAL"])
def reject_application(request, pk):

    app = get_object_or_404(AdmissionApplication, pk=pk)

    app.status = "REJECTED"
    app.admission_number = None
    app.save()

    return redirect("principal_dashboard")

@role_required(["TEACHER"])
def teacher_enter_marks(request):

    teacher = request.user

    sections = Section.objects.filter(
        class_teacher=teacher
    ).select_related("class_obj")

    section_id = request.GET.get("section_id") or request.POST.get("section_id")

    students = Student.objects.none()
    selected_section = None

    if section_id:
        selected_section = Section.objects.filter(
            id=section_id,
            class_teacher=teacher
        ).first()

        if selected_section:
            students = Student.objects.filter(
                class_obj=selected_section.class_obj,
                section=selected_section
            )

    subjects = Subject.objects.all()
    exams = Exam.objects.all()

    if request.method == "POST":

        student_id = request.POST.get("student_id")
        subject_id = request.POST.get("subject_id")
        exam_id = request.POST.get("exam_id")
        marks_value = request.POST.get("marks")

        student = get_object_or_404(Student, id=student_id)
        subject = get_object_or_404(Subject, id=subject_id)
        exam = get_object_or_404(Exam, id=exam_id)

        if int(marks_value) > exam.max_marks:
            return render(request,"academics/teacher_marks.html",{
                "sections":sections,
                "students":students,
                "subjects":subjects,
                "exams":exams,
                "selected_section":selected_section,
                "error":f"Marks cannot exceed {exam.max_marks}"
            })

        Mark.objects.update_or_create(
            student=student,
            subject=subject,
            exam=exam,
            defaults={"marks":marks_value}
        )

        return redirect("teacher_enter_marks")

    saved_marks = Mark.objects.filter(
        student__section__class_teacher=teacher
    ).select_related("student","subject","exam")

    return render(request,"academics/teacher_marks.html",{
        "sections":sections,
        "students":students,
        "subjects":subjects,
        "exams":exams,
        "saved_marks":saved_marks,
        "selected_section":selected_section
    })

@role_required(["TEACHER"])
def edit_mark(request, mark_id):

    mark = get_object_or_404(Mark, id=mark_id)

    if request.method == "POST":
        new_marks = request.POST.get("marks")

        if int(new_marks) <= mark.exam.max_marks:
            mark.marks = new_marks
            mark.save()

        return redirect("teacher_enter_marks")

    return render(request, "academics/edit_mark.html", {
        "mark": mark
    })

@role_required(["TEACHER"])
def delete_mark(request, mark_id):

    mark = get_object_or_404(Mark, id=mark_id)
    mark.delete()

    return redirect("teacher_enter_marks")

@role_required(["STUDENT"])
def student_dashboard(request):

    student = Student.objects.get(user=request.user)

    marks = Mark.objects.filter(student=student).select_related("subject", "exam")

    attendance = AttendanceRecord.objects.filter(student=student)

    total_days = attendance.count()
    present_days = attendance.filter(status="Present").count()

    if total_days > 0:
        attendance_percentage = round((present_days / total_days) * 100, 2)
    else:
        attendance_percentage = 0

    average = student.calculate_average()

    return render(request, "academics/student_dashboard.html", {
        "student": student,
        "marks": marks,
        "attendance_percentage": attendance_percentage,
        "average": average
    })

@login_required
def parent_dashboard(request):

    if request.user.role != "PARENT":
        return redirect("login")

    parent = request.user
    children = Student.objects.filter(parent=parent)

    selected_child_id = request.GET.get("child")

    if selected_child_id:
        child = children.filter(id=selected_child_id).first()
    else:
        child = children.first()

    if not child:
        return render(
            request,
            "academics/parent_dashboard.html",
            {"error": "No child linked to this parent."}
        )

    attendance_percentage = child.attendance_percentage()
    average_marks = child.calculate_average()

    homework = Homework.objects.filter(
        class_obj=child.class_obj,
        section=child.section
    ).order_by("-id")[:5]

    context = {
        "children": children,
        "child": child,
        "attendance_percentage": attendance_percentage,
        "average_marks": average_marks,
        "homework": homework,
    }

    return render(
        request,
        "academics/parent_dashboard.html",
        context
    )

@role_required(["TEACHER"])
def teacher_dashboard(request):

    teacher = request.user

    assigned_subjects = TeacherSubjectAssignment.objects.filter(
        teacher=teacher
    )

    sessions_today = AttendanceSession.objects.filter(
        teacher=teacher
    ).order_by("-date")[:5]

    return render(request, "academics/teacher_dashboard.html", {
        "assigned_subjects": assigned_subjects,
        "sessions_today": sessions_today,
    })
# ===============================
# MARK ATTENDANCE
# ===============================
@role_required(["TEACHER"])
def teacher_mark_attendance(request):

    # SHOW ONLY CLASS TEACHER SECTIONS
    sections = Section.objects.filter(
        class_teacher=request.user
    ).select_related("class_obj")

    students = None
    selected_section = None
    selected_date = None

    if request.method == "POST":

        section_id = request.POST.get("section_id")
        date = request.POST.get("date")

        selected_section = Section.objects.filter(
            id=section_id,
            class_teacher=request.user
        ).first()

        if not selected_section:
            messages.error(request, "Invalid class.")
            return redirect("teacher_mark_attendance")

        selected_date = date

        students = Student.objects.filter(
            class_obj=selected_section.class_obj,
            section=selected_section
        ).order_by("full_name")

        if "submit_attendance" in request.POST:

            for student in students:

                status = request.POST.get(f"status_{student.id}")

                if status:

                    AttendanceRecord.objects.update_or_create(
                        student=student,
                        date=date,
                        defaults={"status": status}
                    )

            messages.success(request, "Attendance saved.")
            return redirect("teacher_mark_attendance")

    attendance_history = AttendanceRecord.objects.filter(
        student__section__class_teacher=request.user
    ).select_related("student").order_by("-date")

    return render(request, "academics/teacher_attendance.html", {

        "sections": sections,
        "students": students,
        "selected_section": selected_section,
        "selected_date": selected_date,
        "attendance_history": attendance_history

    })


# ==========================================
# EDIT ATTENDANCE
# ==========================================
@role_required(["TEACHER"])
def edit_attendance(request, record_id):

    record = get_object_or_404(
        AttendanceRecord,
        id=record_id,
        student__class_obj__teachersubjectassignment__teacher=request.user
    )

    if request.method == "POST":
        record.status = request.POST.get("status")
        record.save()
        messages.success(request, "Attendance updated.")
        return redirect("teacher_mark_attendance")

    return render(request, "academics/edit_attendance.html", {
        "record": record
    })

@role_required(["TEACHER"])
def upload_homework(request):

    subject_assignments = TeacherSubjectAssignment.objects.filter(
        teacher=request.user
    ).select_related("class_obj", "section", "subject")

    class_teacher_sections = Section.objects.filter(
        class_teacher=request.user
    ).select_related("class_obj")

    homeworks = Homework.objects.filter(
        teacher=request.user
    ).order_by("-created_at")

    if request.method == "POST":

        assignment_id = request.POST.get("assignment_id")
        title = request.POST.get("title")
        due_date = request.POST.get("due_date")
        file = request.FILES.get("file")

        assignment = TeacherSubjectAssignment.objects.filter(
            id=assignment_id,
            teacher=request.user
        ).first()

        if assignment:

            Homework.objects.create(
                teacher=request.user,
                class_obj=assignment.class_obj,
                section=assignment.section,
                subject=assignment.subject,
                title=title,
                due_date=due_date,
                file=file
            )

        return redirect("upload_homework")

    return render(request, "academics/upload_homework.html", {
        "assignments": subject_assignments,
        "sections": class_teacher_sections,
        "homeworks": homeworks
    })

@role_required(["TEACHER"])
def edit_homework(request, hw_id):

    homework = Homework.objects.get(id=hw_id, teacher=request.user)

    if request.method == "POST":
        homework.title = request.POST.get("title")
        homework.due_date = request.POST.get("due_date")

        if request.FILES.get("file"):
            homework.file = request.FILES.get("file")

        homework.save()
        return redirect("upload_homework")

    return render(request, "academics/edit_homework.html", {
        "homework": homework
    })

@role_required(["TEACHER"])
def delete_homework(request, hw_id):
    homework = Homework.objects.get(id=hw_id, teacher=request.user)
    homework.delete()
    return redirect("upload_homework")


@role_required(["STUDENT"])
def download_report_card(request):

    student = Student.objects.get(user=request.user)
    marks = Mark.objects.filter(student=student)

    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="report_card.pdf"'

    doc = SimpleDocTemplate(response)
    elements = []

    styles = getSampleStyleSheet()

    elements.append(Paragraph("EduFlow Report Card", styles['Title']))
    elements.append(Spacer(1, 0.3 * inch))

    elements.append(Paragraph(f"Admission No: {student.admission_number}", styles['Normal']))
    elements.append(Spacer(1, 0.2 * inch))

    data = [["Subject", "Exam", "Marks"]]

    for mark in marks:
        data.append([
            mark.subject.name,
            mark.exam.name,
            str(mark.marks_obtained)
        ])

    table = Table(data)
    table.setStyle(TableStyle([
        ('BACKGROUND', (0,0), (-1,0), colors.grey),
        ('GRID', (0,0), (-1,-1), 1, colors.black),
    ]))

    elements.append(table)
    elements.append(Spacer(1, 0.3 * inch))

    elements.append(Paragraph(f"Average: {student.calculate_average()}", styles['Normal']))
    elements.append(Paragraph(f"Attendance: {student.attendance_percentage()}%", styles['Normal']))

    doc.build(elements)

    return response

# ===============================
# UPLOAD QUESTION PAPER
# ===============================
@role_required(["TEACHER"])
def upload_question_paper(request):

    subject_assignments = TeacherSubjectAssignment.objects.filter(
        teacher=request.user
    ).select_related("class_obj", "section", "subject")

    class_teacher_sections = Section.objects.filter(
        class_teacher=request.user
    ).select_related("class_obj")

    papers = QuestionPaper.objects.filter(
        teacher=request.user
    ).order_by("-uploaded_at")

    if request.method == "POST":

        assignment_id = request.POST.get("assignment_id")
        file = request.FILES.get("file")

        assignment = TeacherSubjectAssignment.objects.filter(
            id=assignment_id,
            teacher=request.user
        ).first()

        if assignment and file:

            QuestionPaper.objects.create(
                teacher=request.user,
                class_obj=assignment.class_obj,
                section=assignment.section,
                subject=assignment.subject,
                file=file
            )

        return redirect("upload_question_paper")

    return render(request, "academics/upload_question_paper.html", {
        "assignments": subject_assignments,
        "sections": class_teacher_sections,
        "papers": papers
    })

@role_required(["STUDENT"])
def submit_homework(request, homework_id):

    homework = get_object_or_404(Homework, id=homework_id)

    student = get_object_or_404(
        Student,
        user=request.user
    )

    if request.method == "POST":
        file = request.FILES.get("file")

        HomeworkSubmission.objects.update_or_create(
            homework=homework,
            student=student,
            defaults={"file": file}
        )

        return redirect("student_homework")

    return render(
        request,
        "academics/submit_homework.html",
        {"homework": homework}
    )


@login_required
def view_submissions(request):

    if request.user.role != "TEACHER":
        return redirect("login")

    submissions = HomeworkSubmission.objects.filter(
        homework__teacher=request.user
    ).select_related(
        "student",
        "homework"
    ).order_by("-submitted_at")

    return render(
        request,
        "academics/view_submissions.html",
        {
            "submissions": submissions
        }
    )
@role_required(["TEACHER"])
def edit_question_paper(request, paper_id):

    paper = get_object_or_404(
        QuestionPaper,
        id=paper_id,
        teacher=request.user
    )

    if request.method == "POST":
        paper.title = request.POST.get("title")

        if request.FILES.get("file"):
            paper.file = request.FILES.get("file")

        paper.save()
        return redirect("upload_question_paper")

    return render(request, "academics/edit_question_paper.html", {
        "paper": paper
    })


@role_required(["TEACHER"])
def delete_question_paper(request, paper_id):

    paper = get_object_or_404(
        QuestionPaper,
        id=paper_id,
        teacher=request.user
    )

    paper.delete()
    return redirect("upload_question_paper")


@role_required(["STUDENT"])
def student_attendance(request):

    student = Student.objects.get(user=request.user)

    today = timezone.now().date()

    selected_month = request.GET.get("month")

    records = AttendanceRecord.objects.filter(student=student)

    if selected_month and selected_month != "all":
        records = records.filter(date__month=int(selected_month))

    records = records.order_by("-date")

    today_record = AttendanceRecord.objects.filter(
        student=student,
        date=today
    ).first()

    total_days = records.count()
    present_days = records.filter(status="PRESENT").count()

    if total_days > 0:
        percentage = round((present_days / total_days) * 100, 2)
    else:
        percentage = 0

    return render(request, "academics/student_attendance.html", {
        "today_record": today_record,
        "attendance_history": records,
        "percentage": percentage,
        "selected_month": selected_month
    })

@role_required(["STUDENT"])
def student_marks(request):

    student = Student.objects.get(user=request.user)

    marks = Mark.objects.filter(
        student=student
    ).select_related("subject", "exam")

    return render(request, "academics/student_marks.html", {
        "marks": marks
    })

@login_required
def student_homework(request):

    if request.user.role != "STUDENT":
        return redirect("login")

    student = get_object_or_404(Student, user=request.user)

    homeworks = Homework.objects.filter(
        class_obj=student.class_obj,
        section=student.section
    ).order_by("-created_at")

    submissions = HomeworkSubmission.objects.filter(
        student=student
    )

    submitted_homework_ids = submissions.values_list(
        "homework_id",
        flat=True
    )

    context = {
        "homeworks": homeworks,
        "submitted_homework_ids": submitted_homework_ids,
    }

    return render(
        request,
        "academics/student_homework.html",
        context
    )
@role_required(["STUDENT"])
def student_question_papers(request):

    student = Student.objects.get(user=request.user)

    papers = QuestionPaper.objects.filter(
        class_obj=student.class_obj,
        section=student.section
    ).order_by("-uploaded_at")

    return render(request, "academics/student_question_papers.html", {
        "papers": papers
    })

@login_required
def submit_homework(request, homework_id):

    if request.user.role != "STUDENT":
        return redirect("login")

    student = get_object_or_404(Student, user=request.user)
    homework = get_object_or_404(Homework, id=homework_id)

    if request.method == "POST":
        file = request.FILES.get("file")

        HomeworkSubmission.objects.update_or_create(
            homework=homework,
            student=student,
            defaults={"file": file}
        )

        return redirect("student_homework")

    return render(
        request,
        "academics/submit_homework.html",
        {"homework": homework}
    )

@login_required
def delete_submission(request, homework_id):

    if request.user.role != "STUDENT":
        return redirect("login")

    student = get_object_or_404(Student, user=request.user)

    submission = get_object_or_404(
        HomeworkSubmission,
        homework_id=homework_id,
        student=student
    )

    submission.delete()

    return redirect("student_homework")



@login_required
def parent_marks(request):

    if request.user.role != "PARENT":
        return redirect("login")

    parent = request.user
    children = Student.objects.filter(parent=parent).order_by("id")

    if not children.exists():
        return render(request, "academics/parent_marks.html", {
            "error": "No child linked."
        })

    selected_child_id = request.GET.get("child")

    # If only one child → auto select
    if children.count() == 1:
        child = children.first()
    else:
        # Multiple children → validate selection
        if selected_child_id and children.filter(id=selected_child_id).exists():
            child = children.get(id=selected_child_id)
        else:
            child = children.first()

    marks = Mark.objects.filter(student=child).select_related("exam", "subject")

    return render(request, "academics/parent_marks.html", {
        "children": children,
        "child": child,
        "marks": marks,
        "selected_child_id": str(child.id)
    })

@login_required
def parent_attendance(request):

    if request.user.role != "PARENT":
        return redirect("login")

    parent = request.user
    children = Student.objects.filter(parent=parent).order_by("id")

    if not children.exists():
        return render(request, "academics/parent_attendance.html", {
            "error": "No child linked."
        })

    selected_child_id = request.GET.get("child")
    selected_month = request.GET.get("month")

    if children.count() == 1:
        child = children.first()
    else:
        if selected_child_id and children.filter(id=selected_child_id).exists():
            child = children.get(id=selected_child_id)
        else:
            child = children.first()

    records = AttendanceRecord.objects.filter(student=child)

    if selected_month and selected_month != "all":
        records = records.filter(date__month=int(selected_month))

    records = records.order_by("-date")

    return render(request, "academics/parent_attendance.html", {
        "children": children,
        "child": child,
        "records": records,
        "selected_month": selected_month,
        "selected_child_id": str(child.id)
    })
# -------------------------------
# PDF Download
# -------------------------------

@login_required
def download_report(request):

    if request.user.role != "PARENT":
        return HttpResponse("Access Denied")

    parent = request.user
    children = Student.objects.filter(parent=parent)

    selected_child_id = request.GET.get("child")

    if selected_child_id:
        child = children.filter(id=selected_child_id).first()
    else:
        child = children.first()

    if not child:
        return HttpResponse("No child linked")

    response = HttpResponse(content_type="application/pdf")
    response["Content-Disposition"] = f'attachment; filename="{child.full_name}_report.pdf"'

    doc = SimpleDocTemplate(response, pagesize=A4)
    elements = []
    styles = getSampleStyleSheet()

    # Title
    elements.append(Paragraph(f"Student Report - {child.full_name}", styles["Title"]))
    elements.append(Spacer(1, 12))

    # Student Info
    elements.append(Paragraph(f"Admission No: {child.admission_number}", styles["Normal"]))
    elements.append(Paragraph(f"Class: {child.class_obj}", styles["Normal"]))
    elements.append(Paragraph(f"Section: {child.section}", styles["Normal"]))
    elements.append(Spacer(1, 12))

    # Attendance
    attendance_percent = child.attendance_percentage()
    elements.append(Paragraph(f"Attendance: {attendance_percent}%", styles["Normal"]))
    elements.append(Spacer(1, 12))

    # Marks Table
    marks = Mark.objects.filter(student=child)

    data = [["Subject", "Exam", "Marks", "Max Marks"]]

    for m in marks:
        data.append([
            m.subject.name,
            m.exam.name,
            m.marks,
            m.exam.max_marks
        ])

    if len(data) == 1:
        data.append(["No records", "-", "-", "-"])

    table = Table(data)
    table.setStyle([
        ("BACKGROUND", (0, 0), (-1, 0), colors.grey),
        ("GRID", (0, 0), (-1, -1), 1, colors.black),
    ])

    elements.append(table)

    doc.build(elements)

    return response

# -------------------------
# CLASS LIST
# -------------------------

from django.db.models import Count

@login_required
def principal_class_list(request):

    if request.user.role != "PRINCIPAL":
        return redirect("principal_dashboard")

    classes = Class.objects.annotate(
        section_count=Count("section", distinct=True),
        student_count=Count("student", distinct=True)
    )

    return render(request, "academics/class_list.html", {
        "classes": classes
    })

# -------------------------
# ADD CLASS
# -------------------------




# -------------------------
# EDIT CLASS
# -------------------------

@login_required
def principal_edit_class(request, class_id):

    if request.user.role != "PRINCIPAL":
        return redirect("principal_dashboard")

    class_obj = Class.objects.get(id=class_id)

    if request.method == "POST":
        name = request.POST.get("name")
        if name:
            class_obj.name = name
            class_obj.save()
        return redirect("principal_class_list")

    return render(request, "academics/edit_class.html", {
        "class_obj": class_obj
    })


@login_required
def principal_delete_class(request, class_id):

    if request.user.role != "PRINCIPAL":
        return redirect("principal_dashboard")

    class_obj = Class.objects.get(id=class_id)

    # Check if students exist
    student_exists = Student.objects.filter(class_obj=class_obj).exists()

    # Check if sections exist
    section_exists = Section.objects.filter(class_obj=class_obj).exists()

    if student_exists or section_exists:
        return render(request, "academics/class_list.html", {
            "classes": Class.objects.all(),
            "error": "Cannot delete class. Sections or Students exist."
        })

    class_obj.delete()
    return redirect("principal_class_list")


@login_required
def principal_reports(request):

    if request.user.role != "PRINCIPAL":
        return redirect("principal_dashboard")

    total_students = Student.objects.count()
    total_classes = Class.objects.count()
    total_sections = Section.objects.count()
    total_teachers = CustomUser.objects.filter(role="TEACHER").count()

    return render(request, "academics/principal_reports.html", {
        "total_students": total_students,
        "total_classes": total_classes,
        "total_sections": total_sections,
        "total_teachers": total_teachers
    })