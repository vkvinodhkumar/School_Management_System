from django.core.management.base import BaseCommand
from django.contrib.auth import get_user_model
from academics.models import Class, Section, Subject, TeacherSubjectAssignment
import random

User = get_user_model()

first_names = [
"Aarav","Aditya","Arjun","Rahul","Rohan","Karthik","Sai","Vivek","Nikhil","Varun",
"Priya","Ananya","Meera","Divya","Sneha","Kavya","Pooja","Neha","Swathi","Lakshmi"
]

last_names = [
"Sharma","Patel","Singh","Nair","Reddy","Gupta","Iyer","Joshi","Menon","Kumar"
]

subjects_list = [
"Mathematics",
"Science",
"English",
"Social Science",
"Computer Science",
"Tamil",
"Hindi"
]

class Command(BaseCommand):


    help = "Create teachers and assign them to classes and subjects"

    def handle(self, *args, **kwargs):

        password = "123456"

        classes = list(Class.objects.all())
        sections = list(Section.objects.all())

        subjects = []
        for name in subjects_list:
            sub, _ = Subject.objects.get_or_create(name=name)
            subjects.append(sub)

        teachers = []

        self.stdout.write("Creating teachers")

        for i in range(20):

            first = random.choice(first_names)
            last = random.choice(last_names)

            teacher = User.objects.create_user(
                email=f"teacher{i}@school.com",
                password=password,
                role="TEACHER",
                first_name=first,
                last_name=last
            )

            teachers.append(teacher)

        self.stdout.write("Assigning class teachers")

        for section in sections:

            teacher = random.choice(teachers)

            section.class_teacher = teacher
            section.save()

        self.stdout.write("Assigning subject teachers")

        for class_obj in classes:

            for subject in subjects:

                teacher = random.choice(teachers)

                TeacherSubjectAssignment.objects.create(
                    teacher=teacher,
                    subject=subject,
                    class_obj=class_obj,
                    section=random.choice(sections)
                )

        self.stdout.write(self.style.SUCCESS("Teachers and assignments created"))

