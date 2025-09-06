USE school_al_tamayoz;

-- 1. إنشاء جدول الطلاب المتفوقين (معدل أكبر من 90)
CREATE TABLE top_students AS
SELECT * FROM students
WHERE gpa > 90;

-- 2. إنشاء جدول الطلاب الغير مجتازين (معدل أقل من 60)
CREATE TABLE failed_students AS
SELECT * FROM students
WHERE gpa < 60;

-- 3. عرض الاسماء بحرف أ
SELECT student_name
FROM students
WHERE student_name LIKE 'أ%';

-- 4. عرض الاسم الاول من اربع حروف 
SELECT student_name
FROM students
WHERE CHAR_LENGTH(SUBSTRING_INDEX(student_name, ' ', 1)) = 4;

-- 5. تطبيق Aggregate Functions على المعدل التراكمي
SELECT 
    AVG(gpa) AS average_gpa,
    MAX(gpa) AS max_gpa,
    MIN(gpa) AS min_gpa
FROM students;

-- 6. الطلاب المتفوقين (معدلهم 90 أو أكثر)
SELECT student_name, gpa, level
FROM students
WHERE gpa >= 90
ORDER BY gpa DESC;

-- 7. عرض الطلاب في المستوى الثاني بين 15 و 18
SELECT student_name, birth_date
FROM students
WHERE level = 2
  AND TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 15 AND 18;
  
  
  -- 8. عرض عدد الطلاب الموجودين بالمستوى 2
SELECT COUNT(*) AS count_level_2
FROM students
WHERE level = 2;

-- 9. استعراض المسارات بدون تكرار
SELECT DISTINCT track
FROM students;

-- 10. عرض أسماء المواد بالأحرف الكبيرة
-- تطبق غي اللغه الانجليزية
SELECT UPPER(subject_name) AS subject_name
FROM courses;

-- 11. المتوسط الحسابي للمعدل التراكمي مع تقريب لأصغر عدد
SELECT FLOOR(AVG(gpa)) AS floored_avg_gpa
FROM students;

-- 12. تبديل الجنس F -> Female ، M -> Male
SELECT 
    student_id,
    student_name,
    CASE 
        WHEN gender = 'F' THEN 'Female'
        WHEN gender = 'M' THEN 'Male'
    END AS gender
FROM students;

-- 13. تحديث المعدل للطلاب الغير مجتازين (إضافة 5 درجات)
UPDATE students
SET gpa = gpa + 5
WHERE gpa < 60 AND student_id > 0;
