CREATE DATABASE norquest_ml;

USE norquest_ml;

CREATE TABLE Students(
  student_id INT PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  course_id INT,
  has_moodle_access VARCHAR(5) DEFAULT 'True',
  created_at DATE NOT NULL,
  note VARCHAR(255) DEFAULT 'N/A'

);

CREATE TABLE Grades(
  grade_id INT PRIMARY KEY NOT NULL,
  grade INT NOT NULL DEFAULT 0,
  course_name VARCHAR(255) NOT NULL,
  student_id INT NOT NULL,
  created_at Date NOT NULL
);

INSERT INTO Students (student_id, name, course_id, has_moodle_access, created_at, note)
VALUES
    (1, 'Tekren Winterborn', NULL, 'True', '2021-10-03', 'N/A'),
    (2, 'Ptorik Winterbane', NULL, 'True', '2022-03-03', '2nd year student'),
    (3, 'Syrin Moonwhisperer', NULL, 'True', '2021-08-23', 'N/A'),
    (4, 'Gethrod Flamecaller', NULL, 'True', '2023-06-09', 'Repeating course'),
    (5, 'Hagalbar Nightshade', NULL, 'False', '2020-03-20', '1st year student'),
    (6, 'Gatlin Ironheart', NULL, 'True', '2021-04-03', 'N/A'),
    (7, 'Eune Starbreeze', 3, 'False', '2021-09-14', '3rd year student'),
    (8, 'Jessop Nightshade', 4, 'True', '2023-10-05', 'Repeating course'),
    (9, 'Syrin Steelclaw', 1, 'False', '2022-06-12', '2nd year student'),
    (10, 'Paskel Thunderstrike', NULL, 'True', '2021-06-20', '1st year student'),
    (11, 'Paskel Grimshadow', NULL, 'True', '2020-12-09', 'N/A'),
    (12, 'Jather Moonstone', NULL, 'False', '2023-12-09', 'Repeating course'),
    (13, 'Hagalbar Shadowmere', 5, 'True', '2023-01-22', '2nd year student'),
    (14, 'Lenox Thunderheart', 7, 'True', '2022-04-09', 'N/A'),
    (15, 'Fintis Thorneblade', NULL, 'True', '2021-10-04', '1st year student'),
    (16, 'Tekren Froststorm', NULL, 'True', '2023-06-09', 'Repeating course'),
    (17, 'Gethrod Thorneblade', 1, 'False', '2023-06-09', 'N/A'),
    (18, 'Jessop Thunderbird', 11, 'True', '2023-05-29', '2nd year student'),
    (19, 'Krinn Shadowhunter', NULL, 'False', '2020-08-12', 'N/A'),
    (20, 'Gethrod Froststorm', 12, 'False', '2023-05-15', '1st year student');

	SELECT * FROM Students;

	INSERT INTO Grades (grade_id, grade, course_name, student_id, created_at)
VALUES
   (1, 58, 'Linear Algebra I', 22, '2020-08-08'),
    (2, 95, 'Introduction to Computer Science', 22, '2023-06-18'),
    (3, 43, 'Database Management Systems', 24, '2021-09-01'),
    (4, 44, 'Machine Learning II', 8, '2023-07-05'),
    (5, 17, 'Algorithms', 11, '2021-09-20'),
    (6, 56, 'Database Management Systems', 6, '2023-12-02'),
    (7, 35, 'Statistics I', 20, '2023-04-30'),
    (8, 27, 'Machine Learning II', 1, '2022-02-08'),
    (9, 35, 'Machine Learning Deployment and Software Development', 25, '2023-06-04'),
    (10, 77, 'Machine Learning Deployment and Software Development', 1, '2021-03-22'),
    (11, 92, 'Data Preparation Analytics', 14, '2023-08-03'),
    (12, 79, 'Algorithms', 3, '2023-07-10'),
    (13, 54, 'Machine Learning Deployment and Software Development', 24, '2020-06-14'),
    (14, 45, 'Data Preparation Analytics', 19, '2023-07-21'),
    (15, 17, 'Statistics I', 5, '2020-11-08'),
    (16, 54, 'Introduction to Artificial Intelligence', 20, '2021-06-17'),
    (17, 18, 'Machine Learning II', 16, '2021-07-06'),
    (18, 34, 'Statistics I', 23, '2022-06-22'),
    (19, 21, 'Database Management Systems', 19, '2021-04-23'),
    (20, 5, 'Machine Learning I', 12, '2020-09-09'),
    (21, 24, 'Introduction to Machine Learning and Data Science', 2, '2021-08-15'),
    (22, 79, 'Machine Learning Deployment and Software Development', 16, '2022-08-23'),
    (23, 10, 'Data Preparation Analytics', 4, '2023-09-08'),
    (24, 13, 'Machine Learning Work Integrated Project I', 24, '2022-03-18'),
    (25, 14, 'Linear Algebra I', 18, '2021-02-10'),
    (26, 2, 'Machine Learning Work Integrated Project I', 2, '2021-05-18'),
    (27, 17, 'Introduction to Artificial Intelligence', 23, '2020-12-18'),
    (28, 95, 'Introduction to Artificial Intelligence', 23, '2023-08-11'),
    (29, 14, 'Linear Algebra I', 1, '2020-05-08'),
    (30, 96, 'Statistics I', 12, '2021-06-15');

	SELECT * FROM Grades;

	UPDATE Students
	SET has_moodle_access = 'False'
	WHERE note = 'Repeating course';

	SELECT * FROM Students;

	SELECT course_id, name, has_moodle_access 
	FROM Students 
	WHERE course_id IS NOT NULL;

	SELECT * FROM Students
	WHERE created_at = '2023-06-09';

	ALTER TABLE Grades
	ADD course_id INT NOT NULL DEFAULT 0;

	SELECT * FROM Grades;

	UPDATE Grades
    SET course_id = 4
    WHERE grade_id = 12;

	SELECT course_name, MAX(grade) AS max_grade_per_course
	FROM Grades 
	GROUP BY course_name
	ORDER BY max_grade_per_course;

    SELECT course_name, MIN(grade) AS min_grade_per_course
	FROM Grades 
	GROUP BY course_name
	ORDER BY min_grade_per_course;

	SELECT student_id, COUNT(grade)
	FROM Grades
	WHERE grade > 60
	GROUP BY student_id;