from django.core.management.base import BaseCommand
from django.contrib.auth import get_user_model
from academics.models import Student, Class, Section, Subject, Exam, Mark, AttendanceRecord
from django.utils import timezone
import random

User = get_user_model()


first_names = [
"Aarav","Vivaan","Aditya","Vihaan","Arjun","Sai","Krishna","Rohan","Rahul","Karthik",
"Priya","Ananya","Meera","Divya","Sneha","Pooja","Kavya","Neha","Swathi","Lakshmi"
]

last_names = [
"Kumar","Sharma","Patel","Singh","Nair","Reddy","Gupta","Iyer","Joshi","Menon"
]


class Command(BaseCommand):

    help = "Generate 1000 students with random class and section"

    def handle(self, *args, **kwargs):

        password = "123456"

        classes = list(Class.objects.all())
        subjects = list(Subject.objects.all())
        exams = list(Exam.objects.all())

        students = []

        self.stdout.write("Creating students...")

        for i in range(1000):

            parent = User.objects.create_user(
                email=f"parent{i}@mail.com",
                password=password,
                role="PARENT",
                first_name="Parent",
                last_name=str(i)
            )

            first = random.choice(first_names)
            last = random.choice(last_names)

            student_user = User.objects.create_user(
                email=f"student{i}@mail.com",
                password=password,
                role="STUDENT",
                first_name=first,
                last_name=last
            )

            class_obj = random.choice(classes)

            sections = Section.objects.filter(class_obj=class_obj)
            section = random.choice(list(sections))

            student = Student.objects.create(
                user=student_user,
                parent=parent,
                full_name=f"{first} {last}",
                admission_number=f"ADM{i:05}",
                class_obj=class_obj,
                section=section
            )

            students.append(student)


        self.stdout.write("Creating attendance records")

        for student in students:

            for day in range(20):

                AttendanceRecord.objects.create(
                    student=student,
                    date=timezone.now().date() - timezone.timedelta(days=day),
                    status="PRESENT" if random.random() > 0.1 else "ABSENT"
                )


        self.stdout.write("Creating marks")

        for student in students:

            for subject in subjects:

                exam = random.choice(exams)

                Mark.objects.get_or_create(
                    student=student,
                    subject=subject,
                    exam=exam,
                    defaults={"marks": random.randint(35, 100)}
                )


        self.stdout.write(self.style.SUCCESS("1000 students generated successfully"))