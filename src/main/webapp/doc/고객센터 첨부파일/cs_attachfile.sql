-- 테이블 삭제 
DROP TABLE ce_attachfile CASCADE CONSTRAINTS;
COMMIT;

/**********************************/
/* Table Name: 고객센터 첨부파일 */
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


COMMENT ON TABLE cs_attachfile is '고객센터 첨부파일';
COMMENT ON COLUMN cs_attachfile.attach_no is '첨부파일 번호';
COMMENT ON COLUMN cs_attachfile.cs_no is '문의 번호';
COMMENT ON COLUMN cs_attachfile.fname is '원본 파일명';
COMMENT ON COLUMN cs_attachfile.fupname is '업로드 파일명';
COMMENT ON COLUMN cs_attachfile.thumb is 'Thumb 파일명';
COMMENT ON COLUMN cs_attachfile.fsize is '파일 사이즈';
COMMENT ON COLUMN cs_attachfile.rdate is '등록일';

DROP SEQUENCE cs_attachfile_seq;
CREATE SEQUENCE cs_attachfile_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  
  
-- 1) 등록
INSERT INTO cs_attachfile(attach_no, cs_no, fname, fupname, thumb, fsize)
VALUES(cs_attachfile_seq.nextval, 1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000);

INSERT INTO cs_attachfile(attach_no, cs_no, fname, fupname, thumb, fsize)
VALUES(cs_attachfile_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000);
             
INSERT INTO cs_attachfile(attach_no, cs_no, fname, fupname, thumb, fsize)
VALUES(cs_attachfile_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000);        

commit;


-- 2) 목록( cs_no 기준 내림 차순, attach_no 기준 오르차순)
SELECT attach_no, cs_no, fname, fupname, thumb, fsize, rdate
FROM cs_attachfile
ORDER BY cs_no DESC,  attach_no ASC;



-- 3) PK 기준 하나의 레코드 조회
SELECT attach_no, cs_no, fname, fupname, thumb, fsize, rdate
FROM cs_attachfile
WHERE attach_no = 1;



-- 4) FK 기준 contentsno가 동일한 레코드 조회, fname 오름 차순
SELECT attach_no, cs_no, fname, fupname, thumb, fsize, rdate
FROM cs_attachfile
WHERE cs_no = 1
ORDER BY fname ASC;

-- 5) 하나의 파일 삭제
DELETE FROM cs_attachfile
WHERE attach_no = 1;

COMMIT;


-- 6) 부모키별 갯수 산출
SELECT COUNT(*) as cnt
FROM cs_attachfile
WHERE cs_no=1;


-- 7) FK 부모키별 레코드 삭제
DELETE FROM cs_attachfile
WHERE cs_no=1;


-- 8) Customer, Attachfile_CS join
SELECT c.cs_title, 
           a.attach_no, a.cs_no, a.fname, a.fupname, a.thumb, a.fsize, a.rdate
FROM customer c, cs_attachfile a
WHERE c.cs_no = a.cs_no
ORDER BY c.cs_no DESC,  a.attach_no ASC;

-- 9) 조회
SELECT attach_no, cs_no, fname, fupname, thumb, fsize, rdate
FROM cs_attachfile
WHERE attach_no=2;
   






