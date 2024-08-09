insert into tbl_board_type
values(5, '정보공유');
insert into tbl_board_type
values(6, '리뷰');
insert into tbl_board_type
values(7, '질문게시판');

BEGIN
    INSERT INTO TBL_USER(userId, userPw, nickname, email) VALUES('rabbit', '1234', '토끼', 'rabbit@email.com');
    INSERT INTO TBL_USER(userId, userPw, nickname, email) VALUES('lion', '1234', '사자', 'lion@email.com');
    INSERT INTO TBL_USER(userId, userPw, nickname, email) VALUES('tiger', '1234', '호랑이', 'tiger@email.com');
    INSERT INTO TBL_USER(userId, userPw, nickname, email) VALUES('bear', '1234', '곰', 'bear@email.com');
    INSERT INTO TBL_USER(userId, userPw, nickname, email) VALUES('fox', '1234', '여우', 'fox@email.com');
    INSERT INTO TBL_USER(userId, userPw, nickname, email) VALUES('wolf', '1234', '늑대', 'wolf@email.com');
    INSERT INTO TBL_USER(userId, userPw, nickname, email) VALUES('cat', '1234', '고양이', 'cat@email.com');
    INSERT INTO TBL_USER(userId, userPw, nickname, email) VALUES('dog', '1234', '강아지', 'dog@email.com');
    INSERT INTO TBL_USER(userId, userPw, nickname, email) VALUES('elephant', '1234', '코끼리', 'elephant@email.com');
    INSERT INTO TBL_USER(userId, userPw, nickname, email) VALUES('giraffe', '1234', '기린', 'giraffe@email.com');
END;
/

COMMIT;



DECLARE
    v_userid VARCHAR2(50 BYTE);
    v_nickname VARCHAR2(50 BYTE);
    TYPE nickname_array IS VARRAY(10) OF VARCHAR2(50 BYTE);
    TYPE userid_array IS VARRAY(10) OF VARCHAR2(50 BYTE);
    v_nicknames nickname_array := nickname_array('토끼', '사자', '호랑이', '곰', '여우', '늑대', '고양이', '강아지', '코끼리', '기린');
    v_userids userid_array := userid_array('rabbit', 'lion', 'tiger', 'bear', 'fox', 'wolf', 'cat', 'dog', 'elephant', 'giraffe');
    v_index PLS_INTEGER;
BEGIN
    FOR i IN 1..505 LOOP
        v_index := TRUNC(DBMS_RANDOM.VALUE(1, 11)); -- 1부터 10까지의 정수 생성
        v_userid := v_userids(v_index);
        v_nickname := v_nicknames(v_index);

        INSERT INTO TBL_BOARD (
            BOARDNO, TITLE, CONTENT, USERID, NICKNAME, BOARDTYPENO, REGDATE, UPDATEDATE, VIEWS, LIKES, REPLYCOUNT
        ) VALUES (
            seq_board.NEXTVAL,
            '[카테고리-' || TO_CHAR(MOD(i-1, 5) + 1) || '] 글제목-' || i,
            '글내용-' || i,
            v_userid,
            v_nickname,
            5,
            SYSDATE,
            SYSDATE,
            0,
            0,
            0
        );
    END LOOP;
END;
/

COMMIT;

