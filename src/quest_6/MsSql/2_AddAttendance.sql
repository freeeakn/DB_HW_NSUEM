CREATE TABLE Attendance (
    id INT PRIMARY KEY IDENTITY(1,1),
    id_lesson INT,
    id_student INT,
    CONSTRAINT FK_Attendance_Lessons FOREIGN KEY (id_lesson) REFERENCES Lessons(id),
    CONSTRAINT FK_Attendance_Students FOREIGN KEY (id_student) REFERENCES Students(id)
);