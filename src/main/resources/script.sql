DROP PROCEDURE IF EXISTS proc1;
DROP PROCEDURE IF EXISTS proc2;
DROP PROCEDURE IF EXISTS proc3;
DROP FUNCTION IF EXISTS func1;


SET GLOBAL log_bin_trust_function_creators = 1;


-- 1
DELIMITER //
CREATE PROCEDURE proc1(`sid` INT, `sName` VARCHAR(45), `sSurname` VARCHAR(45),
                       IN `sBirthday` VARCHAR(45), IN `sExperience` INT, IN `sPositionId` INT,
                       IN `sAcademicDegreeId` INT,
                       IN `sAcademicStatusId` INT, IN `sSeriaNumber` VARCHAR(45))
BEGIN
    INSERT INTO `mydb`.`coworker`(id, name, surname, birthday, experience, position_id, academic_degree_id,
                                  academic_status_id, seria_and_number_of_passport)
    VALUES (sId, sName, sSurname, sBirthday, sExperience, sPositionId, sAcademicDegreeId, sAcademicStatusId,
            sSeriaNumber);
END//
DELIMITER ;


-- 2

DELIMITER //
CREATE PROCEDURE proc2()
BEGIN
    DECLARE num1 INT;
    DECLARE num2 INT;
    DECLARE num3 INT;
    DECLARE num4 INT;
    DECLARE num5 INT;
    DECLARE num6 INT;
    DECLARE num7 INT;
    DECLARE num8 INT;
    DECLARE num9 INT;
    DECLARE num10 INT;

    SET num1 = rand() * 100;
    SET num2 = rand() * 100;
    SET num3 = rand() * 100;
    SET num4 = rand() * 100;
    SET num5 = rand() * 100;
    SET num6 = rand() * 100;
    SET num7 = rand() * 100;
    SET num8 = rand() * 100;
    SET num9 = rand() * 100;
    SET num10 = rand() * 100;

    WHILE num1 = num2
        or num1 = num3
        or num1 = num4
        or num1 = num5
        or num1 = num6
        or num1 = num7
        or num1 = num8
        or num1 = num9
        or num1 = num10
        or num2 = num3
        or num2 = num4
        or num2 = num5
        or num2 = num6
        or num2 = num7
        or num2 = num8
        or num2 = num9
        or num2 = num10
        or num3 = num4
        or num3 = num5
        or num3 = num6
        or num3 = num7
        or num3 = num8
        or num3 = num9
        or num3 = num10
        or num4 = num5
        or num4 = num6
        or num4 = num7
        or num4 = num8
        or num4 = num9
        or num4 = num10
        or num5 = num6
        or num5 = num7
        or num5 = num8
        or num5 = num9
        or num5 = num10
        or num6 = num7
        or num6 = num8
        or num6 = num9
        or num6 = num10
        or num7 = num8
        or num7 = num9
        or num7 = num10
        or num8 = num9
        or num8 = num10
        or num9 = num10
        DO
            SET num1 = rand() * 100;
            SET num2 = rand() * 100;
            SET num3 = rand() * 100;
            SET num4 = rand() * 100;
            SET num5 = rand() * 100;
            SET num6 = rand() * 100;
            SET num7 = rand() * 100;
            SET num8 = rand() * 100;
            SET num9 = rand() * 100;
            SET num10 = rand() * 100;
        END WHILE;


    INSERT INTO mydb.academic_degree(id, name)
    VALUES (1, CONCAT('Noname', num1));
    INSERT INTO mydb.academic_degree(id, name)
    VALUES (2, CONCAT('Noname', num2));
    INSERT INTO mydb.academic_degree(id, name)
    VALUES (3, CONCAT('Noname', num3));
    INSERT INTO mydb.academic_degree(id, name)
    VALUES (4, CONCAT('Noname', num4));
    INSERT INTO mydb.academic_degree(id, name)
    VALUES (5, CONCAT('Noname', num5));
    INSERT INTO mydb.academic_degree(id, name)
    VALUES (6, CONCAT('Noname', num6));
    INSERT INTO mydb.academic_degree(id, name)
    VALUES (7, CONCAT('Noname', num7));
    INSERT INTO mydb.academic_degree(id, name)
    VALUES (8, CONCAT('Noname', num8));
    INSERT INTO mydb.academic_degree(id, name)
    VALUES (9, CONCAT('Noname', num9));
    INSERT INTO mydb.academic_degree(id, name)
    VALUES (10, CONCAT('Noname', num10));
end;
DELIMITER ;

call proc2();


-- 3
Delimiter //
CREATE PROCEDURE proc3()
BEGIN

    DECLARE done int DEFAULT false;
    DECLARE positionT VARCHAR(255);
    DECLARE myCursor CURSOR
        FOR SELECT Name FROM position;
    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET done = true;
    OPEN myCursor;

    SET @temp_query = '
CREATE TABLE IF NOT EXISTS new_table
(
    `id`            INT NOT NULL AUTO_INCREMENT,';

    myLoop:
    LOOP

        FETCH myCursor INTO positionT;

        IF done = true THEN
            LEAVE myLoop;
        END IF;

        SET @temp_query = CONCAT(@temp_query, '`', positionT, '` INT,');
    END LOOP;
    CLOSE myCursor;
    SET @temp_query = CONCAT(@temp_query, 'PRIMARY KEY (`id`)
)');

    PREPARE myQuery FROM @temp_query;
    EXECUTE myQuery;
    DEALLOCATE PREPARE myQuery;
END //
DELIMITER ;

call proc3();


-- 4
DELIMITER //
CREATE FUNCTION func1()
    RETURNS DECIMAL
begin
    return (select avg(coworker.experience) from coworker);
end //
DELIMITER ;

select *
from coworker
where experience > func1();


-- 5
DROP FUNCTION IF EXISTS func2;
DELIMITER //
CREATE FUNCTION func2(tempId INT)
    returns VARCHAR(255)
begin
    return (select name from position where id = tempId);
end //
DELIMITER ;

select id,
       name,
       surname,
       birthday,
       experience,
       func2(position_id) position,
       academic_degree_id,
       academic_status_id,
       seria_and_number_of_passport
from coworker;


-- 6



