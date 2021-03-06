/**********************************/
/* Table Name: ���� �׸� */
/**********************************/
CREATE TABLE survey_item(
    survey_no                         NUMBER(10)     NOT NULL,
    item_no                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    item_title                        VARCHAR2(200)    NOT NULL,
        seqno                             NUMBER(10)     NOT NULL,
  FOREIGN KEY (survey_no) REFERENCES survey (survey_no)
);

COMMENT ON TABLE survey_item is '���� �׸�';
COMMENT ON COLUMN survey_item.survey_no is '���� ��ȣ';
COMMENT ON COLUMN survey_item.item_no is '���� �׸� ��ȣ';
COMMENT ON COLUMN survey_item.item_title is '���� �׸� ����';
COMMENT ON COLUMN survey_item.seqno is '����';

DROP SEQUENCE surveyitem_seq;
CREATE SEQUENCE surveyitem_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

-- ���
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


--���
SELECT survey_no, item_no, item_title
FROM survey_item 
ORDER BY item_no ASC, survey_no DESC;

SELECT survey_no, item_no, item_title
FROM survey_item 
WHERE survey_no=6
ORDER BY item_no;

commit;

--��ȸ
SELECT survey_no, item_no, item_title
FROM survey_item 
WHERE item_no=2;

--����
UPDATE survey_item 
SET item_title='�� ����Ʈ�� ���������� �̿��� ������ �����ʴϱ�?', seqno=2
WHERE item_no=2;

--����
DELETE FROM survey_item
WHERE item_no=7;

DELETE FROM survey_item;