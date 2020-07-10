DROP TABLE REVIEWS;
CREATE TABLE REVIEWS (
	 RNO NUMBER PRIMARY KEY
	, PNO NUMBER NOT NULL
	, MID VARCHAR2(50) NOT NULL
	, RCONTENT VARCHAR2(1000) NOT NULL
	, RFILENAME VARCHAR2(100)
	, RREGDATE DATE
	, RLIKE NUMBER
	, RRATING NUMBER NOT NULL
);
DROP SEQUENCE REVIEWS_SEQ;
CREATE SEQUENCE REVIEWS_SEQ
START WITH 1001
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;


INSERT INTO REVIEWS (RNO, PNO, MID, RCONTENT, RFILENAME, RREGDATE, RLIKE, RRATING)
VALUES (REVIEWS_SEQ.NEXTVAL, 101, 'korea123', '이 티셔츠의 색감이~~', '' ,SYSDATE, 3, 5);
INSERT INTO REVIEWS (RNO, PNO, MID, RCONTENT, RFILENAME, RREGDATE, RLIKE, RRATING)
VALUES (REVIEWS_SEQ.NEXTVAL, 102, 'korea12', '이 치마의 색감이~~', '' ,SYSDATE, 2, 3);
INSERT INTO REVIEWS (RNO, PNO, MID, RCONTENT, RFILENAME, RREGDATE, RLIKE, RRATING)
VALUES (REVIEWS_SEQ.NEXTVAL, 103, 'story123', '이 바지의 색감이~~', '' ,SYSDATE, 0, 4);
INSERT INTO REVIEWS (RNO, PNO, MID, RCONTENT, RFILENAME, RREGDATE, RLIKE, RRATING)
VALUES (REVIEWS_SEQ.NEXTVAL, 103, 'story12', '이 바지', '' ,SYSDATE, 0, 3);
INSERT INTO REVIEWS (RNO, PNO, MID, RCONTENT, RFILENAME, RREGDATE, RLIKE, RRATING)
VALUES (REVIEWS_SEQ.NEXTVAL, 103, 'story', '이치마의', '' ,SYSDATE, 2, 4);
COMMIT