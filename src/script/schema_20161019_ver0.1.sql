/*
 * Table Name : TB_A_CMMN_CD
 * Date : October 13, 2016
 * Descripttion : 공통코드 관리
 */
CREATE TABLE TB_A_CMMN_CD
(
	SEQ_NO			INTEGER			NOT NULL UNIQUE	AUTO_INCREMENT	COMMENT '관리번호'
	,CODE_ID		VARCHAR(20)		NOT NULL						COMMENT '코드아이디'
	,CODE_NM		VARCHAR(100)									COMMENT '코드이름'
	,STR_VAL		VARCHAR(100)                                    COMMENT '코드문자값'
	,DIG_VAL		INTEGER                                         COMMENT '코드숫자값'
	,SORT_ORD_NO	INTEGER                                         COMMENT '정렬순서'
	,CODE_LVL_NO	VARCHAR(30)		NOT NULL                        COMMENT '코드레벨'
	,UP_CODE_ID		VARCHAR(20)                                     COMMENT '상위코드'
	,CRT_DT			DATETIME			NOT NULL                        COMMENT '생성일자'
	,CRT_USR_ID		VARCHAR(32)		NOT NULL                        COMMENT '생성자'
	,UPD_DT			DATETIME                                            COMMENT '변경일자'
	,UPD_USR_ID		VARCHAR(32)                                     COMMENT '변경자'
	,USE_YN			CHAR(1)			DEFAULT 'Y'                     COMMENT '사용여부'
	,RMK			VARCHAR(1000)                                   COMMENT '설명'
	,PRIMARY KEY TB_A_CMMN_CD(SEQ_NO, CODE_ID)
);
ALTER TABLE TB_A_CMMN_CD COMMENT = '공통코드 관리';

/*
 * Table Name : TB_A_USER_INFO
 * Date : October 13, 2016
 * Descripttion : 사용자 관리
 */
CREATE TABLE TB_A_USER_INFO
(
	USER_ID				VARCHAR(32)		NOT NULL UNIQUE 				COMMENT '사용자 ID'
	,LOGIN_ID			VARCHAR(32)		NOT NULL UNIQUE					COMMENT '로그인 ID'
	,USR_NM				VARCHAR(50)		NOT NULL						COMMENT '사용자 이름'
	,USR_PWD			VARCHAR(300)	NOT NULL						COMMENT '사용자 비밀번호'
	,COMP_ID			VARCHAR(20)										COMMENT '사용자 소속'
	,AUTH_ID			VARCHAR(20)		NOT NULL						COMMENT '권한그룹코드'
	,EMAIL				VARCHAR(100)									COMMENT '이메일'
	,CP_NO				VARCHAR(15)										COMMENT '휴대폰번호'
	,CRT_DT				DATETIME			NOT NULL						COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)		NOT NULL						COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,LOGIN_YN			CHAR(1)			DEFAULT 'N'						COMMENT '로그인여부'
	,LST_LOGIN_DT		DATETIME											COMMENT '최종로그인일시'
	,USE_YN				CHAR(1)			DEFAULT 'Y'						COMMENT '사용여부'
	,PRMT_STTCS_CD		CHAR(2)			DEFAULT '01'					COMMENT '승인상태코드, 01-승인전, 02-승인대기, 03-승인, 04-반려, 05-거절'
	,PRVN_YN			CHAR(1)			DEFAULT 'Y'						COMMENT '개인약관승인여부'
	,PSN_SCRT_YN		CHAR(1)			DEFAULT 'Y'						COMMENT '개인정보보호방침확인여부'
	,DOC_ID				VARCHAR(20)										COMMENT '첨부파일 아이디'
	,PRIMARY KEY TB_A_USER_INFO_PK(USER_ID, LOGIN_ID)
);
ALTER TABLE TB_A_USER_INFO COMMENT = '사용자정보';

/*
 * Table Name : TB_A_USER_INFO_HIST
 * Date : October 18, 2016
 * Descripttion : 사용자 관리
 */
CREATE TABLE TB_A_USER_INFO_HIST
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,LOGIN_ID			VARCHAR(32)		NOT NULL UNIQUE					COMMENT '로그인 ID'
	,USR_NM				VARCHAR(50)		NOT NULL						COMMENT '사용자 이름'
	,USER_PWD			VARCHAR(300)	NOT NULL						COMMENT '사용자 비밀번호'
	,COMP_ID			VARCHAR(20)										COMMENT '사용자 소속'
	,AUTH_ID			VARCHAR(20)		NOT NULL						COMMENT '권한그룹코드'
	,EMAIL				VARCHAR(100)									COMMENT '이메일'
	,CP_NO				VARCHAR(15)										COMMENT '휴대폰번호'
	,CRT_DT				DATETIME			NOT NULL						COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)		NOT NULL						COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,LOGIN_YN			CHAR(1)			DEFAULT 'N'						COMMENT '로그인여부'
	,LST_LOGIN_DT		DATETIME											COMMENT '최종로그인일시'
	,USE_YN				CHAR(1)			DEFAULT 'Y'						COMMENT '사용여부'
	,PRMT_STAT_CD		CHAR(2)			DEFAULT '01'					COMMENT '승인상태코드, 01-승인전, 02-승인대기, 03-승인, 04-반려, 05-거절'
	,DOC_ID				VARCHAR(20)										COMMENT '첨부파일 아이디'
	,PRIMARY KEY TB_A_USER_INFO_HIST_PK(SEQ_NO)
);
ALTER TABLE TB_A_USER_INFO_HIST COMMENT = '사용자정보 이력';

/*
 * Table Name : TB_A_CMMN_ROLE
 * Date : October 18, 2016
 * Descripttion : 롤 관리
 */
CREATE TABLE TB_A_CMMN_ROLE
(	
	SEQ_NO				INTEGER			NOT NULL UNIQUE	AUTO_INCREMENT	COMMENT '관리번호'
	,ROLE_ID			VARCHAR(20)		NOT NULL UNIQUE					COMMENT '롤 아이디'
	,ROLE_NAME			VARCHAR(200)	NOT NULL						COMMENT '롤 이름'
	,ROLE_DESC			VARCHAR(2000)									COMMENT '롤 설명'
	,ROLE_TP			CHAR(2)			NOT NULL						COMMENT '롤 타입, 01-method, 02-URL, 03-button, 04-기타'
	,ROLE_SORT			INTEGER											COMMENT '롤 정렬'
	,CRT_DT				DATETIME											COMMENT '롤 등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '롤 등록자'
	,ROLE_RGST			CHAR(1)			DEFAULT 'N'						COMMENT '롤 등록여부'
	,UPD_DT				DATETIME											COMMENT '롤 수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '롤 수정자'
	,RMK				VARCHAR(1000)									COMMENT '비고'
	,PRIMARY KEY TB_A_CMMN_ROLE_PK(SEQ_NO, ROLE_ID)
);
ALTER TABLE TB_A_CMMN_ROLE COMMENT = '롤 정보';

/*
 * Table Name : TB_A_CMMN_AUTH
 * Date : October 18, 2016
 * Descripttion : 권한 관리
 */
CREATE TABLE TB_A_CMMN_AUTH
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE	AUTO_INCREMENT	COMMENT '관리번호'
	,AUTH_ID			VARCHAR(20)		NOT NULL						COMMENT '권한 아이디'
	,AUTH_NAME			VARCHAR(200)	NOT NULL						COMMENT '권한 이름'
	,AUTH_DESC			VARCHAR(2000)									COMMENT '권한 설명'
	,ROLE_ID			VARCHAR(20)										COMMENT '롤 아이디'
	,CRT_DT				DATETIME											COMMENT '권한 등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '권한 등록자'
	,UPD_DT				DATETIME											COMMENT '권한 수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '권한 수정자'
	,USE_YN				CHAR(1)											COMMENT '권한 사용여부'
	,RMK				VARCHAR(1000)									COMMENT '비고'
	,PRIMARY KEY TB_A_CMMN_AUTH_PK(SEQ_NO, AUTH_ID)
);
ALTER TABLE TB_A_CMMN_AUTH COMMENT = '권한 정보';

/*
 * Table Name : TB_A_CMMN_USER_AUTH
 * Date : October 18, 2016
 * Descripttion : 사용자별 권한 정보
 */
CREATE TABLE TB_A_CMMN_USER_AUTH
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE	AUTO_INCREMENT	COMMENT '관리번호'
	,USER_ID			VARCHAR(32)		NOT NULL						COMMENT '사용자 아이디'
	,AUTH_ID			VARCHAR(20)		NOT NULL						COMMENT '권한 아이디'
	,MENU_ID			VARCHAR(20)		NOT NULL						COMMENT '메뉴 아이디'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)			DEFAULT 'Y'						COMMENT '사용여부'
);
ALTER TABLE TB_A_CMMN_USER_AUTH COMMENT = '사용자별 권한정보';

/*
 * Table Name : TB_A_CMMN_MENU
 * Date : October 18, 2016
 * Descripttion : 메뉴 정보
 */
CREATE TABLE TB_A_CMMN_MENU
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE	AUTO_INCREMENT	COMMENT '관리번호'
	,MENU_ID			VARCHAR(20)		NOT NULL						COMMENT '메뉴 아이디'
	,MENU_NAME			VARCHAR(100)	NOT NULL						COMMENT '메뉴이름'
	,MENU_URL			VARCHAR(500)	NOT NULL						COMMENT '메뉴 URL'
	,MENU_DESC			VARCHAR(1000)									COMMENT '메뉴 설명'
	,UP_MENU_ID			VARCHAR(20)										COMMENT '상위 메뉴 아이디'
	,MENU_SORT			INTEGER											COMMENT '메뉴 순서'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMK				VARCHAR(1000)									COMMENT '비고'
	,PRIMARY KEY TB_A_CMMN_MENU_PK(SEQ_NO, MENU_ID)
);
ALTER TABLE TB_A_CMMN_MENU COMMENT = '메뉴 정보';

/*
 * Table Name : TB_A_CMMN_NOTC
 * Date : October 17, 2016
 * Descripttion : 공지사항 관리
 */
CREATE TABLE TB_A_CMMN_NOTC
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE	AUTO_INCREMENT	COMMENT '관리번호'
	,TITL				VARCHAR(200)	NOT NULL						COMMENT '공지사항 제목'
	,CONTS				VARCHAR(3000)	NOT NULL						COMMENT '공지사항 내용'
	,SEARCH_CNT			INTEGER			DEFAULT '0'						COMMENT '조회수'
	,DIV_CD				VARCHAR(20)		NOT NULL						COMMENT '공지사항 카테고리'
	,DOC_ID				VARCHAR(20)										COMMENT '공지사항 첨부파일 ID'
	,CRT_DT				DATETIME											COMMENT '공지사항 생성일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '공지사항 생성자'
	,UPD_DT				DATETIME											COMMENT '공지사항 변경일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '공지사항 변경자'
	,USE_YN				CHAR(1)			DEFAULT 'Y'						COMMENT '공지사항 사용여부'
	,RMK				VARCHAR(1000)									COMMENT '공지사항 설명'
	,PRIMARY KEY TB_A_CMMN_NOTC_PK(SEQ_NO)
);
ALTER TABLE TB_A_CMMN_NOTC COMMENT = '공지사항';

/*
 * Table Name : TB_A_APND_FILE_INFO
 * Date : October 17, 2016
 * Descripttion : 첨부파일 관리
 */
CREATE TABLE TB_A_APND_FILE_INFO
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE	AUTO_INCREMENT	COMMENT '관리번호'
	,DOC_ID				VARCHAR(20)										COMMENT '첨부파일 아이디'
	,FILE_PATH			VARCHAR(500)									COMMENT '첨부파일 위치'
	,FILE_ORGNAME		VARCHAR(200)									COMMENT '첨부파일 원 이름'
	,FILE_NAME			VARCHAR(200)									COMMENT '첨부파일 이름'
	,FILE_EXT			VARCHAR(10)										COMMENT '첨부파일 확장자'
	,CRT_DT				DATETIME											COMMENT '첨부파일 등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '첨부파일 등록자 아이디'
	,UPD_DT				DATETIME											COMMENT '첨부파일 변경일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '첨부파일 변경자'
	,USE_YN				CHAR(1)			DEFAULT 'Y'						COMMENT '첨부파일 사용여부'
	,RMK				VARCHAR(1000)									COMMENT '첨부파일 설명'
	,PRIMARY KEY TB_A_APND_FILE_INFO_PK(SEQ_NO, DOC_ID)
);
ALTER TABLE TB_A_APND_FILE_INFO COMMENT = '첨부파일 관리';

/*
 * Table Name : TB_A_INFORM
 * Date : October 18, 2016
 * Descripttion : 통보함
 */
CREATE TABLE TB_A_INFORM
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE	AUTO_INCREMENT	COMMENT '관리번호'
	,INFORM_ID			VARCHAR(20)		NOT NULL 						COMMENT '통보 ID'
	,INFORM_DT			DATETIME											COMMENT '통보일자'
	,COMP_ID			VARCHAR(20)										COMMENT '사업자 아이디'
	,RSRS_ID			VARCHAR(20)										COMMENT '자원 아이디'
	,INFORM_TP			CHAR(2)											COMMENT '통보유형, 01-정기점검, 02-정산, 03-자원상태, 04-AS, 05-중개계약, 06-기타'
	,TITL				VARCHAR(200)									COMMENT '제목'
	,CONTS				VARCHAR(2000)									COMMENT '내용'
	,DOC_ID				VARCHAR(20)										COMMENT '첨부파일 아이디'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,PRIMARY KEY TB_A_INFORM_PK(SEQ_NO, INFORM_ID)
);
ALTER TABLE TB_A_INFORM COMMENT = '통보함';

/*
 * Table Name : TB_A_QNA
 * Date : October 18, 2016
 * Descripttion : 질의 응대
 */
CREATE TABLE TB_A_QNA
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE	AUTO_INCREMENT	COMMENT '관리번호'
	,QNA_ID				VARCHAR(20)		NOT NULL 						COMMENT '질의응대 아이디'
	,UP_QNA_ID			VARCHAR(20)										COMMENT '상위질의응대 아이디'
	,OPEN_YN			CHAR(1)			DEFAULT 'N'						COMMENT '공개여부'
	,TITL				VARCHAR(200)									COMMENT '제목'
	,CONTS				VARCHAR(2000)									COMMENT '내용'
	,SEARCH_CNT			INTEGER											COMMENT '조회수'
	,DOC_ID				VARCHAR(20)										COMMENT '첨부파일 아이디'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,PRIMARY KEY TB_A_QNA_PK(SEQ_NO, QNA_ID)
);
ALTER TABLE TB_A_QNA COMMENT = '질의응답';

/*
 * Table Name : TB_A_OBJECT
 * Date : October 18, 2016
 * Descripttion : 이의신청
 */
CREATE TABLE TB_A_OBJECT
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE	AUTO_INCREMENT	COMMENT '관리번호'
	,APPL_ID			VARCHAR(20)		NOT NULL 						COMMENT '이의신청 아이디'
	,APPL_TP			CHAR(2)											COMMENT '이의신청유형, 01-주문, 02-입찰, 03-정산, 04-기타'
	,TITL				VARCHAR(200)									COMMENT '제목'
	,CONTS				VARCHAR(2000)									COMMENT '내용'
	,PRC_STTS			CHAR(2)											COMMENT '처리결과, 01-승인전, 02-승인대기, 03-승인, 04- 반려, 05-거절'
	,PRC_CONTS			VARCHAR(2000)									COMMENT '처리내용'
	,PRC_DT				DATETIME											COMMENT '처리일자'
	,DOC_ID				VARCHAR(20)										COMMENT '첨부파일 아이디'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,PRIMARY KEY TB_A_OBJECT_PK(SEQ_NO, APPL_ID)
);
ALTER TABLE TB_A_OBJECT COMMENT = '이의신청';

/*
 * Table Name : TB_B_ENPR_INFO
 * Date : October 18, 2016
 * Descripttion : 사업자 정보
 */
CREATE TABLE TB_B_ENPR_INFO
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,COMP_ID			VARCHAR(20)		NOT NULL 						COMMENT '사업자ID'
	,COMP_NAME			VARCHAR(200)	NOT NULL						COMMENT '업체명'
	,COMP_TP			CHAR(2)			NOT NULL						COMMENT '업체유형, 01-개인, 02-법인, 03-기타'
	,COMP_RGST_NO		VARCHAR(20)										COMMENT '사업자등록번호'
	,COMP_CATE			VARCHAR(200)									COMMENT '사업자 업종'
	,COMP_COND			VARCHAR(200)									COMMENT '사업자 업태'
	,COMP_FND_DT		DATETIME											COMMENT '사업자 설립일'
	,COMP_CEO_NAME		VARCHAR(100)									COMMENT '대표자 이름'
	,COMP_CNCT_NAME		VARCHAR(100)									COMMENT '담당자 이름'
	,COMP_CNCT_CP		VARCHAR(20)										COMMENT '담당자 번호'
	,COMP_ADDR			VARCHAR(50)										COMMENT '사업장 소재지'
	,COMP_DTL_ADDR		VARCHAR(300)									COMMENT '사업장 상세 소제지'
	,COMP_TEL_NO		VARCHAR(20)										COMMENT '대표전화'
	,COMP_FAX_NO		VARCHAR(20)										COMMENT '대표팩스'
	,COMP_EMAIL			VARCHAR(100)									COMMENT '사업자이메일'
	,COMP_WEB_PAGE		VARCHAR(200)									COMMENT '홈페이지'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,PRMT_STTS			CHAR(2)											COMMENT '승인상태코드, 01-승인전, 02-승인대기, 03-승인, 04-반려, 05-거절'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_B_ENPR_INFO_PK(SEQ_NO, COMP_ID)
);
ALTER TABLE TB_B_ENPR_INFO COMMENT = '사업자 정보';

/*
 * Table Name : TB_B_ENPR_INFO_HIST
 * Date : October 18, 2016
 * Descripttion : 사업자 정보 이력
 */
CREATE TABLE TB_B_ENPR_INFO_HIST
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,ENPR_HIST_ID		VARCHAR(20)		NOT NULL						COMMENT '사업자이력ID'
	,ENPR_ID			VARCHAR(20)		NOT NULL 						COMMENT '사업자ID'
	,ENPR_NAME			VARCHAR(200)	NOT NULL						COMMENT '업체명'
	,ENPR_TP			CHAR(2)			NOT NULL						COMMENT '업체유형, 01-개인, 02-법인, 03-기타'
	,ENPR_RGST_NO		VARCHAR(20)										COMMENT '사업자등록번호'
	,ENPR_CATE			VARCHAR(200)									COMMENT '사업자 업종'
	,ENPR_COND			VARCHAR(200)									COMMENT '사업자 업태'
	,ENPR_FND_DT		DATETIME											COMMENT '사업자 설립일'
	,ENPR_CEO_NAME		VARCHAR(100)									COMMENT '대표자 이름'
	,ENPR_CNCT_NAME		VARCHAR(100)									COMMENT '담당자 이름'
	,ENPR_ADDR			VARCHAR(50)										COMMENT '사업장 소재지'
	,ENPR_DTL_ADDR		VARCHAR(300)									COMMENT '사업장 상세 소제지'
	,ENPR_TEL_NO		VARCHAR(20)										COMMENT '대표전화'
	,ENPR_FAX_NO		VARCHAR(20)										COMMENT '대표팩스'
	,ENPR_EMAIL			VARCHAR(100)									COMMENT '사업자이메일'
	,ENPR_WEB_PAGE		VARCHAR(200)									COMMENT '홈페이지'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,PRMT_STTS			CHAR(2)											COMMENT '승인상태코드, 01-승인전, 02-승인대기, 03-승인, 04-반려, 05-거절'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_B_ENPR_INFO_PK(SEQ_NO, COMP_ID)
);
ALTER TABLE TB_B_ENPR_INFO_HIST COMMENT = '사업자 정보 이력';

/*
 * Table Name : TB_B_CNTC_SET_INFO
 * Date : October 18, 2016
 * Descripttion : 중개사업정보
 */
CREATE TABLE TB_B_CNTC_SET_INFO
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,MDT_ENPR_INFO_ID	VARCHAR(20)		NOT NULL 						COMMENT '중개사업정보 아이디'
	,ENPR_ID			VARCHAR(20)										COMMENT '사업자 아이디'
	,PWR_MDT_FEE		DOUBLE											COMMENT '전력중개수수료'
	,MTNC_FEE			DOUBLE											COMMENT '유지보수수수료'
	,REC_MDT_FEE		DOUBLE											COMMENT 'REC중개거래수수료'
	,KPX_PWR_FEE		DOUBLE											COMMENT 'KPX전력거래수수료'
	,KPX_CERT_FEE		DOUBLE											COMMENT 'KPX인증서거래수수료'
	,PWR_HDFG_ORD_ENDDT	DATETIME											COMMENT '전력수기주문마감날짜'
	,PWR_HDFG_ORD_ENDTM	TIMESTAMP										COMMENT '전력수기주문마감시간'
	,PWR_AT_ORD_DT		DATETIME											COMMENT '전력자동주문날짜'
	,PWR_AT_ORD_TM		TIMESTAMP										COMMENT '전력자동주문시간'
	,PWR_STACC_CRTS_DT	DATETIME											COMMENT '전력입찰서생성시작날짜'
	,PWR_STACC_CRTS_TM	TIMESTAMP										COMMENT '전력입찰서생성시작시간'
	,PWR_STACC_CRTE_DT	DATETIME											COMMENT '전력입찰서생성마감날짜'
	,PWR_STACC_CRTE_TM	TIMESTAMP										COMMENT '전력입찰서생성마감시간'
	,REC_HDFG_ORDE_DT	DATETIME											COMMENT 'REC수기주문마감날짜'
	,REC_HDFG_ORDE_TM	TIMESTAMP										COMMENT 'REC수기주문마감시간'
	,REC_STACC_CRTS_DT	DATETIME											COMMENT 'REC입찰서생성시작날짜'
	,REC_STACC_CRTS_TM	TIMESTAMP										COMMENT 'REC입찰서생성시작시간'
	,REC_STACC_CRTE_DT	DATETIME											COMMENT 'REC입찰서생성마감날짜'
	,REC_STACC_CRTE_TM	TIMESTAMP										COMMENT 'REC입찰서생성마감시간'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,PRIMARY KEY TB_B_CNTC_SET_INFO_PK(SEQ_NO, MDT_ENPR_INFO_ID)
);
ALTER TABLE TB_B_CNTC_SET_INFO COMMENT = '중개사업정보';

/*
 * Table Name : TB_B_CNTC_SET_INFO_HIST
 * Date : October 18, 2016
 * Descripttion : 중개사업정보이력
 */
CREATE TABLE TB_B_CNTC_SET_INFO_HIST
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,MDT_ENPR_INFO_HIST_ID	VARCHAR(20)	NOT NULL 						COMMENT '중개사업정보이력아이디'
	,MDT_ENPR_INFO_ID	VARCHAR(20)		NOT NULL 						COMMENT '중개사업정보 아이디'
	,ENPR_ID			VARCHAR(20)										COMMENT '사업자 아이디'
	,PWR_MDT_FEE		DOUBLE											COMMENT '전력중개수수료'
	,MTNC_FEE			DOUBLE											COMMENT '유지보수수수료'
	,REC_MDT_FEE		DOUBLE											COMMENT 'REC중개거래수수료'
	,KPX_PWR_FEE		DOUBLE											COMMENT 'KPX전력거래수수료'
	,KPX_CERT_FEE		DOUBLE											COMMENT 'KPX인증서거래수수료'
	,PWR_HDFG_ORD_ENDDT	DATETIME											COMMENT '전력수기주문마감날짜'
	,PWR_HDFG_ORD_ENDTM	TIMESTAMP										COMMENT '전력수기주문마감시간'
	,PWR_AT_ORD_DT		DATETIME											COMMENT '전력자동주문날짜'
	,PWR_AT_ORD_TM		TIMESTAMP										COMMENT '전력자동주문시간'
	,PWR_STACC_CRTS_DT	DATETIME											COMMENT '전력입찰서생성시작날짜'
	,PWR_STACC_CRTS_TM	TIMESTAMP										COMMENT '전력입찰서생성시작시간'
	,PWR_STACC_CRTE_DT	DATETIME											COMMENT '전력입찰서생성마감날짜'
	,PWR_STACC_CRTE_TM	TIMESTAMP										COMMENT '전력입찰서생성마감시간'
	,REC_HDFG_ORDE_DT	DATETIME											COMMENT 'REC수기주문마감날짜'
	,REC_HDFG_ORDE_TM	TIMESTAMP										COMMENT 'REC수기주문마감시간'
	,REC_STACC_CRTS_DT	DATETIME											COMMENT 'REC입찰서생성시작날짜'
	,REC_STACC_CRTS_TM	TIMESTAMP										COMMENT 'REC입찰서생성시작시간'
	,REC_STACC_CRTE_DT	DATETIME											COMMENT 'REC입찰서생성마감날짜'
	,REC_STACC_CRTE_TM	TIMESTAMP										COMMENT 'REC입찰서생성마감시간'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,PRIMARY KEY TB_B_CNTC_SET_INFO_HIST_PK(SEQ_NO, MDT_ENPR_INFO_ID)
);
ALTER TABLE TB_B_CNTC_SET_INFO_HIST COMMENT = '중개사업정보이력';

/*
 * Table Name : TB_B_CNTC_PATN_INFO
 * Date : October 18, 2016
 * Descripttion : 패턴정보
 */
CREATE TABLE TB_B_CNTC_PATN_INFO
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,GNR_PTRN_ID		VARCHAR(20)		NOT NULL						COMMENT '발전패턴 아이디'
	,DIV_NM				CHAR(2)											COMMENT '절기, 01-춘추기, 02-하절기, 03 : 동절기'
	,HR_01				DOUBLE											COMMENT '1시간 발전량'
	,HR_02				DOUBLE											COMMENT '2시간 발전량'
	,HR_03				DOUBLE											COMMENT '3시간 발전량'
	,HR_04				DOUBLE											COMMENT '4시간 발전량'
	,HR_05				DOUBLE											COMMENT '5시간 발전량'
	,HR_06				DOUBLE											COMMENT '6시간 발전량'
	,HR_07				DOUBLE											COMMENT '7시간 발전량'
	,HR_08				DOUBLE											COMMENT '8시간 발전량'
	,HR_09				DOUBLE											COMMENT '9시간 발전량'
	,HR_10				DOUBLE											COMMENT '10시간 발전량'
	,HR_11				DOUBLE											COMMENT '11시간 발전량'
	,HR_12				DOUBLE											COMMENT '12시간 발전량'
	,HR_13				DOUBLE											COMMENT '13시간 발전량'
	,HR_14				DOUBLE											COMMENT '14시간 발전량'
	,HR_15				DOUBLE											COMMENT '15시간 발전량'
	,HR_16				DOUBLE											COMMENT '16시간 발전량'
	,HR_17				DOUBLE											COMMENT '17시간 발전량'
	,HR_18				DOUBLE											COMMENT '18시간 발전량'
	,HR_19				DOUBLE											COMMENT '19시간 발전량'
	,HR_20				DOUBLE											COMMENT '20시간 발전량'
	,HR_21				DOUBLE											COMMENT '21시간 발전량'
	,HR_22				DOUBLE											COMMENT '22시간 발전량'
	,HR_23				DOUBLE											COMMENT '23시간 발전량'
	,HR_24				DOUBLE											COMMENT '24시간 발전량'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_B_CNTC_PATN_INFO_PK(SEQ_NO, GNR_PTRN_ID)
);
ALTER TABLE TB_B_CNTC_PATN_INFO COMMENT = '패턴정보';

/*
 * Table Name : TB_B_CNTC_PATN_INFO_HIST
 * Date : October 18, 2016
 * Descripttion : 패턴정보이력
 */
CREATE TABLE TB_B_CNTC_PATN_INFO_HIST
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,GNR_PPRTN_HIST_ID	VARCHAR(20)		NOT NULL						COMMENT '발전패턴이력 아이디'
	,GNR_PTRN_ID		VARCHAR(20)		NOT NULL						COMMENT '발전패턴 아이디'
	,DIV_NM				CHAR(2)											COMMENT '절기, 01-춘추기, 02-하절기, 03 : 동절기'
	,HR_01				INTEGER											COMMENT '1시간 발전량'
	,HR_02				INTEGER											COMMENT '2시간 발전량'
	,HR_03				INTEGER											COMMENT '3시간 발전량'
	,HR_04				INTEGER											COMMENT '4시간 발전량'
	,HR_05				INTEGER											COMMENT '5시간 발전량'
	,HR_06				INTEGER											COMMENT '6시간 발전량'
	,HR_07				INTEGER											COMMENT '7시간 발전량'
	,HR_08				INTEGER											COMMENT '8시간 발전량'
	,HR_09				INTEGER											COMMENT '9시간 발전량'
	,HR_10				INTEGER											COMMENT '10시간 발전량'
	,HR_11				INTEGER											COMMENT '11시간 발전량'
	,HR_12				INTEGER											COMMENT '12시간 발전량'
	,HR_13				INTEGER											COMMENT '13시간 발전량'
	,HR_14				INTEGER											COMMENT '14시간 발전량'
	,HR_15				INTEGER											COMMENT '15시간 발전량'
	,HR_16				INTEGER											COMMENT '16시간 발전량'
	,HR_17				INTEGER											COMMENT '17시간 발전량'
	,HR_18				INTEGER											COMMENT '18시간 발전량'
	,HR_19				INTEGER											COMMENT '19시간 발전량'
	,HR_20				INTEGER											COMMENT '20시간 발전량'
	,HR_21				INTEGER											COMMENT '21시간 발전량'
	,HR_22				INTEGER											COMMENT '22시간 발전량'
	,HR_23				INTEGER											COMMENT '23시간 발전량'
	,HR_24				INTEGER											COMMENT '24시간 발전량'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_B_CNTC_PATN_INFO_HIST_PK(SEQ_NO, GNR_PTRN_ID)
);
ALTER TABLE TB_B_CNTC_PATN_INFO_HIST COMMENT = '패턴정보이력';

/*
 * Table Name : TB_B_CNTC_BAS_INFO
 * Date : October 18, 2016
 * Descripttion : 계약정보
 */
CREATE TABLE TB_B_CNTC_BAS_INFO
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,CNTR_ID			VARCHAR(20)		NOT NULL						COMMENT '계약아이디'
	,ENPR_ID			VARCHAR(20)										COMMENT '사업자아이디'
	,RSRS_ID			VARCHAR(20)										COMMENT '자원아이디'
	,MDT_ENPR_ID		VARCHAR(20)										COMMENT '중개사업자아이디'
	,CNTR_WNTS_DT		DATETIME											COMMENT '계약희망일자시작일'
	,CNTR_WNTE_DT		DATETIME											COMMENT '계약희망일자종료일'
	,CNTR_TERMS			INTEGER											COMMENT	'계약기간'
	,CNTR_STTS			CHAR(2)											COMMENT '상태값, 01-신청, 02-승인 03-반려, 04-체결, 05-체결-취소, 06-삭제'
	,MDT_CNTR_NO		VARCHAR(20)										COMMENT '중개계약번호'
	,PRMT_DT			DATETIME											COMMENT '승인일자'
	,CNCL_DT			DATETIME											COMMENT '체결일자'
	,PWR_MDT_FEE		DOUBLE											COMMENT '전력중개수수료'
	,MTNC_FEE			DOUBLE											COMMENT '유지보수수수료'
	,REC_MDT_FEE		DOUBLE											COMMENT 'REC중개거래수수료'
	,KPX_PWR_FEE		DOUBLE											COMMENT 'KPX전력거래수수료'
	,KPX_CERT_FEE		DOUBLE											COMMENT 'KPX인증서거래수수료'
	,DOC_ID				VARCHAR(20)										COMMENT '첨부파일아이디'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_B_CNTC_BAS_INFO_PK(SEQ_NO, CNTR_ID)
);
ALTER TABLE TB_B_CNTC_BAS_INFO COMMENT = '계약정보';

/*
 * Table Name : TB_B_CNTC_BAS_INFO_HIST
 * Date : October 18, 2016
 * Descripttion : 계약정보이력
 */
CREATE TABLE TB_B_CNTC_BAS_INFO_HIST
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,CNTR_HIST_ID		VARCHAR(20)		NOT NULL						COMMENT '계약이력아이디'
	,CNTR_ID			VARCHAR(20)		NOT NULL						COMMENT '계약아이디'
	,ENPR_ID			VARCHAR(20)										COMMENT '사업자아이디'
	,RSRS_ID			VARCHAR(20)										COMMENT '자원아이디'
	,MDT_ENPR_ID		VARCHAR(20)										COMMENT '중개사업자아이디'
	,CNTR_WNTS_DT		DATETIME											COMMENT '계약희망일자시작일'
	,CNTR_WNTE_DT		DATETIME											COMMENT '계약희망일자종료일'
	,CNTR_TERMS			INTEGER											COMMENT	'계약기간'
	,CNTR_STTS			CHAR(2)											COMMENT '상태값, 01-신청, 02-승인 03-반려, 04-체결, 05-체결-취소, 06-삭제'
	,MDT_CNTR_NO		VARCHAR(20)										COMMENT '중개계약번호'
	,PRMT_DT			DATETIME											COMMENT '승인일자'
	,CNCL_DT			DATETIME											COMMENT '체결일자'
	,PWR_MDT_FEE		DOUBLE											COMMENT '전력중개수수료'
	,MTNC_FEE			DOUBLE											COMMENT '유지보수수수료'
	,REC_MDT_FEE		INTEGER											COMMENT 'REC중개거래수수료'
	,KPX_PWR_FEE		INTEGER											COMMENT 'KPX전력거래수수료'
	,KPX_CERT_FEE		INTEGER											COMMENT 'KPX인증서거래수수료'
	,DOC_ID				VARCHAR(20)										COMMENT '첨부파일아이디'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_B_CNTC_BAS_INFO_HIST(SEQ_NO, CNTR_HIST_ID, CNTR_ID)
);
ALTER TABLE TB_B_CNTC_BAS_INFO_HIST COMMENT = '계약정보이력';

/*
 * Table Name : TB_C_CNTC_RSRS_INFO
 * Date : October 18, 2016
 * Descripttion : 자원정보
 */
CREATE TABLE TB_C_CNTC_RSRS_INFO
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,RSRS_ID			VARCHAR(20)		NOT NULL						COMMENT '자원아이디'
	,ENPR_ID			VARCHAR(20)										COMMENT '사업자아이디'
	,SET_GNR_ID			VARCHAR(20)										COMMENT '집합발전기아이디'
	,CNTR_ID			VARCHAR(20)										COMMENT '계약아이디'
	,GNR_PTRN_ID		VARCHAR(20)										COMMENT '발전패턴아이디'
	,RSRS_NM			VARCHAR(100)									COMMENT '자원명'
	,RSRS_BAS_ADDR		VARCHAR(100)									COMMENT '자원소재지(기본)'
	,RSRS_DTL_ADDR		VARCHAR(300)									COMMENT '자원소재지(상세)'
	,REGN				CHAR(2)											COMMENT '지역, 01-수도권, 02-비수도권, 03-제주'
	,USED				CHAR(2)											COMMENT '용도, 01-자가용, 02-발전사업용'
	,EQPM_CPCT			DOUBLE											COMMENT '발전용량(KW)'
	,MAX_GNR_CPCT		DOUBLE											COMMENT '최대발전용량(KW)'
	,MIX_GNR_CPCT		DOUBLE											COMMENT '최소발전용량(KW)'
	,PWR_GNR			CHAR(2)											COMMENT '발전원, 01-태양광(PV), 02-에너지저장장치(ESS), 03-전기자동차(EV)'
	,INSTL_LND			VARCHAR(100)									COMMENT '설치부지(지목)'
	,INSTL_OWN			VARCHAR(100)									COMMENT '설치부지(소유자)'
	,INSTL_USE			VARCHAR(100)									COMMENT '설치부지(사용권원)'
	,KPX_MEMB_NO		VARCHAR(30)										COMMENT 'KPX회원번호'
	,LCNS_NO			VARCHAR(30)										COMMENT	'허가번호'
	,RGST_NO			VARCHAR(30)										COMMENT '등록번호'
	,WTT_HRMTR_NO		VARCHAR(30)										COMMENT '전력량계번호'
	,REC_ACCT_NO		VARCHAR(30)										COMMENT 'REC계좌번호'
	,REC_CD_CNT			INTEGER											COMMENT 'REC코드갯수'
	,CTRL_RTU_IP		VARCHAR(15)										COMMENT '관제용 RTU IP'
	,CTRL_RTU_PRT		INTEGER											COMMENT '관제용 RTU PORT'
	,EQPM_CNT			INTEGER											COMMENT '설비대수'
	,WORK_ST_DT			DATETIME											COMMENT '운전시작일시'
	,MANF_ID			VARCHAR(20)										COMMENT '제조사아이디'
	,MDL_ID				VARCHAR(20)										COMMENT '모델아이디'
	,DOC_ID				VARCHAR(20)										COMMENT '첨부파일아이디'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_C_CNTC_RSRS_INFO_PK(SEQ_NO, RSRS_ID)
);
ALTER TABLE TB_C_CNTC_RSRS_INFO COMMENT = '자원정보';

/*
 * Table Name : TB_C_CNTC_RSRS_INFO_HIST
 * Date : October 18, 2016
 * Descripttion : 자원정보이력
 */
CREATE TABLE TB_C_CNTC_RSRS_INFO_HIST
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,RSRS_HIST_ID		VARCHAR(20)		NOT NULL						COMMENT '자원이력아이디'
	,RSRS_ID			VARCHAR(20)		NOT NULL						COMMENT '자원아이디'
	,ENPR_ID			VARCHAR(20)										COMMENT '사업자아이디'
	,SET_GNR_ID			VARCHAR(20)										COMMENT '집합발전기아이디'
	,CNTR_ID			VARCHAR(20)										COMMENT '계약아이디'
	,GNR_PTRN_ID		VARCHAR(20)										COMMENT '발전패턴아이디'
	,RSRS_NM			VARCHAR(100)									COMMENT '자원명'
	,RSRS_BAS_ADDR		VARCHAR(100)									COMMENT '자원소재지(기본)'
	,RSRS_DTL_ADDR		VARCHAR(300)									COMMENT '자원소재지(상세)'
	,REGN				CHAR(2)											COMMENT '지역, 01-수도권, 02-비수도권, 03-제주'
	,USED				CHAR(2)											COMMENT '용도, 01-자가용, 02-발전사업용'
	,EQPM_CPCT			DOUBLE											COMMENT '발전용량(KW)'
	,MAX_GNR_CPCT		DOUBLE											COMMENT '최대발전용량(KW)'
	,MIX_GNR_CPCT		DOUBLE											COMMENT '최소발전용량(KW)'
	,PWR_GNR			CHAR(2)											COMMENT '발전원, 01-태양광(PV), 02-에너지저장장치(ESS), 03-전기자동차(EV)'
	,INSTL_LND			VARCHAR(100)									COMMENT '설치부지(지목)'
	,INSTL_OWN			VARCHAR(100)									COMMENT '설치부지(소유자)'
	,INSTL_USE			VARCHAR(100)									COMMENT '설치부지(사용권원)'
	,KPX_MEMB_NO		VARCHAR(30)										COMMENT 'KPX회원번호'
	,LCNS_NO			VARCHAR(30)										COMMENT	'허가번호'
	,RGST_NO			VARCHAR(30)										COMMENT '등록번호'
	,WTT_HRMTR_NO		VARCHAR(30)										COMMENT '전력량계번호'
	,REC_ACCT_NO		VARCHAR(30)										COMMENT 'REC계좌번호'
	,REC_CD_CNT			INTEGER											COMMENT 'REC코드갯수'
	,CTRL_RTU_IP		VARCHAR(15)										COMMENT '관제용 RTU IP'
	,CTRL_RTU_PRT		INTEGER											COMMENT '관제용 RTU PORT'
	,EQPM_CNT			INTEGER											COMMENT '설비대수'
	,WORK_ST_DT			DATETIME											COMMENT '운전시작일시'
	,MANF_ID			VARCHAR(20)										COMMENT '제조사아이디'
	,MDL_ID				VARCHAR(20)										COMMENT '모델아이디'
	,DOC_ID				VARCHAR(20)										COMMENT '첨부파일아이디'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_C_CNTC_RSRS_INFO_HIST_PK(SEQ_NO, RSRS_HIST_ID, RSRS_ID)
);
ALTER TABLE TB_C_CNTC_RSRS_INFO_HIST COMMENT = '자원정보이력';

/*
 * Table Name : TB_C_REC_EQPM_INFO
 * Date : October 18, 2016
 * Descripttion : REC 설비정보
 */
CREATE TABLE TB_C_REC_EQPM_INFO
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,REC_EQPM_ID		VARCHAR(20)		NOT NULL 						COMMENT 'REC설비아이디'
	,RSRS_ID			VARCHAR(20)										COMMENT '자원아이디'
	,REC_ACCT_NO		VARCHAR(30)										COMMENT 'REC계좌번호'
	,REC_EQPM_NM		VARCHAR(100)									COMMENT 'REC설비명'
	,TOT_CNT			INTEGER											COMMENT '전체수량'
	,FRCST_SLE_UPR		INTEGER											COMMENT '예상매도단가'
	,SLE_CNT			INTEGER											COMMENT '매도단가'
	,RGST_DT			DATETIME											COMMENT '등록일자'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_C_REC_EQPM_INFO(SEQ_NO, REC_EQPM_ID)
);
ALTER TABLE TB_C_REC_EQPM_INFO COMMENT = 'REC 설비정보';

/*
 * Table Name : TB_C_CNTC_UNON_INFO
 * Date : October 18, 2016
 * Descripttion : 집합자원발전정보
 */
CREATE TABLE TB_C_CNTC_UNON_INFO
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,SET_GNR_ID			VARCHAR(20)		NOT NULL 						COMMENT '집합발전기아이디'
	,SET_GNR_NM			VARCHAR(100)									COMMENT '집합발전기명'
	,KPX_RGST_NO		VARCHAR(30)										COMMENT 'KPX등록번호'
	,KPX_RGST_NM		VARCHAR(100)									COMMENT 'KPX등록명'
	,TOT_EQPM_CPCT		INTEGER											COMMENT '총설비용량'
	,REGN				VARCHAR(50)										COMMENT '지역'
	,GNR_CNT			INTEGER											COMMENT '발전원개수'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_C_CNTC_UNON_INFO_PK(SEQ_NO, SET_GNR_ID)
);
ALTER TABLE TB_C_CNTC_UNON_INFO COMMENT = '집합자원발전정보';

/*
 * Table Name : TB_C_CNTC_UNON_INFO_HIST
 * Date : October 18, 2016
 * Descripttion : 집합자원발전정보이력
 */
CREATE TABLE TB_C_CNTC_UNON_INFO_HIST
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,SET_GNR_HIST_ID	VARCHAR(20)		NOT NULL						COMMENT '집합발전기이력아이디'
	,SET_GNR_ID			VARCHAR(20)		NOT NULL 						COMMENT '집합발전기아이디'
	,SET_GNR_NM			VARCHAR(100)									COMMENT '집합발전기명'
	,KPX_RGST_NO		VARCHAR(30)										COMMENT 'KPX등록번호'
	,KPX_RGST_NM		VARCHAR(100)									COMMENT 'KPX등록명'
	,TOT_EQPM_CPCT		INTEGER											COMMENT '총설비용량'
	,REGN				VARCHAR(50)										COMMENT '지역'
	,GNR_CNT			INTEGER											COMMENT '발전원개수'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_C_CNTC_UNON_INFO_HIST_PK(SEQ_NO, SET_GNR_HIST_ID, SET_GNR_ID)
);
ALTER TABLE TB_C_CNTC_UNON_INFO_HIST COMMENT = '집합자원발전정보이력';

/*
 * Table Name : TB_D_ELEC_ORDR
 * Date : October 18, 2016
 * Descripttion : 전력주문
 */
CREATE TABLE TB_D_ELEC_ORDR
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,ORDR_NO			VARCHAR(20)		NOT NULL						COMMENT '주문번호'
	,SLE_WNT_DT			DATETIME			NOT NULL						COMMENT '판매희망일자'
	,RES_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '소규모 발전자원 아이디'
	,ORDR_DV_CD			CHAR(2)											COMMENT '주문구분, 01-직접주문, 02-간접주문'
	,STACC_DOC_CRT_YN	CHAR(1)			DEFAULT 'N'						COMMENT '입찰서 생성여부'
	,HR_01				DOUBLE											COMMENT '01구간 발전량'
	,HR_02				DOUBLE											COMMENT '02구간 발전량'
	,HR_03				DOUBLE											COMMENT '03구간 발전량'
	,HR_04				DOUBLE											COMMENT '04구간 발전량'
	,HR_05				DOUBLE											COMMENT '05구간 발전량'
	,HR_06				DOUBLE											COMMENT '06구간 발전량'
	,HR_07				DOUBLE											COMMENT '07구간 발전량'
	,HR_08				DOUBLE											COMMENT '08구간 발전량'
	,HR_09				DOUBLE											COMMENT '09구간 발전량'
	,HR_10				DOUBLE											COMMENT '10구간 발전량'
	,HR_11				DOUBLE											COMMENT '11구간 발전량'
	,HR_12				DOUBLE											COMMENT '12구간 발전량'
	,HR_13				DOUBLE											COMMENT '13구간 발전량'
	,HR_14				DOUBLE											COMMENT '14구간 발전량'
	,HR_15				DOUBLE											COMMENT '15구간 발전량'
	,HR_16				DOUBLE											COMMENT '16구간 발전량'
	,HR_17				DOUBLE											COMMENT '17구간 발전량'
	,HR_18				DOUBLE											COMMENT '18구간 발전량'
	,HR_19				DOUBLE											COMMENT '19구간 발전량'
	,HR_20				DOUBLE											COMMENT '20구간 발전량'
	,HR_21				DOUBLE											COMMENT '21구간 발전량'
	,HR_22				DOUBLE											COMMENT '22구간 발전량'
	,HR_23				DOUBLE											COMMENT '23구간 발전량'
	,HR_24				DOUBLE											COMMENT '24구간 발전량'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_ELEC_ORDR_PK(SEQ_NO, ORDR_NO, SLE_WNT_DT, RES_GNRRS_ID)
);
ALTER TABLE TB_D_ELEC_ORDR COMMENT = '전력주문';

/*
 * Table Name : TB_D_REC_ORDR_MSTR
 * Date : October 18, 2016
 * Descripttion : REC 전력주문마스터
 */
CREATE TABLE TB_D_REC_ORDR_MSTR
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,ORDR_NO			VARCHAR(20)		NOT NULL						COMMENT '주문번호'
	,SET_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '집합자원발전아이디'
	,RES_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '소규모발전자원아이디'
	,STACC_DOC_CRT_YN	CHAR(1)			DEFAULT 'N'						COMMENT '입찰서 생성여부'
	,REC_ACCT_NO		VARCHAR(30)										COMMENT 'REC계좌번호'
	,TOT_SLE_CNT		DOUBLE											COMMENT '전체매도수량'
	,TOT_SLE_AMT		DOUBLE											COMMENT '전체매도금액'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_REC_ORDR_MSTR_PK(SEQ_NO, ORDR_NO, SET_GNRRS_ID, RES_GNRRS_ID)
);
ALTER TABLE TB_D_REC_ORDR_MSTR COMMENT = 'REC 전력주문 마스터';

/*
 * Table Name : TB_D_REC_ORDR_DTL
 * Date : October 18, 2016
 * Descripttion : REC 주문상세
 */
CREATE TABLE TB_D_REC_ORDR_DTL
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,DTL_ORDR_NO		VARCHAR(20)		NOT NULL						COMMENT '상세주문번호'
	,ORDR_NO			VARCHAR(20)		NOT NULL						COMMENT '주문번호'
	,REC_EQPM_ID		VARCHAR(20)		NOT NULL						COMMENT 'REC 설비아이디'
	,SLE_CNT			DOUBLE											COMMENT '매도수량'
	,SLE_UPR			DOUBLE											COMMENT '매도단가'
	,TOT_SLE_AMT		INTEGER											COMMENT '총매도금액'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_REC_ORDR_DTL_PK(SEQ_NO, DTL_ORDR_NO, ORDR_NO, REC_EQPM_ID)
);
ALTER TABLE TB_D_REC_ORDR_DTL COMMENT = 'REC 주문 상세';

/*
 * Table Name : TB_D_ELEC_BIDG
 * Date : October 18, 2016
 * Descripttion : 전력입찰
 */
CREATE TABLE TB_D_ELEC_BIDG
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,STACC_NO			VARCHAR(20)		NOT NULL						COMMENT '입찰번호'
	,SLE_WNT_DT			DATETIME			NOT NULL						COMMENT '판매희망일자'
	,SET_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '집합발전자원 아이디'
	,RES_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '소규모 집합발전자원 아이디'
	,LST_YN				CHAR(1)			DEFAULT 'N'						COMMENT '최종여부'
	,SBMT_YN			CHAR(1)			DEFAULT 'N'						COMMENT '제출여부'
	,HR_01				DOUBLE											COMMENT '01구간 발전량'
	,HR_02				DOUBLE											COMMENT '02구간 발전량'
	,HR_03				DOUBLE											COMMENT '03구간 발전량'
	,HR_04				DOUBLE											COMMENT '04구간 발전량'
	,HR_05				DOUBLE											COMMENT '05구간 발전량'
	,HR_06				DOUBLE											COMMENT '06구간 발전량'
	,HR_07				DOUBLE											COMMENT '07구간 발전량'
	,HR_08				DOUBLE											COMMENT '08구간 발전량'
	,HR_09				DOUBLE											COMMENT '09구간 발전량'
	,HR_10				DOUBLE											COMMENT '10구간 발전량'
	,HR_11				DOUBLE											COMMENT '11구간 발전량'
	,HR_12				DOUBLE											COMMENT '12구간 발전량'
	,HR_13				DOUBLE											COMMENT '13구간 발전량'
	,HR_14				DOUBLE											COMMENT '14구간 발전량'
	,HR_15				DOUBLE											COMMENT '15구간 발전량'
	,HR_16				DOUBLE											COMMENT '16구간 발전량'
	,HR_17				DOUBLE											COMMENT '17구간 발전량'
	,HR_18				DOUBLE											COMMENT '18구간 발전량'
	,HR_19				DOUBLE											COMMENT '19구간 발전량'
	,HR_20				DOUBLE											COMMENT '20구간 발전량'
	,HR_21				DOUBLE											COMMENT '21구간 발전량'
	,HR_22				DOUBLE											COMMENT '22구간 발전량'
	,HR_23				DOUBLE											COMMENT '23구간 발전량'
	,HR_24				DOUBLE											COMMENT '24구간 발전량'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_ELEC_BIDG_PK(SEQ_NO, STACC_NO, SLE_WNT_DT, SET_GNRRS_ID, RES_GNRRS_ID)
);
ALTER TABLE TB_D_ELEC_BIDG COMMENT = '전력입찰';

/*
 * Table Name : TB_D_ELEC_BIDG_HIST
 * Date : October 18, 2016
 * Descripttion : 전력입찰이력
 */
CREATE TABLE TB_D_ELEC_BIDG_HIST
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,STACC_NO			VARCHAR(20)		NOT NULL						COMMENT '입찰번호'
	,SLE_WNT_DT			DATETIME			NOT NULL						COMMENT '판매희망일자'
	,SET_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '집합발전자원 아이디'
	,RES_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '소규모 집합발전자원 아이디'
	,LST_YN				CHAR(1)			DEFAULT 'N'						COMMENT '최종여부'
	,SBMT_YN			CHAR(1)			DEFAULT 'N'						COMMENT '제출여부'
	,HR_01				DOUBLE											COMMENT '01구간 발전량'
	,HR_02				DOUBLE											COMMENT '02구간 발전량'
	,HR_03				DOUBLE											COMMENT '03구간 발전량'
	,HR_04				DOUBLE											COMMENT '04구간 발전량'
	,HR_05				DOUBLE											COMMENT '05구간 발전량'
	,HR_06				DOUBLE											COMMENT '06구간 발전량'
	,HR_07				DOUBLE											COMMENT '07구간 발전량'
	,HR_08				DOUBLE											COMMENT '08구간 발전량'
	,HR_09				DOUBLE											COMMENT '09구간 발전량'
	,HR_10				DOUBLE											COMMENT '10구간 발전량'
	,HR_11				DOUBLE											COMMENT '11구간 발전량'
	,HR_12				DOUBLE											COMMENT '12구간 발전량'
	,HR_13				DOUBLE											COMMENT '13구간 발전량'
	,HR_14				DOUBLE											COMMENT '14구간 발전량'
	,HR_15				DOUBLE											COMMENT '15구간 발전량'
	,HR_16				DOUBLE											COMMENT '16구간 발전량'
	,HR_17				DOUBLE											COMMENT '17구간 발전량'
	,HR_18				DOUBLE											COMMENT '18구간 발전량'
	,HR_19				DOUBLE											COMMENT '19구간 발전량'
	,HR_20				DOUBLE											COMMENT '20구간 발전량'
	,HR_21				DOUBLE											COMMENT '21구간 발전량'
	,HR_22				DOUBLE											COMMENT '22구간 발전량'
	,HR_23				DOUBLE											COMMENT '23구간 발전량'
	,HR_24				DOUBLE											COMMENT '24구간 발전량'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_ELEC_BIDG_HIST_PK(SEQ_NO, STACC_NO, SLE_WNT_DT, SET_GNRRS_ID, RES_GNRRS_ID)
);
ALTER TABLE TB_D_ELEC_BIDG_HIST COMMENT = '전력입찰이력';

/*
 * Table Name : TB_D_REC_BIDG_MSTR
 * Date : October 18, 2016
 * Descripttion : REC 입찰마스터
 */
CREATE TABLE TB_D_REC_BIDG_MSTR
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,STACC_NO			VARCHAR(20)		NOT NULL						COMMENT '입찰번호'
	,SET_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '집합발전자원아이디'
	,RES_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '소규모 발전자원아이디'
	,SBMT_YN			CHAR(1)			DEFAULT 'N'						COMMENT '제출여부'
	,ORDR_NO			VARCHAR(20)										COMMENT '주문번호'
	,REC_ACCT_NO		VARCHAR(30)										COMMENT 'REC 계좌번호'
	,TOT_SLE_CNT		DOUBLE											COMMENT '전체매도수량'
	,TOT_SLE_AMT		DOUBLE											COMMENT '전체매도금액'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_REC_BIDG_MSTR_PK(SEQ_NO, STACC_NO, SET_GNRRS_ID, RES_GNRRS_ID)
);
ALTER TABLE TB_D_REC_BIDG_MSTR COMMENT = 'REC 입찰마스터';

/*
 * Table Name : TB_D_REC_BIDG_DTL_HIST
 * Date : October 18, 2016
 * Descripttion : REC 입찰상세
 */
CREATE TABLE TB_D_REC_BIDG_DTL_HIST
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,DTL_STACC_NO		VARCHAR(20)		NOT NULL						COMMENT '상세입찰번호'
	,STACC_NO			VARCHAR(20)		NOT NULL						COMMENT '입찰번호'
	,REC_EQPM_ID		VARCHAR(20)		NOT NULL						COMMENT 'REC설비아이디'
	,SLE_CNT			DOUBLE											COMMENT '매도수량'
	,SLE_UPR			DOUBLE											COMMENT	'매도단가'
	,TOT_SLE_AMT		DOUBLE											COMMENT '총매도금액'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_REC_BIDG_DTL_HIST_PK(SEQ_NO, DTL_STACC_NO, STACC_NO, REC_EQPM_ID)
);
ALTER TABLE TB_D_REC_BIDG_DTL_HIST COMMENT = 'REC 입찰상세';

/*
 * Table Name : TB_D_DALY_ELEC_BILL
 * Date : October 18, 2016
 * Descripttion : 일일전력정산
 */
CREATE TABLE TB_D_DALY_ELEC_BILL
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,TRX_DT				DATETIME			NOT NULL						COMMENT '거래일자'
	,MID_ENPR_ID		VARCHAr(20)		NOT NULL						COMMENT '중개사업자아이디'
	,SET_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '집합발전자원아이디'
	,RES_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '소규모발전자원아이디'
	,SMP_VAL			DOUBLE											COMMENT 'SMP'
	,TOT_MSRMT_SUM		DOUBLE											COMMENT '계량전력걍합'
	,TOT_CLS_AMT		DOUBLE											COMMENT '정산금'
	,KPX_FEE			DOUBLE											COMMENT 'KPX 수수료'
	,LST_CLS_AMT		DOUBLE											COMMENT '최종정산금'
	,PWR_TRX_FEE		DOUBLE											COMMENT '전력거래수수료'
	,MNTC_FEE			DOUBLE											COMMENT '유지보수수수료'
	,TOT_FEE			DOUBLE											COMMENT '중개수수료합'
	,PAY_CLS_AMT		DOUBLE											COMMENT '지급정산금'
	,HR_01				DOUBLE											COMMENT '01구간 발전량'
	,HR_02				DOUBLE											COMMENT '02구간 발전량'
	,HR_03				DOUBLE											COMMENT '03구간 발전량'
	,HR_04				DOUBLE											COMMENT '04구간 발전량'
	,HR_05				DOUBLE											COMMENT '05구간 발전량'
	,HR_06				DOUBLE											COMMENT '06구간 발전량'
	,HR_07				DOUBLE											COMMENT '07구간 발전량'
	,HR_08				DOUBLE											COMMENT '08구간 발전량'
	,HR_09				DOUBLE											COMMENT '09구간 발전량'
	,HR_10				DOUBLE											COMMENT '10구간 발전량'
	,HR_11				DOUBLE											COMMENT '11구간 발전량'
	,HR_12				DOUBLE											COMMENT '12구간 발전량'
	,HR_13				DOUBLE											COMMENT '13구간 발전량'
	,HR_14				DOUBLE											COMMENT '14구간 발전량'
	,HR_15				DOUBLE											COMMENT '15구간 발전량'
	,HR_16				DOUBLE											COMMENT '16구간 발전량'
	,HR_17				DOUBLE											COMMENT '17구간 발전량'
	,HR_18				DOUBLE											COMMENT '18구간 발전량'
	,HR_19				DOUBLE											COMMENT '19구간 발전량'
	,HR_20				DOUBLE											COMMENT '20구간 발전량'
	,HR_21				DOUBLE											COMMENT '21구간 발전량'
	,HR_22				DOUBLE											COMMENT '22구간 발전량'
	,HR_23				DOUBLE											COMMENT '23구간 발전량'
	,HR_24				DOUBLE											COMMENT '24구간 발전량'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_DALY_ELEC_BILL_PK(SEQ_NO, TRX_DT, MID_ENPR_ID, SET_GNRRS_ID, RES_GNRRS_ID)
);
ALTER TABLE TB_D_DALY_ELEC_BILL COMMENT = '일일전력정산';

/*
 * Table Name : TB_D_DALY_REC_BILL
 * Date : October 18, 2016
 * Descripttion : 일일REC정산
 */
CREATE TABLE TB_D_DALY_REC_BILL
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,TRX_DT				DATETIME			NOT NULL						COMMENT '거래일자'
	,MID_ENPR_ID		VARCHAr(20)		NOT NULL						COMMENT '중개사업자아이디'
	,SET_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '집합발전자원아이디'
	,RES_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '소규모발전자원아이디'
	,REC_ACCT_NO		VARCHAR(20)		NOT NULL						COMMENT 'REC계좌번호'
	,REC_EQPM_ID		VARCHAR(20)		NOT NULL						COMMENT 'REC설비아이디'
	,SLE_CNT			DOUBLE											COMMENT '매도수량'
	,SLE_UPR			DOUBLE											COMMENT	'매도단가'
	,TOT_CLS_AMT		DOUBLE											COMMENT '정산금'
	,KPX_FEE			DOUBLE											COMMENT 'KPX 수수료'
	,LST_CLS_AMT		DOUBLE											COMMENT '최종정산금'
	,PWR_TRX_FEE		DOUBLE											COMMENT '전력거래수수료'
	,MNTC_FEE			DOUBLE											COMMENT '유지보수수수료'
	,TOT_FEE			DOUBLE											COMMENT '중개수수료합'
	,PAY_CLS_AMT		DOUBLE											COMMENT '지급정산금'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_DALY_REC_BILL_PK(SEQ_NO, TRX_DT, MID_ENPR_ID, SET_GNRRS_ID, RES_GNRRS_ID, REC_ACCT_NO, REC_EQPM_ID)
);
ALTER TABLE TB_D_DALY_REC_BILL COMMENT = '일일REC정산';

/*
 * Table Name : TB_D_MNLY_ELEC_CLS
 * Date : October 18, 2016
 * Descripttion : 월전력정산마감
 */
CREATE TABLE TB_D_MNLY_ELEC_CLS
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,BAS_YYMM			CHAR(4)			NOT NULL 						COMMENT '기준년월'
	,TRX_DT				DATETIME			NOT NULL						COMMENT '거래일자'
	,MID_ENPR_ID		VARCHAr(20)		NOT NULL						COMMENT '중개사업자아이디'
	,SET_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '집합발전자원아이디'
	,RES_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '소규모발전자원아이디'
	,SMP_VAL			DOUBLE											COMMENT 'SMP'
	,TOT_MSRMT_SUM		DOUBLE											COMMENT '계량전력걍합'
	,TOT_CLS_AMT		DOUBLE											COMMENT '정산금'
	,KPX_FEE			DOUBLE											COMMENT 'KPX 수수료'
	,LST_CLS_AMT		DOUBLE											COMMENT '최종정산금'
	,PWR_TRX_FEE		DOUBLE											COMMENT '전력거래수수료'
	,MNTC_FEE			DOUBLE											COMMENT '유지보수수수료'
	,TOT_FEE			DOUBLE											COMMENT '중개수수료합'
	,PAY_CLS_AMT		DOUBLE											COMMENT '지급정산금'
	,HR_01				DOUBLE											COMMENT '01구간 발전량'
	,HR_02				DOUBLE											COMMENT '02구간 발전량'
	,HR_03				DOUBLE											COMMENT '03구간 발전량'
	,HR_04				DOUBLE											COMMENT '04구간 발전량'
	,HR_05				DOUBLE											COMMENT '05구간 발전량'
	,HR_06				DOUBLE											COMMENT '06구간 발전량'
	,HR_07				DOUBLE											COMMENT '07구간 발전량'
	,HR_08				DOUBLE											COMMENT '08구간 발전량'
	,HR_09				DOUBLE											COMMENT '09구간 발전량'
	,HR_10				DOUBLE											COMMENT '10구간 발전량'
	,HR_11				DOUBLE											COMMENT '11구간 발전량'
	,HR_12				DOUBLE											COMMENT '12구간 발전량'
	,HR_13				DOUBLE											COMMENT '13구간 발전량'
	,HR_14				DOUBLE											COMMENT '14구간 발전량'
	,HR_15				DOUBLE											COMMENT '15구간 발전량'
	,HR_16				DOUBLE											COMMENT '16구간 발전량'
	,HR_17				DOUBLE											COMMENT '17구간 발전량'
	,HR_18				DOUBLE											COMMENT '18구간 발전량'
	,HR_19				DOUBLE											COMMENT '19구간 발전량'
	,HR_20				DOUBLE											COMMENT '20구간 발전량'
	,HR_21				DOUBLE											COMMENT '21구간 발전량'
	,HR_22				DOUBLE											COMMENT '22구간 발전량'
	,HR_23				DOUBLE											COMMENT '23구간 발전량'
	,HR_24				DOUBLE											COMMENT '24구간 발전량'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_MNLY_ELEC_CLS_PK(SEQ_NO, BAS_YYMM, TRX_DT, MID_ENPR_ID, SET_GNRRS_ID, RES_GNRRS_ID)
);
ALTER TABLE TB_D_MNLY_ELEC_CLS COMMENT = '월전력정산마감';

/*
 * Table Name : TB_D_MNLY_REC_CLS
 * Date : October 18, 2016
 * Descripttion : 월REC정산마감
 */
CREATE TABLE TB_D_MNLY_REC_CLS
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,BAS_YYMM			CHAR(4)			NOT NULL 						COMMENT '기준년월'
	,TRX_DT				DATETIME			NOT NULL						COMMENT '거래일자'
	,MID_ENPR_ID		VARCHAr(20)		NOT NULL						COMMENT '중개사업자아이디'
	,SET_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '집합발전자원아이디'
	,RES_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '소규모발전자원아이디'
	,REC_ACCT_NO		VARCHAR(20)		NOT NULL						COMMENT 'REC계좌번호'
	,REC_EQPM_ID		VARCHAR(20)		NOT NULL						COMMENT 'REC설비아이디'
	,SLE_CNT			DOUBLE											COMMENT '매도수량'
	,SLE_UPR			DOUBLE											COMMENT	'매도단가'
	,CLS_AMT			DOUBLE											COMMENT '정산금'
	,KPX_FEE			DOUBLE											COMMENT 'KPX 수수료'
	,LST_CLS_AMT		DOUBLE											COMMENT '최종정산금'
	,PWR_TRX_FEE		DOUBLE											COMMENT '전력거래수수료'
	,MNTC_FEE			DOUBLE											COMMENT '유지보수수수료'
	,TOT_FEE			DOUBLE											COMMENT '중개수수료합'
	,PAY_CLS_AMT		DOUBLE											COMMENT '지급정산금'
	,NOTCR_ID			VARCHAR(32)										COMMENT '통보자아이디'
	,NOTC_DT			DATETIME											COMMENT '통보일시'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_MNLY_REC_CLS(SEQ_NO, BAS_YYMM, TRX_DT, MID_ENPR_ID, SET_GNRRS_ID, RES_GNRRS_ID, REC_ACCT_NO, REC_EQPM_ID)
);
ALTER TABLE TB_D_MNLY_REC_CLS COMMENT = '월REC정산마감';

/*
 * Table Name : TB_D_DALY_INCTV
 * Date : October 18, 2016
 * Descripttion : 월REC정산마감
 */
CREATE TABLE TB_D_DALY_INCTV
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,TRX_DT				DATETIME			NOT NULL						COMMENT '거래번호'
	,SET_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '집합발전자원아이디'
	,TM_DV_CD			VARCHAR(20)		NOT NULL						COMMENT '시구간구분'
	,INIT_STACC_AMT		DOUBLE											COMMENT '초기 입찰량'
	,CHNG_STACC_AMT		DOUBLE											COMMENT '변동 입찰량'
	,MSRMT_PWR_AMT		DOUBLE											COMMENT '계량 전력량'
	,INIT_FRCST_AMT		DOUBLE											COMMENT '초기입찰 예측 제고량'
	,CHNG_FRCST_AMT		DOUBLE											COMMENT '변동입찰 예측 제고량'
	,FRCST_AMT			DOUBLE											COMMENT '예측제고량'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_DALY_INCTV_PK(SEQ_NO, TRX_DT, SET_GNRRS_ID, TM_DV_CD)
);
ALTER TABLE TB_D_DALY_INCTV COMMENT = '월REC정산마감';

/*
 * Table Name : TB_D_MNLY_INCTV
 * Date : October 18, 2016
 * Descripttion : 월별예측 제고량
 */
CREATE TABLE TB_D_MNLY_INCTV
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,BAS_YYMM			CHAR(4)			NOT NULL 						COMMENT '기준년월'
	,TRX_DT				DATETIME			NOT NULL						COMMENT '거래번호'
	,SET_GNRRS_ID		VARCHAR(20)		NOT NULL						COMMENT '집합발전자원아이디'
	,TM_DV_CD			VARCHAR(20)		NOT NULL						COMMENT '시구간구분'
	,INIT_FRCST_AMT		DOUBLE											COMMENT '초기입찰 예측 제고량'
	,CHNG_FRCST_AMT		DOUBLE											COMMENT '변동입찰 예측 제고량'
	,FRCST_AMT			DOUBLE											COMMENT '예측제고량'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_MNLY_INCTV_PK(SEQ_NO, BAS_YYMM, TRX_DT, SET_GNRRS_ID, TM_DV_CD)
);
ALTER TABLE TB_D_MNLY_INCTV COMMENT = '월별예측 제고량';

/*
 * Table Name : TB_D_PRFT
 * Date : October 18, 2016
 * Descripttion : 수익관리
 */
CREATE TABLE TB_D_PRFT
(
	SEQ_NO				INTEGER			NOT NULL UNIQUE AUTO_INCREMENT	COMMENT '관리번호'
	,TRX_DT				DATETIME			NOT NULL						COMMENT '거래번호'
	,SET_GNRRS_ID		VARCHAR(20)										COMMENT '집합발전자원아이디'
	,TOT_PWR_FEE		DOUBLE											COMMENT '전력수수료합'
	,TOT_REC_FEE		DOUBLE											COMMENT 'REC수수료합'
	,INIT_FRCST_AMT		DOUBLE											COMMENT '초기입찰 예측 제고량'
	,CHNG_FRCST_AMT		DOUBLE											COMMENT '변동입찰 예측 제고량'
	,FRCST_AMT			DOUBLE											COMMENT '예측제고량'
	,INCM_TOT_AMT		DOUBLE											COMMENT '수익합'
	,CRT_DT				DATETIME											COMMENT '등록일자'
	,CRT_USR_ID			VARCHAR(32)										COMMENT '등록자'
	,UPD_DT				DATETIME											COMMENT '수정일자'
	,UPD_USR_ID			VARCHAR(32)										COMMENT '수정자'
	,USE_YN				CHAR(1)											COMMENT '사용여부'
	,RMT				VARCHAR(1000)									COMMENT '설명'
	,PRIMARY KEY TB_D_PRFT(SEQ_NO, TRX_DT, SET_GNRRS_ID)
);
ALTER TABLE TB_D_PRFT COMMENT = '수익관리';


INSERT INTO TB_A_CMMN_CD(
	CODE_ID
	,CODE_NM
	,SORT_ORD_NO
	,CODE_LVL_NO
	,CRT_DT
	,CRT_USR_ID
) VALUES (
	'RSRS_DV_CD'
	,'자원구분코드'
	,1
	,'1.0.0.0'
	,curdate()
	,'system'
);

INSERT INTO TB_A_CMMN_CD(
	CODE_ID
	,CODE_NM
	,SORT_ORD_NO
	,CODE_LVL_NO
	,UP_CODE_ID
	,CRT_DT
	,CRT_USR_ID
) VALUES (
	'PV'
	,'태양광'
	,2
	,'1.1.0.0'
	,'RSRS_DV_CD'
	,curdate()
	,'system'
);

INSERT INTO TB_A_CMMN_CD(
	CODE_ID
	,CODE_NM
	,SORT_ORD_NO
	,CODE_LVL_NO
	,UP_CODE_ID
	,CRT_DT
	,CRT_USR_ID
) VALUES (
	'ESS'
	,'ESS'
	,3
	,'1.2.0.0'
	,'RSRS_DV_CD'
	,curdate()
	,'system'
);

INSERT INTO TB_A_CMMN_CD(
	CODE_ID
	,CODE_NM
	,SORT_ORD_NO
	,CODE_LVL_NO
	,UP_CODE_ID
	,CRT_DT
	,CRT_USR_ID
	,USE_YN
) VALUES (
	'EV'
	,'전기자동차'
	,4
	,'1.3.0.0'
	,'RSRS_DV_CD'
	,curdate()
	,'system'
	,'N'
);

INSERT INTO TB_A_CMMN_CD(
	CODE_ID
	,CODE_NM
	,SORT_ORD_NO
	,CODE_LVL_NO
	,CRT_DT
	,CRT_USR_ID
) VALUES (
	'DIV_CD'
	,'카테고리 코드'
	,5
	,'2.0.0.0'
	,curdate()
	,'system'
);

INSERT INTO TB_A_CMMN_CD(
	CODE_ID
	,CODE_NM
	,SORT_ORD_NO
	,CODE_LVL_NO
	,UP_CODE_ID
	,CRT_DT
	,CRT_USR_ID
	,USE_YN
) VALUES (
	'SYSTEM'
	,'시스템공지'
	,6
	,'2.1.0.0'
	,'DIV_CD'
	,curdate()
	,'system'
	,'N'
);

INSERT INTO TB_A_CMMN_CD(
	CODE_ID
	,CODE_NM
	,SORT_ORD_NO
	,CODE_LVL_NO
	,UP_CODE_ID
	,CRT_DT
	,CRT_USR_ID
	,USE_YN
) VALUES (
	'GENERAL'
	,'일반공자'
	,7
	,'2.2.0.0'
	,'DIV_CD'
	,curdate()
	,'system'
	,'N'
);
