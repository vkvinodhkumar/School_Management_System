from django.db import models
from django.utils import timezone
import random
from django.conf import settings

from django.db import models
from django.conf import settings


class Class(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class Section(models.Model):
    name = models.CharField(max_length=10)
    class_obj = models.ForeignKey(Class, on_delete=models.CASCADE)

    class_teacher = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        limit_choices_to={'role': 'TEACHER'}
    )

    def __str__(self):
        return f"{self.class_obj.name} - {self.name}"

class AdmissionApplication(models.Model):

    student_name = models.CharField(max_length=150)
    parent_name = models.CharField(max_length=150)
    parent_email = models.EmailField()

    class_obj = models.ForeignKey(Class, on_delete=models.CASCADE)
    section = models.ForeignKey(Section,on_delete=models.SET_NULL,null=True,blank=True)
    status = models.CharField(max_length=20, default="PENDING")
    admission_number = models.CharField(max_length=20, null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.student_name

class Student(models.Model):

    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name="student_profile"
    )

    parent = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        limit_choices_to={'role': 'PARENT'},
        related_name="children"
    )

    full_name = models.CharField(max_length=150)

    admission_number = models.CharField(max_length=20, unique=True)
    class_obj = models.ForeignKey(Class, on_delete=models.SET_NULL, null=True)
    section = models.ForeignKey(Section, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.full_name
    
    def attendance_percentage(self):
        total_sessions = self.attendancerecord_set.count()

        if total_sessions == 0:
            return 0

        present_count = self.attendancerecord_set.filter(status="PRESENT").count()

        return round((present_count / total_sessions) * 100, 2)
    
    def low_attendance(self):
        return self.attendance_percentage() < 75

    def calculate_average(self):

        from .models import Mark

        marks = Mark.objects.filter(student=self)

        if not marks.exists():
            return 0

        total = sum(m.marks for m in marks)

        return round(total / marks.count(), 2)
    def is_at_risk(self):
        return self.calculate_average() < 40
    
    class Meta:
        indexes = [
            models.Index(fields=["class_obj", "section"])
        ]

class Subject(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name


class AttendanceRecord(models.Model):

    STATUS_CHOICES = [
        ("PRESENT", "Present"),
        ("ABSENT", "Absent"),
    ]

    student = models.ForeignKey(
        Student,
        on_delete=models.CASCADE,
        related_name="attendance_records"
    )

    date = models.DateField()

    status = models.CharField(
        max_length=10,
        choices=STATUS_CHOICES
    )

    class Meta:
        unique_together = ("student", "date")

    def __str__(self):
        return f"{self.student.full_name} - {self.date}"
class TeacherSubjectAssignment(models.Model):

    teacher = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        limit_choices_to={'role': 'TEACHER'}
    )

    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    class_obj = models.ForeignKey(Class, on_delete=models.CASCADE)

    section = models.ForeignKey(
        Section,
        on_delete=models.CASCADE,
        null=True,
        blank=True
    )

    def __str__(self):
        return f"{self.teacher.email} - {self.subject.name} - {self.class_obj.name} - {self.section.name}"
    

class AttendanceSession(models.Model):
    teacher = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        limit_choices_to={'role': 'TEACHER'}
    )
    class_obj = models.ForeignKey(Class, on_delete=models.CASCADE)
    section = models.ForeignKey(Section, on_delete=models.CASCADE)
    date = models.DateField()
    title = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.class_obj.name} - {self.date}"




class Exam(models.Model):

    name = models.CharField(max_length=100)

    max_marks = models.IntegerField()

    def __str__(self):
        return self.name

class Mark(models.Model):

    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    exam = models.ForeignKey(Exam, on_delete=models.CASCADE)

    marks = models.IntegerField()

    def __str__(self):
        return f"{self.student.full_name} - {self.subject.name}"

    class Meta:
        unique_together = ("student", "subject", "exam")

    def __str__(self):
        return f"{self.student.admission_number} - {self.subject.name}"
    


    def attendance_percentage(self):
        from .models import AttendanceRecord

        records = AttendanceRecord.objects.filter(student=self)

        if not records.exists():
            return 0

        total = records.count()
        present = records.filter(status="PRESENT").count()

        percentage = (present / total) * 100
        return round(percentage, 2)

    def low_attendance(self):
        return self.attendance_percentage() < 75
    

    
class QuestionPaper(models.Model):

    teacher = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE
    )

    class_obj = models.ForeignKey(
        Class,
        on_delete=models.CASCADE
    )

    subject = models.ForeignKey(
        Subject,
        on_delete=models.CASCADE
    )

    file = models.FileField(upload_to="question_papers/")

    uploaded_at = models.DateTimeField(auto_now_add=True)


class Homework(models.Model):

    teacher = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        limit_choices_to={'role': 'TEACHER'}
    )

    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    class_obj = models.ForeignKey(Class, on_delete=models.CASCADE)
    section = models.ForeignKey(Section, on_delete=models.CASCADE)

    title = models.CharField(max_length=200)

    file = models.FileField(upload_to="homework_files/")

    due_date = models.DateField()

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.title} - {self.class_obj.name}"
    
class HomeworkSubmission(models.Model):

    homework = models.ForeignKey(
        Homework,
        on_delete=models.CASCADE,
        related_name="submissions"
    )

    student = models.ForeignKey(
        Student,
        on_delete=models.CASCADE,
        related_name="submissions"
    )

    file = models.FileField(upload_to="homework_submissions/")

    submitted_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ("homework", "student")

    def __str__(self):
        return f"{self.student.full_name} - {self.homework.title}"
    
    
class QuestionPaper(models.Model):
    teacher = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        limit_choices_to={'role': 'TEACHER'}
    )
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    class_obj = models.ForeignKey(Class, on_delete=models.CASCADE)
    section = models.ForeignKey(Section, on_delete=models.CASCADE)
    file = models.FileField(upload_to="question_papers/")
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.subject.name} - {self.class_obj.name}"