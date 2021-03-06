DROP TABLE item_answer CASCADE CONSTRAINTS;
DROP TABLE survey_item CASCADE CONSTRAINTS;
DROP TABLE survey CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
/**********************************/
/* Table Name: 설문 항목 */
/**********************************/
CREATE TABLE survey_item(
		survey_no                     		NUMBER(10)		 NOT NULL,
		item_no                 		    NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item_title                    		VARCHAR2(200)		 NOT NULL,
        seqno                     		    NUMBER(10)		 NOT NULL,
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
VALUES(6, surveyitem_seq.nextval, 'item1');


--목록
SELECT survey_no, item_no, item_title
FROM survey_item 
ORDER BY item_no ASC, survey_no DESC;

SELECT survey_no, item_no, item_title
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



DROP TABLE item_answer CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 설문항목 답변 */
/**********************************/
CREATE TABLE item_answer(
		answer_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item_no                 		    NUMBER(10)		 NOT NULL,
        answer                              VARCHAR2(200)		 NOT NULL,
        seqno                               NUMBER(10)       NOT NULL,
  FOREIGN KEY (item_no) REFERENCES survey_item (item_no)
);

COMMENT ON TABLE item_answer is '설문항목 선택지';
COMMENT ON COLUMN item_answer.answer_no is '선지 번호';
COMMENT ON COLUMN item_answer.item_no is '항목 번호';
COMMENT ON COLUMN item_answer.answer is '선지 내용';
COMMENT ON COLUMN item_answer.seqno is '순서';

DROP SEQUENCE itemanswer_seq;
CREATE SEQUENCE itemanswer_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

-- 등록
INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 2, '예',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 2,'아니오',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1,'보통이다',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1, '그런 편이다',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1, '매우 그렇다',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1, '전혀 그렇지 않다',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1, '그렇지 않은 편이다',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1, '보통이다',1);

INSERT INTO item_answer(answer_no, item_no, answer, seqno)
VALUES(itemanswer_seq.nextval, 1, '그런 편이다',1);




-- 항목별 선지 목록
SELECT answer_no, item_no, answer, seqno
FROM item_answer 
WHERE item_no=2
ORDER BY item_no ASC, answer_no ASC;

-- 항목 조인 목록
SELECT
     row_number() over(order by c.answer_no asc) as r,
     c.answer_no, c.item_no, c.answer, c.seqno,
     e.item_title, e.survey_no, e.seqno
FROM item_answer c
     INNER JOIN survey_item e
     ON c.item_no = e.item_no   
     WHERE c.item_no = '2';
     

commit;

--조회
SELECT  answer_no, item_no, answer, seqno
FROM item_answer
WHERE  answer_no=1;

--수정
UPDATE item_answer 
SET answer='아니오', seqno=2
WHERE answer_no=2;


--삭제
DELETE FROM item_answer
WHERE answer_no=9;  
  
DELETE FROM item_answer;   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
