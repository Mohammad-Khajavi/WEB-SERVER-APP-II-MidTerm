

CREATE TABLE Teachers (
    TeacherNumber INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100)
);

CREATE TABLE Courses (
    CourseNumber NVARCHAR(10) PRIMARY KEY,
    CourseTitle NVARCHAR(100),
    TotalHour INT
);


CREATE TABLE TeacherCourses (
    TeacherNumber INT,
    CourseNumber NVARCHAR(10),
    PRIMARY KEY (TeacherNumber, CourseNumber),
    FOREIGN KEY (TeacherNumber) REFERENCES Teachers(TeacherNumber),
    FOREIGN KEY (CourseNumber) REFERENCES Courses(CourseNumber)
);


INSERT INTO Teachers (TeacherNumber, FirstName, LastName, Email)
VALUES
    (1234, 'Mary', 'Brown', 'mary@yahoo.com'),
    (1235, 'Richard', 'Green', 'richard@gmail.com'),
    (1236, 'Michael', 'Freitag', 'michael@hotmail.com');


INSERT INTO Courses (CourseNumber, CourseTitle, TotalHour)
VALUES
    ('COMP101', 'Advanced Programming in C#', 75),
    ('COMP102', 'Structured Programming', 90),
    ('COMP103', 'Web Application I', 90),
    ('COMP104', 'Web Application II', 75),
    ('COMP105', 'ASP.Net Core MVC', 90);


	INSERT INTO TeacherCourses (TeacherNumber, CourseNumber)
VALUES
    (1234, 'COMP101'), 
    (1234, 'COMP103'), 
    (1235, 'COMP102'),
    (1236, 'COMP104'), 
    (1236, 'COMP105'); 