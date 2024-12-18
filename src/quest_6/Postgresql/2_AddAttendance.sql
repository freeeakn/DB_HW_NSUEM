CREATE TABLE Attendance (
    id SERIAL PRIMARY KEY,
    id_lesson INTEGER,
    id_student INTEGER,
    CONSTRAINT fk_lesson FOREIGN KEY (id_lesson) REFERENCES Lessons(id),
    CONSTRAINT fk_student FOREIGN KEY (id_student) REFERENCES Students(id)
);