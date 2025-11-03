use m3_csdl;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subjects group by id
having max(credit) >= all(select max(credit) from subjects);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select sub.*,max(ss.score) as score
from subjects sub
inner join subjects_student ss on sub.id = ss.subjects_id
group by sub.id,sub.name
having max(ss.score) >= all(select max(score) from subjects_student ss group by ss.subjects_id);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.*, avg(ss.score) as score
from student s
left join subjects_student ss on s.id = ss.student_id
group by s.id,s.name
order by score desc;