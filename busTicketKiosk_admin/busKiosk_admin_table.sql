
    /***************************************************************/
    /* 버스 목록 테이블 */
    create table bus_data (
        busNo VARCHAR2(10),
        SEAT NUMBER(5),
        grade VARCHAR2(20),
        company VARCHAR2(30),
        plate VARCHAR2(30),
        driver VARCHAR2(30),
        CONSTRAINT data_pk PRIMARY KEY(busNo),
        CONSTRAINT plate_uk UNIQUE(plate)
    );
    desc bus_data;

    insert into bus_data values ('ex1b1', 40, '일반', '태양고속', '01가1234', '홍길동');
    insert into bus_data values ('ex2b1', 21, '우등', '백마고속', '02가1235', '고길동');
    insert into bus_data values ('ex3b1', 40, '일반', '보람고속', '03가1236', '박길동');
    select * from bus_data;
    
    /***************************************************************/
    /* 버스역 목록 */
	create table bus_station (
        city VARCHAR2(20),
        station VARCHAR2(50),
        constraint station_pk primary key(station)
	);
	desc bus_station;
	
	/*[tomcat]요청 타겟에서 유효하지 않은 문자가 발견되었습니다. 유효한 문자들은 RFC 7230과 RFC 3986에 정의되어 있습니다.*/
	/* 톰캣 server.xml의 Connector에 relaxedQueryChars="[]()^|&quot;" 추가 */
	insert into bus_station (city, station) values ('서울', '[서울]김포공항');
	insert into bus_station (city, station) values ('서울', '[서울]동서울');
	insert into bus_station (city, station) values ('서울', '[서울]상봉');
	insert into bus_station (city, station) values ('서울', '[서울]서울남부');
	insert into bus_station (city, station) values ('부산', '[부산]김해공항');
	insert into bus_station (city, station) values ('부산', '[부산]부산동부(노포)');
	insert into bus_station (city, station) values ('부산', '[부산]부산서부');
	insert into bus_station (city, station) values ('대구', '[대구]대구북부');
	insert into bus_station (city, station) values ('대구', '[대구]대구서부');
	insert into bus_station (city, station) values ('인천', '[인천]인천');
	insert into bus_station (city, station) values ('인천', '[인천]인천송도');
	insert into bus_station (city, station) values ('광주', '[광주]광주(유스퀘어)');
	insert into bus_station (city, station) values ('대전', '[대전]대전서부');
	commit;
	
	select * from bus_station;
	
	/***************************************************************/
	/* 버스 시간표 : 버스코드 출발시간 도착시간 등급(우등/일반) 잔여석 회사*/
    create table bus_timetable (
        busNo VARCHAR2(10), -- fk
        dpt_st VARCHAR2(50), -- fk
        arrv_st VARCHAR2(50), -- fk
	    ddate date, -- pk
	    adate date,
        seat NUMBER(5),
	    unBookedSeat NUMBER(5),
	    grade VARCHAR2(20),
	    company VARCHAR2(30),
        constraint timetable_pk primary key(ddate),
        constraint busNo_fk foreign key(busNo)
            references bus_data(busNo) on delete cascade,
        constraint dptSt_fk foreign key(dpt_st)
            references bus_station(station) on delete cascade,
        constraint arrvSt_fk foreign key(arrv_st)
            references bus_station(station) on delete cascade
	);
	desc bus_timetable;
    
    /* 가는길 */
    insert into bus_timetable values ('ex1b1', '[서울]김포공항', '[부산]김해공항', to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 13:30', 'yyyy-MM-dd HH24:MI'), 40, 28, '일반', '태양고속');
	insert into bus_timetable values ('ex2b1', '[서울]김포공항', '[대구]대구북부',  to_date('2022-02-11 15:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 19:00', 'yyyy-MM-dd HH24:MI'), 21, 15, '우등', '백마고속');
    insert into bus_timetable values ('ex3b1', '[서울]김포공항', '[인천]인천',  to_date('2022-02-11 12:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 16:00', 'yyyy-MM-dd HH24:MI'), 40, 40, '일반', '보람고속');
	/* 오는길 */
    insert into bus_timetable values ('ex1b1', '[부산]김해공항', '[서울]김포공항', to_date('2022-02-12 09:30', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-12 13:30', 'yyyy-MM-dd HH24:MI'), 40, 36, '일반', '태양고속');
	insert into bus_timetable values ('ex2b1', '[대구]대구북부', '[서울]김포공항',  to_date('2022-02-12 15:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-12 19:00', 'yyyy-MM-dd HH24:MI'), 21, 10, '우등', '백마고속');
    insert into bus_timetable values ('ex3b1', '[인천]인천', '[서울]김포공항',  to_date('2022-02-12 12:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-12 16:00', 'yyyy-MM-dd HH24:MI'), 40, 22, '일반', '보람고속');
	commit;
    
    select * from bus_timetable;
    
    /***************************************************************/
	/* 가격표 : 성인 중고생(19세미만) : 20%할인 유아(13세미만) : 50%할인 */
    create table ticket_price (
	    type VARCHAR2(20),
	    price NUMBER(5)
	);
	insert into ticket_price values('우등', 60000);
	insert into ticket_price values('일반', 30000);
	commit;
    
	select * from ticket_price;
	
    /***************************************************************/
    /*시퀀스 생성*/
    create SEQUENCE b_seq;

    /***************************************************************/  
	/* 예약정보 : 예약번호(sequence), 출발역, 도착역, 출발시간, 등급, 회사, 나이(성인/중고생/유아), 탑승인원, 가격, 좌석번호*/
    create table bus_ticket (
	    bcode number(5),
        dpt_st VARCHAR2(30),
        arrv_st VARCHAR2(30),
	    ddate date,
	    grade VARCHAR2(20),
	    company VARCHAR2(30),
        adult number(2),
        student number(2),
        kid number(2),
        pnum number(3),
        price number(10),
        seatNo varchar2(10),
        constraint ticket_pk primary key(bcode, seatNo)
	);
	desc bus_ticket;
	commit;
    select * from bus_ticket;
    
    /***************************************************************/
    /* 버스 좌석 테이블(잔여좌석 확인): 버스마다 따로 - 일반(40)/우등(21) */
    /* 버스코드 : ex1b1(태양고속) 시간 : 2022-02-11 09:30 */
    create table bus_seat_ex1b1_20220211_0930 (
        seatNo number(2) primary KEY,
        booking CHAR(1) not null
    );
    desc bus_seat_ex1b1_20220211_0930;
   
    /* 예약있음 : 1 / 예약없음 : 0 */
    insert into bus_seat_ex1b1_20220211_0930 values ('1', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('2', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('3', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('4', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('5', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('6', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('7', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('8', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('9', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('10', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('11', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('12', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('13', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('14', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('15', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('16', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('17', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('18', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('19', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('20', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('21', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('22', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('23', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('24', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('25', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('26', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('27', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('28', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('29', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('30', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('31', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('32', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('33', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('34', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('35', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('36', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('37', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('38', 1);
    insert into bus_seat_ex1b1_20220211_0930 values ('39', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('40', 0);    
    commit;
    
    select * from bus_seat_ex1b1_20220211_0930;
    
    /*********************************************************/
    /*버스코드 : ex1b1(태양고속) 시간 : 2022-02-12 09:30 */
    create table bus_seat_ex1b1_20220212_0930 (
        seatNo number(2) primary KEY,
        booking CHAR(1) not null
    );
    desc bus_seat_ex1b1_20220212_0930;

    /* 예약있음 : 1 / 예약없음 : 0 */
    insert into bus_seat_ex1b1_20220212_0930 values ('1', 1);
    insert into bus_seat_ex1b1_20220212_0930 values ('2', 1);
    insert into bus_seat_ex1b1_20220212_0930 values ('3', 1);
    insert into bus_seat_ex1b1_20220212_0930 values ('4', 1);
    insert into bus_seat_ex1b1_20220212_0930 values ('5', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('6', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('7', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('8', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('9', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('10', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('11', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('12', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('13', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('14', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('15', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('16', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('17', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('18', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('19', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('20', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('21', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('22', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('23', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('24', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('25', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('26', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('27', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('28', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('29', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('30', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('31', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('32', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('33', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('34', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('35', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('36', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('37', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('38', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('39', 0);
    insert into bus_seat_ex1b1_20220212_0930 values ('40', 0);
    commit;
    
    select * from bus_seat_ex1b1_20220212_0930;
    