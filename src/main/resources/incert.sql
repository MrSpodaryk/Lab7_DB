INSERT INTO mydb.academic_status(id, name)
VALUES (1, 'Status1'),
       (2, 'Status2'),
       (3, 'Status3'),
       (4, 'Status4'),
       (5, 'Status5'),
       (6, 'ZERO');

INSERT INTO mydb.position(id, name)
VALUES (1, 'position1'),
       (2, 'position2'),
       (3, 'position3'),
       (4, 'position4'),
       (5, 'position5'),
       (6, 'ZERO');

INSERT INTO mydb.type_of_exam(id, name)
VALUES (1, 'type1'),
       (2, 'type2'),
       (3, 'type3'),
       (4, 'type4'),
       (5, 'type5');

INSERT INTO mydb.subject(id, name, type_of_exam_id, number_of_semester, code)
VALUES (1, 'subj1', 2, 4, '34'),
       (2, 'subj2', 4, 3, '34'),
       (3, 'subj3', 1, 2, '34'),
       (4, 'subj4', 2, 1, '34'),
       (5, 'subj5', 4, 5, '34'),
       (6, 'subj6', 5, 3, '34');

call proc1(1, 'rwqqe', 'Солодави', '12.10.2000', 4, 1, 2, 3, 'aa 123456');
call proc1(2, 'qvvc', 'aklsdoui', '12.10.2000', 1, 2, 2, 3, 'aa 123456');
call proc1(3, 'qerve', 'mncs', '12.10.2000', 14, 2, 2, 3, 'aa 123456');
call proc1(4, 'vqevqe', 'kqjvcb', '12.10.2000', 1, 3, 2, 3, 'aa 123456');
call proc1(5, 'qvve', 'kqrui', '12.10.2000', 22, 1, 1, 3, 'aa 123456');
call proc1(6, 'vqeve', 'qkifuvyuq', '12.10.2000', 21, 4, 2, 3, 'aa 123456');
call proc1(7, 'vqeve', 'skjfb', '12.10.2000', 11, 1, 5, 3, 'aa 123456');
call proc1(8, 'vqev', 'kfjbcv', '12.10.2000', 16, 1, 2, 3, 'aa 123456');
call proc1(9, 'vqeer', 'kjfd', '12.10.2000', 6, 1, 2, 3, 'aa 123456');
call proc1(10, 'vqeer', 'kjfd', '12.10.2000', 6, 1, 2, 3, 'aa 123456');
call proc1(11, 'vqeer', 'Солодавиdй', '12.10.2000', 6, 1, 2, 3, 'aa 123456');
call proc1(12, 'vqeer', 'Солодаваd', '12.10.2000', 6, 1, 2, 3, 'aa 123456');

