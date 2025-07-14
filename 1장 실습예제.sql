CREATE TABLE TYPE_TEST_NUMBER(
    num1 NUMBER,
    num2 NUMBER(2),
    num3 NUMBER(3,1),
    num4 NUMBER(4,2),
    num5 NUMBER(5,6),
    num6 NUMBER(6, -1)
);
//num1 NUMBER
insert into TYPE_TEST_NUMBER (num1) values (1);
insert into TYPE_TEST_NUMBER (num1) values (123);
insert into TYPE_TEST_NUMBER (num1) values (123.74);
insert into TYPE_TEST_NUMBER (num1) values (123.12345);

//num2 NUMBER(2)
insert into TYPE_TEST_NUMBER (num2) values (12);
insert into TYPE_TEST_NUMBER (num2) values (1.2);
insert into TYPE_TEST_NUMBER (num2) values (1.23);
insert into TYPE_TEST_NUMBER (num2) values (12.34567);
insert into TYPE_TEST_NUMBER (num2) values (12.56789);

//num3 NUMBER(3,1)
insert into TYPE_TEST_NUMBER (num3) values (12);
insert into TYPE_TEST_NUMBER (num3) values (12.1);
insert into TYPE_TEST_NUMBER (num3) values (12.1234);
insert into TYPE_TEST_NUMBER (num3) values (12.56789);

// 문자형 자료형 이해
CREATE TABLE TYPE_TEST_CHAR(
    char1 CHAR(1),
    char2 CHAR(2),
    char3 CHAR(3),
    vchar1 VARCHAR2(1),
    vchar2 VARCHAR2(2),
    vchar3 VARCHAR2(3),
    nvchar1 NVARCHAR2(1),
    nvchar2 NVARCHAR2(2),
    nvchar3 NVARCHAR2(3)
);

//CHAR
insert into TYPE_TEST_CHAR (char1) values ('A');
insert into TYPE_TEST_CHAR (char3) values ('가');

//VARCHAR2
insert into TYPE_TEST_CHAR (vchar1) values ('A');
insert into TYPE_TEST_CHAR (vchar2) values ('AB');
insert into TYPE_TEST_CHAR (vchar3) values ('가');

//NVARCHAR2
insert into TYPE_TEST_CHAR (nvchar1) values ('A');
insert into TYPE_TEST_CHAR (nvchar2) values ('AB');
insert into TYPE_TEST_CHAR (nvchar3) values ('가나다');


//실습하기 1-4. 테이블 생성
CREATE TABLE USER1 (
    USER_ID VARCHAR2(20),
    NAME    VARCHAR2(20),
    HP      CHAR(13),
    AGE     NUMBER
);
//실습하기1-5
INSERT INTO USER1 VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO USER1 VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO USER1 VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO USER1 (user_id, name, age) VALUES ('A104', '강감찬', 45);
INSERT INTO USER1 (user_id, name, hp) VALUES ('A105', '이순신', '010-1234-5555');

//실습하기 1-6
SELECT * FROM USER1;
SELECT * FROM USER1 WHERE USER_ID = 'A101';
SELECT * FROM USER1 WHERE name = '김춘추';
SELECT * FROM USER1 WHERE age > 30;
SELECT user_id, name, age FROM USER1;

//실습하기 1-7
UPDATE USER1 SET hp='010-1234-4444' WHERE user_id = 'A104';
UPDATE USER1 SET age=51 WHERE user_id = 'A105';
UPDATE USER1 SET HP = '010-1234-1001', AGE = 27 WHERE user_id = 'A101';

//실습하기 1-8
DELETE FROM User1 WHERE USER_ID = 'A101';
DELETE FROM USER1 WHERE USER_ID = 'A102' AND AGE = 25;
DELETE FROM USER1 WHERE AGE >= 30;