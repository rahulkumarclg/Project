
# AttendanceSheet Module

## Project Mission

The mission of the AttendanceSheet module is to provide a robust and efficient solution for managing student attendance within a blockchain environment using the Move programming language. This module aims to facilitate the addition, retrieval, and management of student data, ensuring secure and tamper-proof records.

## Project Structure

- **my_addrx::AttendanceSheet**: The main module containing all functionalities related to the attendance sheet.

### Structs

- **Students**: 
  - `students: vector<Student>`: A vector containing `Student` structs.

- **Student**: 
  - `age: u8`: The age of the student.
  - `fName: vector<u8>`: The first name of the student.
  - `lName: vector<u8>`: The last name of the student.
  - `attendanceValue: u8`: The attendance value (number of attendances) of the student.
  - `rollNo: u8`: The roll number of the student.

### Public Functions

- **creating_student(_student: Student, _students: &mut Students): Student**: Creates a new student and adds it to the `Students` vector.
- **adding_student(_students: &mut Students, _student: Student)**: Adds an existing student to the `Students` vector.
- **incrementing_attendance(student: &mut Student)**: Increments the attendance value of a given student.
- **getting_particular_student(student: &Student): &Student**: Retrieves a particular student.
- **getting_total_no_of_students(students: &Students): u64**: Returns the total number of students in the `Students` vector.

## Usage

This module is designed to be used within the Move smart contract environment. The functions provided allow for the creation, management, and retrieval of student attendance data.

## Example

```move
module example::Usage {
    use my_addrx::AttendanceSheet::{Students, Student, creating_student, incrementing_attendance, getting_total_no_of_students};

    public fun example_usage() {
        let mut students = Students { students: vector::empty() };
        let student = Student {
            age: 20,
            fName: b"John",
            lName: b"Doe",
            attendanceValue: 0,
            rollNo: 1,
        };
        
        creating_student(student, &mut students);
        let total_students = getting_total_no_of_students(&students);
        assert!(total_students == 1, 1);

        let student_ref = &mut students.students[0];
        incrementing_attendance(student_ref);
        assert!(student_ref.attendanceValue == 1, 2);
    }
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
