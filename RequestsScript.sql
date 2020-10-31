SELECT 
	teacher.first_name,
    teacher.last_name
FROM teacher
	INNER JOIN course  INNER JOIN student
    INNER JOIN marks ON student.id = marks.student_id ON course.id = marks.course_id 
	INNER JOIN teacher_course ON course.id = teacher_course.course_id ON teacher.id = teacher_course.teacher_id
GROUP BY 
	teacher.id
HAVING 
	COUNT( * )>2000;

SELECT 
	student.first_name,
    student.last_name
FROM course
	INNER JOIN student INNER JOIN
    marks ON student.id = marks.student_id ON course.id = marks.course_id
WHERE 
	marks.mark>4 AND course.course_title="Programming"
ORDER BY
	student.first_name,
    student.last_name;