from django.contrib import admin
from .models import (
    AdmissionApplication,
    Class,
    Section,
    Student,
    Subject,
    TeacherSubjectAssignment, AttendanceSession, AttendanceRecord,Exam, Mark ,HomeworkSubmission,QuestionPaper,Homework
)
admin.site.register(AdmissionApplication)
admin.site.register(Class)
admin.site.register(Section)
admin.site.register(Student)
admin.site.register(Subject)
admin.site.register(TeacherSubjectAssignment)
admin.site.register(AttendanceSession)
admin.site.register(AttendanceRecord)
admin.site.register(Exam)
admin.site.register(Mark)
admin.site.register(Homework)
admin.site.register(HomeworkSubmission)
admin.site.register(QuestionPaper)