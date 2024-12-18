CREATE TABLE Lessons (
    id SERIAL PRIMARY KEY,
    pair_number INTEGER,
    start_time TIME,
    end_time TIME,
    date DATE,
    id_subject INTEGER,
    id_group INTEGER,
    id_teacher INTEGER,
    CONSTRAINT fk_subject FOREIGN KEY (id_subject) REFERENCES Subjects(id),
    CONSTRAINT fk_group FOREIGN KEY (id_group) REFERENCES Groups(id),
    CONSTRAINT fk_teacher FOREIGN KEY (id_teacher) REFERENCES Teachers(id)
);