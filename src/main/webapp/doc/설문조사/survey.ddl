DROP TABLE item_answer CASCADE CONSTRAINTS;
DROP TABLE survey_item CASCADE CONSTRAINTS;
DROP TABLE survey CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;

COMMIT;


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		M_NO                          		NUMBER(6)		 NOT NULL		 PRIMARY KEY,
		ID                            		VARCHAR2(20)		 NOT NULL,
		PASSWD                        		VARCHAR2(60)		 NOT NULL,
		MNAME                         		VARCHAR2(20)		 NOT NULL,
		EMAIL                         		VARCHAR2(60)		 NOT NULL,
		TEL                           		VARCHAR2(14)		 NOT NULL,
		ZIPCODE                       		VARCHAR2(5)		 NULL ,
		ADDRESS1                      		VARCHAR2(80)		 NULL ,
		ADDRESS2                      		VARCHAR2(50)		 NULL ,
		MDATE                         		DATE		 NOT NULL,
  CONSTRAINT SYS_C008370 UNIQUE (ID)
);

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.M_NO is '회원 번호';
COMMENT ON COLUMN MEMBER.ID is '아이디';
COMMENT ON COLUMN MEMBER.PASSWD is '패스워드';
COMMENT ON COLUMN MEMBER.MNAME is '성명';
COMMENT ON COLUMN MEMBER.EMAIL is '이메일';
COMMENT ON COLUMN MEMBER.TEL is '전화번호';
COMMENT ON COLUMN MEMBER.ZIPCODE is '우편번호';
COMMENT ON COLUMN MEMBER.ADDRESS1 is '주소1';
COMMENT ON COLUMN MEMBER.ADDRESS2 is '주소2';
COMMENT ON COLUMN MEMBER.MDATE is '가입일';

-- 컬럼 수정
ALTER TABLE survey
MODIFY (continueyn VARCHAR2(5));

-- 컬럼 추가
ALTER TABLE survey ADD seqno NUMBER(10) DEFAULT 1 NOT NULL;
ALTER TABLE survey_item ADD seqno NUMBER(10) DEFAULT 1 NOT NULL;

/**********************************/
/* Table Name: 설문조사 */
/**********************************/
CREATE TABLE survey(
		survey_no                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
        seqno                               NUMBER(10)       NOT NULL,
		title                  		        VARCHAR2(100)		 NOT NULL,
		startdate                    		VARCHAR2(30)		 NOT NULL,
		enddate                      		VARCHAR2(30)		 NOT NULL,
		cnt                           		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		continueyn                    		VARCHAR2(5)		 DEFAULT 'Y'		 NOT NULL,
        seqno                     		    NUMBER(10)		 NOT NULL,
		survey_result                 		VARCHAR2(100)		 NULL                               
);

COMMENT ON TABLE survey is '설문조사';
COMMENT ON COLUMN survey.survey_no is '설문 번호';
COMMENT ON COLUMN survey.title is '제목';
COMMENT ON COLUMN survey.startdate is '시작일';
COMMENT ON COLUMN survey.enddate is '종료일';
COMMENT ON COLUMN survey.cnt is '참여 인원수';
COMMENT ON COLUMN survey.continueyn is '상태';
COMMENT ON COLUMN survey.seqno is '순서';
COMMENT ON COLUMN survey.survey_result is '설문결과';

DROP SEQUENCE survey_seq;
CREATE SEQUENCE survey_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO survey(survey_no, title, startdate, enddate, cnt, continueyn, survey_result)
VALUES(survey_seq.nextval, '만족도 조사9', '2020-11-04', '2020-11-11', 1,'N','결과보기');

INSERT INTO survey(survey_no, title, startdate, enddate, cnt, continueyn, survey_result)
VALUES(survey_seq.nextval, '만족도 조사10', '2020-12-04', '2021-1-11', 1,'N','결과보기');

INSERT INTO survey(survey_no, title, startdate, enddate, cnt, continueyn, survey_result)
VALUES(survey_seq.nextval, '만족도 조사7', '2021-1-07', '2021-1-17', 1,'N','결과보기');

INSERT INTO survey(survey_no, title, startdate, enddate, cnt, survey_result)
VALUES(survey_seq.nextval, '만족도 조사8', '2021-1-22', '2021-2-11', 1, '결과보기');

--목록
SELECT survey_no, title, startdate, enddate, cnt, continueyn, survey_result
FROM survey 
ORDER BY survey_no DESC;

commit;

--조회
SELECT survey_no, title, startdate, enddate, cnt, continueyn, survey_result
FROM survey 
WHERE survey_no=11;

--수정
UPDATE survey 
SET title='설문TEST4', startdate='2020.01.10', enddate='2020.01.21', continueyn='Y'
WHERE survey_no=4;

-- continueyn 변경
UPDATE survey
SET continueyn = 'N'
WHERE survey_no = 11;

--삭제
DELETE FROM survey
WHERE survey_no=12;

DROP TABLE survey_item CASCADE CONSTRAINTS;



-- 컬럼 추가
ALTER TABLE survey_item ADD rcnt NUMBER(10) DEFAULT 0 NOT NULL;

/**********************************/
/* Table Name: 설문 항목 */
/**********************************/
CREATE TABLE survey_item(
		survey_no                     		NUMBER(10)		 NOT NULL,
		item_no                 		    NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item_title                    		VARCHAR2(200)		 NOT NULL,
        seqno                     		    NUMBER(10)		 NOT NULL,
        rcnt                                NUMBER(10)       DEFAULT 0  NOT NULL,
  FOREIGN KEY (survey_no) REFERENCES survey (survey_no)
);

COMMENT ON TABLE survey_item is '설문 항목';
COMMENT ON COLUMN survey_item.survey_no is '설문 번호';
COMMENT ON COLUMN survey_item.item_no is '설문 항목 번호';
COMMENT ON COLUMN survey_item.item_title is '설문 항목 제목';
COMMENT ON COLUMN survey_item.seqno is '순서';

DROP SEQUENCE surveyitem_seq;
CREATE SEQUENCE surveyitem_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(1, surveyitem_seq.nextval,'item1');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(2, surveyitem_seq.nextval,'item1');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(3, surveyitem_seq.nextval,'item1');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(4, surveyitem_seq.nextval, 'item1');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(5, surveyitem_seq.nextval, 'item1');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(1, surveyitem_seq.nextval, '1');


--목록
SELECT survey_no, item_no, item_title, rcnt
FROM survey_item 
ORDER BY item_no ASC, survey_no DESC;

SELECT survey_no, item_no, item_title, rcnt
FROM survey_item 
WHERE survey_no=6
ORDER BY item_no;

commit;

--조회
SELECT survey_no, item_no, item_title
FROM survey_item 
WHERE item_no=2;

--수정
UPDATE survey_item 
SET item_title='이 사이트를 지속적으로 이용할 의향이 있으십니까?', seqno=2
WHERE item_no=2;

--삭제
DELETE FROM survey_item
WHERE item_no=7;

DELETE FROM survey_item;

-- 집계 수 증가
UPDATE survey_item 
SET rcnt = rcnt + 1 
WHERE item_no=6;

-- 집계 수 감소
UPDATE survey_item 
SET rcnt = rcnt - 1 
WHERE item_no=6;


DROP TABLE item_optioin CASCADE CONSTRAINTS;



/**********************************/
/* Table Name: 설문항목 답변 */
/**********************************/
CREATE TABLE item_option(
		option_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item_no                 		    NUMBER(10)		 NOT NULL,
        option_name                              VARCHAR2(200)		 NOT NULL,
        seqno                               NUMBER(10)       NOT NULL,
  FOREIGN KEY (item_no) REFERENCES survey_item (item_no)
);

COMMENT ON TABLE item_option is '설문항목 선택지';
COMMENT ON COLUMN item_option.option_no is '선지 번호';
COMMENT ON COLUMN item_option.item_no is '항목 번호';
COMMENT ON COLUMN item_option.option_name is '선지 내용';
COMMENT ON COLUMN item_option.seqno is '순서';

DROP SEQUENCE itemoption_seq;
CREATE SEQUENCE itemoption_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

-- 등록
INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 2, '예',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 2,'아니오',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1,'보통이다',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1, '그런 편이다',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1, '매우 그렇다',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1, '전혀 그렇지 않다',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1, '그렇지 않은 편이다',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1, '보통이다',1);

INSERT INTO item_option(option_no, item_no, option_name, seqno)
VALUES(itemoption_seq.nextval, 1, '그런 편이다',1);




-- 항목별 선지 목록
SELECT option_no, item_no, option_name, seqno
FROM item_option 
WHERE item_no=2
ORDER BY item_no ASC, option_no ASC;

-- 항목 조인 목록
SELECT
     row_number() over(order by c.option_no asc) as r,
     c.option_no, c.item_no, c.option_name, c.seqno,
     e.item_title, e.survey_no, e.seqno
FROM item_option c
     INNER JOIN survey_item e
     ON c.item_no = e.item_no   
     WHERE c.item_no = '2';
     

commit;

--조회
SELECT  option_no, item_no, option_name, seqno
FROM item_option
WHERE  option_no=1;

--수정
UPDATE item_option 
SET option_name='아니오', seqno=2
WHERE option_no=2;


--삭제
DELETE FROM item_option
WHERE option_no=9;  
  
DELETE FROM item_option;   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
