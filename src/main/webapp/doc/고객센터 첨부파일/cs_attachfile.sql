-- ���̺� ���� 
DROP TABLE ce_attachfile CASCADE CONSTRAINTS;
COMMIT;

/**********************************/
/* Table Name: ������ ÷������ */
/**********************************/
DROP TABLE cs_attachfile;
CREATE TABLE cs_attachfile(
        attach_no                  NUMBER(10)         NOT NULL         PRIMARY KEY,
        cs_no                          NUMBER(10)         NULL ,
        fname                          VARCHAR2(200)         NOT NULL,
        fupname                        VARCHAR2(200)         NOT NULL,
        thumb                          VARCHAR2(200)         NULL ,
        fsize                           NUMBER(10)         DEFAULT 0         NOT NULL,
        rdate                           DATE               DEFAULT sysdate,
  FOREIGN KEY (cs_no) REFERENCES customer (cs_no)
);


COMMENT ON TABLE cs_attachfile is '������ ÷������';
COMMENT ON COLUMN cs_attachfile.attach_no is '÷������ ��ȣ';
COMMENT ON COLUMN cs_attachfile.cs_no is '���� ��ȣ';
COMMENT ON COLUMN cs_attachfile.fname is '���� ���ϸ�';
COMMENT ON COLUMN cs_attachfile.fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN cs_attachfile.thumb is 'Thumb ���ϸ�';
COMMENT ON COLUMN cs_attachfile.fsize is '���� ������';
COMMENT ON COLUMN cs_attachfile.rdate is '�����';

DROP SEQUENCE cs_attachfile_seq;
CREATE SEQUENCE cs_attachfile_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  
  
-- 1) ���
INSERT INTO cs_attachfile(attach_no, cs_no, fname, fupname, thumb, fsize)
VALUES(cs_attachfile_seq.nextval, 1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000);

INSERT INTO cs_attachfile(attach_no, cs_no, fname, fupname, thumb, fsize)
VALUES(cs_attachfile_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000);
             
INSERT INTO cs_attachfile(attach_no, cs_no, fname, fupname, thumb, fsize)
VALUES(cs_attachfile_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000);        

commit;


-- 2) ���( cs_no ���� ���� ����, attach_no ���� ��������)
SELECT attach_no, cs_no, fname, fupname, thumb, fsize, rdate
FROM cs_attachfile
ORDER BY cs_no DESC,  attach_no ASC;



-- 3) PK ���� �ϳ��� ���ڵ� ��ȸ
SELECT attach_no, cs_no, fname, fupname, thumb, fsize, rdate
FROM cs_attachfile
WHERE attach_no = 1;



-- 4) FK ���� contentsno�� ������ ���ڵ� ��ȸ, fname ���� ����
SELECT attach_no, cs_no, fname, fupname, thumb, fsize, rdate
FROM cs_attachfile
WHERE cs_no = 1
ORDER BY fname ASC;

-- 5) �ϳ��� ���� ����
DELETE FROM cs_attachfile
WHERE attach_no = 1;

COMMIT;


-- 6) �θ�Ű�� ���� ����
SELECT COUNT(*) as cnt
FROM cs_attachfile
WHERE cs_no=1;


-- 7) FK �θ�Ű�� ���ڵ� ����
DELETE FROM cs_attachfile
WHERE cs_no=1;


-- 8) Customer, Attachfile_CS join
SELECT c.cs_title, 
           a.attach_no, a.cs_no, a.fname, a.fupname, a.thumb, a.fsize, a.rdate
FROM customer c, cs_attachfile a
WHERE c.cs_no = a.cs_no
ORDER BY c.cs_no DESC,  a.attach_no ASC;

-- 9) ��ȸ
SELECT attach_no, cs_no, fname, fupname, thumb, fsize, rdate
FROM cs_attachfile
WHERE attach_no=2;
   






