module my_addrx::AttendanceSheet{
    
    use std::vector;

    struct Students has store, key, drop , copy
    {
        students: vector<Student>,
    }
    struct Student has store, key, drop , copy
    {
        age: u8,
        fName: vector<u8>,
        lName: vector<u8>,
        attendanceValue: u8,
        rollNo: u8
    }

    public fun creating_student(_student: Student,_students: &mut Students): Student{
        let newStudent = Student {
        age: _student.age,
        fName: _student.fName,
        lName: _student.lName,
        attendanceValue: _student.attendanceValue,
        rollNo: _student.rollNo,
        };
        add_student(_students,newStudent);
        return newStudent
    }

    public fun adding_student(_students: &mut Students,_student: Student){
        vector::push_back(&mut _students.students,_student);
    }

    public fun incrementingAttendance(student : &mut Student){
        student.attendanceValue = student.attendanceValue + 1;
    }

    public fun gettingParticularStudent(student : &Student):&Student{
        return student
    }

    public fun gettingTotalNoOfStudents(student : &Students):u64{
        let totalStudent = vector::length(&student.students);
        return totalStudent
    }
}
