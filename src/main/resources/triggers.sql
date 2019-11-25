DROP TRIGGER IF EXISTS trig1;
DROP TRIGGER IF EXISTS trig2;
DROP TRIGGER IF EXISTS trig3;
DROP TRIGGER IF EXISTS trig4;
DROP TRIGGER IF EXISTS trig5;
DROP TRIGGER IF EXISTS trig6;
DROP TRIGGER IF EXISTS trig7_a;
DROP TRIGGER IF EXISTS trig7_b;
DROP TRIGGER IF EXISTS trig7_c;
DROP TRIGGER IF EXISTS trig8;
DROP TRIGGER IF EXISTS trig9;
DROP TRIGGER IF EXISTS trig10;
DROP TRIGGER IF EXISTS trig11;
DROP TRIGGER IF EXISTS trig12;
DROP TRIGGER IF EXISTS trig13;
DROP TRIGGER IF EXISTS trig14;

delimiter //
create TRIGGER trig1
    BEFORE INSERT
    on coworker
    for each row
begin
    if (new.surname RLIKE 'вий$' or new.surname RLIKE 'вa$')
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'CHECK error for Insert';
    END IF;
end //
delimiter ;


delimiter //
create TRIGGER trig2
    BEFORE UPDATE
    on coworker
    for each row
begin
    if (new.surname RLIKE 'вий$' or new.surname RLIKE 'вa$')
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'CHECK error for Update';
    END IF;
end //
delimiter ;


delimiter //
create TRIGGER trig3
    before DELETE
    on subject
    for each row
begin
    IF (SELECT COUNT(*) FROM subject) = 2
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Delete error MIN cardinality';
    END IF;
end //
delimiter ;

delimiter //
create TRIGGER trig4
    before insert
    on subject
    for each row
begin
    IF (SELECT COUNT(*) FROM subject) = 6
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insert error MAX cardinality';
    END IF;
end //
delimiter ;


delimiter //
create trigger trig5
    before insert
    on coworker
    for each row
begin
    if (new.seria_and_number_of_passport not RLIKE '^[a-zA-Z][a-zA-Z][ ][0-9]{6}$')
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insert error format of input data';
    END IF;
end //
delimiter ;


delimiter //
create trigger trig6
    before update
    on coworker
    for each row
begin
    if (new.seria_and_number_of_passport not RLIKE '^[a-zA-Z][a-zA-Z][ ][0-9]{6}$')
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insert error format of input data';
    END IF;
end //
delimiter ;


delimiter //
create trigger trig7_a
    before insert
    on coworker
    for each row
begin
    if ((new.position_id not in (select id from position)))
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insert error position_id in table coworker';
    END IF;
end //
delimiter ;

INSERT INTO mydb.coworker(id, name, surname, birthday, experience, position_id, academic_degree_id,
                         academic_status_id, seria_and_number_of_passport)
VALUES (22, 'vqeer', 'Солодаваd', '12.10.2000', 10, 10, 2, 3, 'aa 123456');


delimiter //
create trigger trig7_b
    before insert
    on coworker
    for each row
begin
    if ((new.academic_degree_id not in (select id from academic_degree)))
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insert error academic_degree_id in table coworker';
    END IF;
end //
delimiter ;

delimiter //
create trigger trig7_c
    before insert
    on coworker
    for each row
begin
    if ((new.academic_status_id not in (select id from academic_status)))
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insert error academic_status_id in table coworker';
    END IF;
end //
delimiter ;

# INSERT INTO mydb.coworker(id, name, surname, birthday, experience, position_id, academic_degree_id,
#                          academic_status_id, seria_and_number_of_passport)
# VALUES (18, 'vqeer', 'Солодаваd', '12.10.2000', 6, 2, 2, 3, 'aa 123456');


delimiter //
create trigger trig8
    before insert
    on subject
    for each row
begin
    if (new.type_of_exam_id not in (select id from type_of_exam))
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insert error index in table subject';
    END IF;
end //
delimiter ;


delimiter //
create trigger trig9
    before delete
    on type_of_exam
    for each row
begin
    if (OLD.id in (select type_of_exam_id from subject))
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Delete error index';
    END IF;
end //
delimiter ;

# INSERT into type_of_exam VALUES (7, 'fv');
# delete from type_of_exam where id = 7;


delimiter //
create trigger trig10
    before delete
    on position
    for each row
begin
    if (OLD.id in (select position_id from coworker))
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Delete error index';
    END IF;
end //
delimiter ;

delimiter //
create trigger trig11
    before delete
    on academic_status
    for each row
begin
    if (OLD.id in (select academic_status_id from coworker))
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Delete error index in table academic_status';
    END IF;
end //
delimiter ;

delimiter //
create trigger trig12
    before delete
    on academic_degree
    for each row
begin
    if (OLD.id in (select academic_degree_id from coworker))
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Delete error index in table academic_degree';
    END IF;
end //
delimiter ;

delimiter //
create trigger trig13
    before delete
    on coworker_has_subject
    for each row
begin
    if ((OLD.coworker_id in (select id from coworker)) | (OLD.subject_id in (select id from subject)))
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Delete error index in table coworker_has_subject';
    END IF;
end //

delimiter //
create trigger trig14
    before INSERT
    on coworker_has_subject
    for each row
begin
    if ((new.coworker_id not in (select id from coworker)) | (new.subject_id in (select id from subject)))
    THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insert error index it table coworker_has_subject';
    END IF;
end //

