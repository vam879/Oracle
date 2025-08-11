-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 16:22:00 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cart (
    cartno       INTEGER NOT NULL,
    userid       VARCHAR2(20) NOT NULL,
    prodno       INTEGER NOT NULL,
    cartproddate INTEGER,
    column_5     DATE
);

ALTER TABLE cart ADD CONSTRAINT cart_pk PRIMARY KEY ( cartno );

CREATE TABLE category (
    cateno   INTEGER NOT NULL,
    catename VARCHAR2(100)
);

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( cateno );

CREATE TABLE orders (
    orderno         CHAR(11) NOT NULL,
    userid          VARCHAR2(20) NOT NULL,
    ordertotalprice INTEGER,
    orderaddress    VARCHAR2(200),
    orderstatus     INTEGER,
    orderdate       DATE
);

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( orderno );

CREATE TABLE ordersitem (
    itemno       INTEGER NOT NULL,
    orderno      CHAR(11) NOT NULL,
    prodno       INTEGER NOT NULL,
    itemprice    INTEGER,
    itemdiscount INTEGER,
    itemcount    INTEGER
);

ALTER TABLE ordersitem ADD CONSTRAINT ordersitem_pk PRIMARY KEY ( itemno );

CREATE TABLE point (
    "pointNo " INTEGER NOT NULL,
    userid     VARCHAR2(20) NOT NULL,
    point      INTEGER,
    "desc"     VARCHAR2(100),
    pointdate  DATE
);

ALTER TABLE point ADD CONSTRAINT point_pk PRIMARY KEY ( "pointNo " );

CREATE TABLE product (
    prodno          INTEGER NOT NULL,
    cateno          INTEGER NOT NULL,
    sellerno        INTEGER,
    prodname        VARCHAR2(50),
    prodprice       INTEGER,
    prodstock       INTEGER,
    prodsold        INTEGER,
    proddiscount    INTEGER,
    seller_sellerno INTEGER
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prodno );

CREATE TABLE seller (
    sellerno INTEGER NOT NULL,
    company  VARCHAR2(100),
    tel      VARCHAR2(20),
    manager  VARCHAR2(20),
    address  VARCHAR2(100)
);

ALTER TABLE seller ADD CONSTRAINT 판매자_pk PRIMARY KEY ( sellerno );

CREATE TABLE "User" (
    userid  VARCHAR2(20) NOT NULL,
    name    VARCHAR2(20),
    birth   CHAR(10),
    gender  CHAR(1),
    hp      CHAR(13),
    email   VARCHAR2(100),
    point   INTEGER,
    "level" INTEGER,
    address VARCHAR2(100),
    regdate DATE
);

ALTER TABLE "User" ADD CONSTRAINT customer_pk PRIMARY KEY ( userid );

ALTER TABLE cart
    ADD CONSTRAINT cart_product_fk FOREIGN KEY ( prodno )
        REFERENCES product ( prodno );

ALTER TABLE cart
    ADD CONSTRAINT cart_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE orders
    ADD CONSTRAINT orders_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE ordersitem
    ADD CONSTRAINT ordersitem_orders_fk FOREIGN KEY ( orderno )
        REFERENCES orders ( orderno );

ALTER TABLE ordersitem
    ADD CONSTRAINT ordersitem_product_fk FOREIGN KEY ( prodno )
        REFERENCES product ( prodno );

ALTER TABLE point
    ADD CONSTRAINT point_user_fk FOREIGN KEY ( userid )
        REFERENCES "User" ( userid );

ALTER TABLE product
    ADD CONSTRAINT product_category_fk FOREIGN KEY ( cateno )
        REFERENCES category ( cateno );

ALTER TABLE product
    ADD CONSTRAINT product_seller_fk FOREIGN KEY ( seller_sellerno )
        REFERENCES seller ( sellerno );



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0


//USER
INSERT INTO USER ('user1', '김유신', '1976-01-21', 'M', '010-1101-1976', 'kimys@naver.com', 7000, 1, '서울', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "User" (userid, name, birth, gender, hp, email, point, "level", address, regdate) VALUES 
('user2', '계백', '1975-06-11', 'M', '010-1102-1975', NULL, 5650, 1, '서울', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "User" (userid, name, birth, gender, hp, email, point, "level", address, regdate) VALUES 
('user3', '김춘추', '1989-05-30', 'M', '010-1103-1989', NULL, 4320, 2, '서울', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "User" (userid, name, birth, gender, hp, email, point, "level", address, regdate) VALUES 
('user4', '이사부', '1979-04-13', 'M', '010-2101-1979', 'leesabu@gmail.com', 0, 1, '서울', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "User" (userid, name, birth, gender, hp, email, point, "level", address, regdate) VALUES 
('user5', '장보고', '1966-09-12', 'M', '010-2104-1966', 'jangbg@naver.com', 3000, 4, '대전', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "User" (userid, name, birth, gender, hp, email, point, "level", address, regdate) VALUES 
('user6', '선덕여왕', '1979-07-28', 'M', '010-3101-1979', 'gueen@naver.com', 15840, 2, '대전', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "User" (userid, name, birth, gender, hp, email, point, "level", address, regdate) VALUES 
('user7', '강감찬', '1984-06-15', 'F', '010-4101-1984', 'kang@daum.net', 3610, 0, '대구', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "User" (userid, name, birth, gender, hp, email, point, "level", address, regdate) VALUES 
('user8', '신사임당', '1965-10-21', 'M', '010-5101-1965', 'sinsa@gmail.com', 0, 1, '대구', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "User" (userid, name, birth, gender, hp, email, point, "level", address, regdate) VALUES 
('user9', '이이', '1972-11-28', 'F', '010-6101-1972', 'leelee@nate.com', 0, 3, '부산', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO "User" (userid, name, birth, gender, hp, email, point, "level", address, regdate) VALUES 
('user10', '허난설헌', '1992-09-07', 'F', '010-7103-1992', NULL, 0, 3, '광주', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));


/// POINT
INSERT INTO point ( "pointNo ", userid, point, "desc", pointdate ) VALUES 
(1, 'user1', 1000, '회원가입 1000 적립', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO point ( "pointNo ", userid, point, "desc", pointdate ) VALUES 
(2, 'user1', 6000, '상품구매 5% 적립', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO point ( "pointNo ", userid, point, "desc", pointdate ) VALUES 
(3, 'user3', 2820, '상품구매 5% 적립', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO point ( "pointNo ", userid, point, "desc", pointdate ) VALUES 
(4, 'user7', 3610, '상품구매 5% 적립', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO point ( "pointNo ", userid, point, "desc", pointdate ) VALUES 
(5, 'user5', 3000, '이벤트 응모 3000 적립', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO point ( "pointNo ", userid, point, "desc", pointdate ) VALUES 
(6, 'user2', 1000, '회원가입 1000 적립', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO point ( "pointNo ", userid, point, "desc", pointdate ) VALUES 
(7, 'user2', 2000, '이벤트 응모 2000 적립', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO point ( "pointNo ", userid, point, "desc", pointdate ) VALUES 
(8, 'user2', 2650, '상품구매 5% 적립', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO point ( "pointNo ", userid, point, "desc", pointdate ) VALUES 
(9, 'user3', 1500, '이벤트 응모 1500 적립', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO point ( "pointNo ", userid, point, "desc", pointdate ) VALUES 
(10, 'user6', 15840, '상품구매 2% 적립', TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));


//SELLER

INSERT INTO seller (sellerno, company, tel, manager, address) 
VALUES (10001, '(주)다팔아', '02-201-1976', '정우성', '서울');

INSERT INTO seller (sellerno, company, tel, manager, address) 
VALUES (10002, '판매의민족', '02-102-1975', '이정재', '서울');

INSERT INTO seller (sellerno, company, tel, manager, address) 
VALUES (10003, '멋남', '031-103-1989', '원빈', '경기');

INSERT INTO seller (sellerno, company, tel, manager, address) 
VALUES (10004, '스타일살아', '032-201-1979', '이나영', '경기');

INSERT INTO seller (sellerno, company, tel, manager, address) 
VALUES (10005, '(주)삼성전자', '02-214-1966', '장동건', '서울');

INSERT INTO seller (sellerno, company, tel, manager, address) 
VALUES (10006, '복실이옷짱', '051-301-1979', '고소영', '부산');

INSERT INTO seller (sellerno, company, tel, manager, address) 
VALUES (10007, '컴퓨존(주)', '055-401-1984', '유재석', '대구');

INSERT INTO seller (sellerno, company, tel, manager, address) 
VALUES (10008, '(주)LG전자', '02-511-1965', '강호동', '서울');

INSERT INTO seller (sellerno, company, tel, manager, address) 
VALUES (10009, '굿바디스포츠', '070-6101-1972', '조인성', '부산');

INSERT INTO seller (sellerno, company, tel, manager, address) 
VALUES (10010, '누리푸드', '051-710-1992', '강동원', '부산');


//CATEGORY
INSERT INTO category (cateno, catename) VALUES (10, '여성의류패션');
INSERT INTO category (cateno, catename) VALUES (11, '남성의류패션');
INSERT INTO category (cateno, catename) VALUES (12, '식품·생필품');
INSERT INTO category (cateno, catename) VALUES (13, '취미·반려견');
INSERT INTO category (cateno, catename) VALUES (14, '홈·문구');
INSERT INTO category (cateno, catename) VALUES (15, '자동차·공구');
INSERT INTO category (cateno, catename) VALUES (16, '스포츠·건강');
INSERT INTO category (cateno, catename) VALUES (17, '컴퓨터·가전·디지털');
INSERT INTO category (cateno, catename) VALUES (18, '여행');
INSERT INTO category (cateno, catename) VALUES (19, '도서');

//PRODUCT
INSERT INTO product (prodno, cateno, sellerno, prodname, prodstock, prodprice, prodsold, proddiscount) VALUES (100101, 11, 10003, '반팔티 L~2XL', 869, 25000, 132, 20);
INSERT INTO product (prodno, cateno, sellerno, prodname, prodstock, prodprice, prodsold, proddiscount) VALUES (100110, 10, 10004, '트레이닝 통바지', 1602, 38000, 398, 15);
INSERT INTO product (prodno, cateno, sellerno, prodname, prodstock, prodprice, prodsold, proddiscount) VALUES (110101, 10, 10003, '신상 여성운동화', 160, 76000, 40, 5);
INSERT INTO product (prodno, cateno, sellerno, prodname, prodstock, prodprice, prodsold, proddiscount) VALUES (120101, 12, 10010, '암소 1등급 구이셋트 1.2kg', 0, 150000, 87, 15);
INSERT INTO product (prodno, cateno, sellerno, prodname, prodstock, prodprice, prodsold, proddiscount) VALUES (120103, 12, 10010, '바로구이 부채살 250g', 0, 21000, 61, 10);
INSERT INTO product (prodno, cateno, sellerno, prodname, prodstock, prodprice, prodsold, proddiscount) VALUES (130101, 13, 10006, '[ANF] 식스프리 강아지 사료', 58, 56000, 142, 0);
INSERT INTO product (prodno, cateno, sellerno, prodname, prodstock, prodprice, prodsold, proddiscount) VALUES (130112, 13, 10006, '중대형 사계절 강아지옷', 120, 15000, 80, 0);
INSERT INTO product (prodno, cateno, sellerno, prodname, prodstock, prodprice, prodsold, proddiscount) VALUES (141001, 14, 10001, '라떼 2인 소파/방수 패브릭', 0, 320000, 42, 0);
INSERT INTO product (prodno, cateno, sellerno, prodname, prodstock, prodprice, prodsold, proddiscount) VALUES (170115, 17, 10007, '지포스 3080 그래픽카드', 28, 900000, 12, 12);
INSERT INTO product (prodno, cateno, sellerno, prodname, prodstock, prodprice, prodsold, proddiscount) VALUES (160103, 16, 10009, '치닝디핑 33BR 철봉', 32, 120000, 28, 0);

//ORDERS

INSERT INTO orders (orderno, userid, ordertotalprice, orderaddress, orderstatus, orderdate) VALUES ('22010210001', 'user2', 52300, '서울시 마포구 121', 1, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (orderno, userid, ordertotalprice, orderaddress, orderstatus, orderdate) VALUES ('22010210002', 'user3', 56700, '서울시 강남구 21-1', 1, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (orderno, userid, ordertotalprice, orderaddress, orderstatus, orderdate) VALUES ('22010210010', 'user4', 72200, '서울시 강서구 큰대로 38', 2, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (orderno, userid, ordertotalprice, orderaddress, orderstatus, orderdate) VALUES ('22010310001', 'user5', 127000, '경기도 광주시 초월로 21', 1, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (orderno, userid, ordertotalprice, orderaddress, orderstatus, orderdate) VALUES ('22010310100', 'user1', 120000, '경기도 수원시 120번지', 0, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (orderno, userid, ordertotalprice, orderaddress, orderstatus, orderdate) VALUES ('22010410101', 'user6', 792000, '부산시 남구 21-1', 2, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (orderno, userid, ordertotalprice, orderaddress, orderstatus, orderdate) VALUES ('22010510021', 'user7', 92200, '부산시 부산진구 56 10층', 4, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (orderno, userid, ordertotalprice, orderaddress, orderstatus, orderdate) VALUES ('22010510027', 'user8', 112000, '대구시 팔달로 19', 3, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (orderno, userid, ordertotalprice, orderaddress, orderstatus, orderdate) VALUES ('22010510031', 'user10', 792000, '대전시 한밭로 24-1', 2, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders (orderno, userid, ordertotalprice, orderaddress, orderstatus, orderdate) VALUES ('22010710110', 'user9', 94500, '광주시 충열로 11', 1, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
//ORDERSITEM

INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (1, '22010210001', 100110, 38000, 15, 1);
INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (2, '22010210001', 100101, 25000, 20, 1);
INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (3, '22010210002', 120103, 21000, 10, 3);
INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (4, '22010310001', 130112, 15000, 0, 1);
INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (5, '22010310001', 130101, 56000, 0, 2);
INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (6, '22010210010', 110101, 76000, 5, 1);
INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (7, '22010310100', 160103, 120000, 0, 1);
INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (8, '22010410101', 170115, 900000, 12, 1);
INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (9, '22010510021', 110101, 76000, 5, 1);
INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (10, '22010510027', 130101, 56000, 0, 2);
INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (11, '22010510021', 100101, 25000, 20, 1);
INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (12, '22010510031', 170115, 900000, 12, 1);
INSERT INTO ordersitem (itemno, orderno, prodno, itemprice, itemdiscount, itemcount) VALUES (13, '22010710110', 120103, 21000, 10, 5);
//CART

INSERT INTO cart (cartno, userid, prodno, cartproddate, column_5) VALUES (1, 'user1', 100101, 1, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO cart (cartno, userid, prodno, cartproddate, column_5) VALUES (2, 'user1', 100110, 2, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO cart (cartno, userid, prodno, cartproddate, column_5) VALUES (3, 'user3', 120103, 1, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO cart (cartno, userid, prodno, cartproddate, column_5) VALUES (4, 'user4', 130112, 1, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO cart (cartno, userid, prodno, cartproddate, column_5) VALUES (5, 'user5', 130101, 1, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO cart (cartno, userid, prodno, cartproddate, column_5) VALUES (6, 'user2', 110101, 3, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO cart (cartno, userid, prodno, cartproddate, column_5) VALUES (7, 'user2', 160103, 1, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO cart (cartno, userid, prodno, cartproddate, column_5) VALUES (8, 'user2', 170115, 1, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO cart (cartno, userid, prodno, cartproddate, column_5) VALUES (9, 'user3', 110101, 1, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO cart (cartno, userid, prodno, cartproddate, column_5) VALUES (10, 'user6', 130101, 1, TO_DATE('2022-01-10 10:50:12', 'YYYY-MM-DD HH24:MI:SS'));


















/////////////////////////////////문제////////////////////////////////
//1번
SELECT u.name AS 고객명, p.prodname AS 상품명, c.cartproddate AS 상품수량
FROM cart c
JOIN "User" u ON c.userid = u.userid
JOIN product p ON c.prodno = p.prodno
WHERE c.cartproddate >= 2;

//2번
SELECT p.prodno,
       c.catename AS 상품카테고리명,
       p.prodname, 
       p.prodprice, 
       s.company AS 판매자이름, 
       s.tel AS 판매자연락처
FROM product p
JOIN category c ON p.cateno = c.cateno
JOIN seller s ON p.seller_sellerno = s.sellerno;
//3번
SELECT u.userid, u.name, u.hp, u.point AS 현재포인트,
       NVL(SUM(pt.point), 0) AS 적립포인트총합
FROM "User" u
LEFT JOIN point pt ON u.userid = pt.userid
GROUP BY u.userid, u.name, u.hp, u.point;
//4번
SELECT o.orderno, 
       o.userid, 
       u.name, 
       o.ordertotalprice, 
       o.orderdate
FROM orders o
JOIN "User" u ON o.userid = u.userid
WHERE o.ordertotalprice >= 100000
ORDER BY o.ordertotalprice DESC, u.name ASC;
//5번
SELECT o.orderno, o.userid, u.name,
       LISTAGG(p.prodname, ',') 
       WITHIN GROUP (ORDER BY p.prodname) AS 상품명,
       o.orderdate
FROM orders o
JOIN "User" u ON o.userid = u.userid
JOIN ordersitem oi ON o.orderno = oi.orderno
JOIN product p ON oi.prodno = p.prodno
GROUP BY o.orderno, o.userid, u.name, o.orderdate;
//6번
SELECT prodno, prodname, prodprice, proddiscount,
       ROUND(prodprice * (1 - proddiscount / 100), 0) AS 할인된가격
FROM product;
//7번
SELECT p.prodno, p.prodname, p.prodprice, p.prodstock, s.company AS 판매자이름
FROM product p
JOIN seller s ON p.seller_sellerno = s.sellerno
WHERE s.manager = '고소영';
//8번
SELECT s.sellerno, s.company, s.manager, s.tel
FROM seller s
LEFT JOIN product p ON s.sellerno = p.seller_sellerno
WHERE p.prodno IS NULL;
//9번
SELECT oi.orderno,
       SUM(oi.itemprice * oi.itemcount * (1 - oi.itemdiscount / 100)) AS 최종총합
FROM ordersitem oi
GROUP BY oi.orderno
HAVING SUM(oi.itemprice * oi.itemcount * (1 - oi.itemdiscount / 100)) >= 100000
ORDER BY 최종총합 DESC;
//10번
SELECT u.name AS 고객명,
       LISTAGG(DISTINCT p.prodname, ',') WITHIN GROUP (ORDER BY p.prodname) AS 상품명
FROM orders o
JOIN "User" u ON o.userid = u.userid
JOIN ordersitem oi ON o.orderno = oi.orderno
JOIN product p ON oi.prodno = p.prodno
WHERE u.name = '장보고'
GROUP BY u.name;






















