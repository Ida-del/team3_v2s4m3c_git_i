/**********************************/
/* Table Name: 설문 항목 */
/**********************************/
CREATE TABLE survey_item(
    survey_no                         NUMBER(10)     NOT NULL,
    item_no                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    item_title                        VARCHAR2(200)    NOT NULL,
        seqno                             NUMBER(10)     NOT NULL,
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