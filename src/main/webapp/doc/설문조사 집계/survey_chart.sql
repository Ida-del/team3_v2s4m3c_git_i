-- 테이블 삭제
DROP TABLE survey_chart CASCADE CONSTRAINTS;
DROP TABLE survey_item CASCADE CONSTRAINTS;
DROP TRIGGER uptodate_surveychart;

-- 생성 순서 : 1.survey_item -> 2.survey_chart -> 3.uptodate_surveychart 트리거
/**********************************/
/* Table Name: 설문조사 항목 */
/**********************************/
CREATE TABLE survey_item(
		survey_no                     		NUMBER(10)		 NOT NULL,
		item_no                 		    NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		item_title                    		VARCHAR2(200)		 NOT NULL,
        seqno                     		    NUMBER(10)		DEFAULT 1 NOT NULL,
        rcnt                                NUMBER(10)      DEFAULT 0  NOT NULL,
  FOREIGN KEY (survey_no) REFERENCES survey (survey_no)
);

COMMENT ON TABLE survey_item is '설문 항목';
COMMENT ON COLUMN survey_item.item_no is '설문 항목 번호';
COMMENT ON COLUMN survey_item.survey_no is '설문 번호';
COMMENT ON COLUMN survey_item.seqno is '순서';
COMMENT ON COLUMN survey_item.item_title is '설문 항목 제목';
COMMENT ON COLUMN survey_item.rcnt is '집계';


DROP SEQUENCE surveyitem_seq;
CREATE SEQUENCE surveyitem_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지




/**********************************/
/* Table Name: 설문 집계 */
/**********************************/
CREATE TABLE survey_chart(
        item_no                             NUMBER(10)		 NOT NULL PRIMARY KEY,
		survey_no                     		NUMBER(10)		 NOT NULL,
		item                    		VARCHAR2(200)    NOT NULL,
        seqno                     		    NUMBER(10)		DEFAULT 1 NOT NULL,
        cnt                                NUMBER(10)       DEFAULT 0  NOT NULL,
        FOREIGN KEY (survey_no) REFERENCES survey (survey_no)
);

COMMENT ON TABLE survey_chart is '설문 집계 ';
COMMENT ON COLUMN survey_chart.item_no is '설문 항목 번호';
COMMENT ON COLUMN survey_chart.survey_no is '설문 번호';
COMMENT ON COLUMN survey_chart.item is '항목';
COMMENT ON COLUMN survey_chart.cnt is '집계';
COMMENT ON COLUMN survey_chart.seqno is '순서';

-- survey_item의 레코드를 survey_chart에 복사
INSERT INTO survey_chart(item_no,item,survey_no) 
SELECT item_no,item_title,survey_no
FROM survey_item;
/*********************************************************/
/* ★         Trigger Name: uptodate_surveychart      ★  */
/*********************************************************/
DROP TRIGGER uptodate_surveychart;
-- 설문항목 테이블과 설문 집계 테이블의 동기화
CREATE OR REPLACE TRIGGER uptodate_surveychart
AFTER DELETE OR INSERT OR UPDATE
ON survey_item
FOR EACH ROW
DECLARE
BEGIN
 if inserting then
    insert into survey_chart(item_no, survey_no, item) 
    values (:NEW.item_no , :NEW.survey_no ,:NEW.item_title);
 elsif updating then
  update survey_chart 
  set   cnt   = cnt + :NEW.rcnt,
        seqno = :NEW.seqno,
        item = :NEW.item_title
  where item_no = :OLD.item_no;
 elsif deleting then
  delete from survey_chart
  where item_no = :OLD.item_no;
 else
   null;
 end if;
END;

COMMIT;

-- 등록
INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(1, surveyitem_seq.nextval,'그렇다');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(1, surveyitem_seq.nextval,'아니다');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval,'전혀 그렇지 않다');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval,'그렇지 않은 편이다');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval,'보통이다');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval,'그런 편이다.');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval,'매우 그렇다');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval, '');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(6, surveyitem_seq.nextval, '2)아니오');

INSERT INTO survey_item(survey_no, item_no, item_title)
VALUES(1, surveyitem_seq.nextval, '1');


--목록
SELECT survey_no, item_no, item, cnt
FROM survey_chart
ORDER BY item_no ASC, survey_no DESC;

SELECT survey_no, item_no, item_title, rcnt
FROM survey_item 
ORDER BY item_no, survey_no DESC;

commit;

--조회
SELECT survey_no, item_no, item_title
FROM survey_item 
WHERE item_no=2;

--수정
UPDATE survey_item 
SET item_title='예', seqno=2
WHERE item_no=2;

--삭제
DELETE FROM survey_item
WHERE item_no=7;

DELETE FROM survey_item;

-- 집계 수 증가
UPDATE survey_item 
SET rcnt = rcnt + 1 
WHERE item_no=1;

-- 집계 수 감소
UPDATE survey_item 
SET rcnt = rcnt - 1 
WHERE item_no=1;





DELETE FROM survey_chart;





-- 목록
SELECT item_no, item_title, rcnt, survey_no
FROM survey_chart
ORDER BY item_no ASC;
  
-- 특정 설문의 집계 데이터 조회
SELECT item_no, item_title, rcnt, survey_no
FROM survey_chart
WHERE survey_no=7;
  
COMMIT; 
  
  
  
  
  
  
  
  