	/* 버스 목록 */
    -- 조회
    select * from bus_data;
    -- 검색(버스명)
    select * from bus_data where busNo like '%ex1b1%';
    -- 추가
    insert into bus_data values ('ex3b1', 40, '일반', '보람고속', '03가1236', '박길동');
    -- 수정
    UPDATE bus_data SET busNo='ex3b1', seat=40, grade='일반', company='보람고속', plate='03가1236', driver='박길동' where busNo='ex3b1';
    -- 삭제
    DELETE FROM bus_data WHERE busNo='ex3b1';
    
    --------------------------------------------------------------
    /* 버스별 시간표 */
    -- 조회
    select * from bus_timetable where busNo = 'ex1b1';
    -- 검색(시간)
    select * from bus_timetable where busNo = 'ex1b1' and to_char(ddate, 'yyyy-MM-dd')='2022-02-11';
    -- 추가*
    insert into bus_timetable values (
        'ex1b1', '[서울]김포공항', '[부산]김해공항', 
        to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), 
        to_date('2022-02-11 13:30', 'yyyy-MM-dd HH24:MI'), 
        40, 12, '일반', '태양고속');
	-- 수정
    UPDATE bus_timetable SET 
        busNo='ex1b1', 
        dpt_st='[서울]김포공항', arrv_st='[부산]김해공항', 
        ddate=to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), 
        adate=to_date('2022-02-11 13:30', 'yyyy-MM-dd HH24:MI'),
        seat=40,
        unBookedSeat=12,
        grade='일반',
        company='태양고속'
    where ddate=to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI') and busno='ex1b1';
    -- 삭제
    DELETE FROM bus_timetable 
        WHERE busNo = 'ex1b1' 
        and ddate=to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI');
    
    -- 시간표 추가시, *버스좌석 테이블 생성 + 좌석정보 추가*
    /* 버스코드(ex1b1) 출발날짜(2022-02-11) 출발시간(09:30) */
    create table bus_seat_ex1b1_20220211_0930 (
        seatNo number(2) primary KEY,
        booking CHAR(1) not null
    );
    /* 예약없음(0)으로 입력 - 일반(40) | 우등(21) 반복문 */
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
    insert into bus_seat_ex1b1_20220211_0930 values ('12', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('13', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('14', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('15', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('16', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('17', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('18', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('19', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('20', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('21', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('22', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('23', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('24', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('25', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('26', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('27', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('28', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('29', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('30', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('31', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('32', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('33', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('34', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('35', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('36', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('37', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('38', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('39', 0);
    insert into bus_seat_ex1b1_20220211_0930 values ('40', 0);
    
    /***************************************************************/
    /* 버스역 목록 */
    -- 조회
	select * from bus_station;
    -- 검색(도시/역명)
    select * from bus_station where station like '%추%';
    select * from bus_station where city like '%서울%';
    /*[tomcat]요청 타겟에서 유효하지 않은 문자가 발견되었습니다. 유효한 문자들은 RFC 7230과 RFC 3986에 정의되어 있습니다.*/
	/* 톰캣 server.xml의 Connector에 relaxedQueryChars="[]()^|&quot;" 추가 */
	-- 추가
    insert into bus_station (city, station) values ('서울', '[서울]추가');
	-- 수정
    UPDATE bus_station SET city='서울', station='[서울]서울남부' where station='[서울]서울남부';
    -- 삭제
    DELETE FROM bus_station WHERE station='[서울]추가';
    
    --------------------------------------------------------------
    /* 역별 시간표 */
    -- 조회
    select * from bus_timetable where dpt_st = '[서울]김포공항';
    -- 검색(시간)
    select * from bus_timetable where dpt_st = '[서울]김포공항' and to_char(ddate, 'yyyyMMdd') = '20220211';
    -- 추가 *버스좌석 테이블 생성 + 좌석정보 추가*
    insert into bus_timetable values ('ex1b1', '[서울]김포공항', '[부산]김해공항', to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 13:30', 'yyyy-MM-dd HH24:MI'), 20, 12, '일반', '태양고속');
	-- 수정
    UPDATE bus_timetable SET 
        busNo='ex1b1', 
        dpt_st='[서울]김포공항', arrv_st='[부산]김해공항', 
        ddate=to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), 
        adate=to_date('2022-02-11 13:30', 'yyyy-MM-dd HH24:MI'),
        seat=40,
        unBookedSeat=12,
        grade='일반',
        company='태양고속'
    where ddate=to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI') and busno='ex1b1';
    -- 삭제
    DELETE FROM bus_timetable 
    WHERE busNo = 'ex1b1' 
        and ddate=to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI');
    
    /***************************************************************/
	/* 버스요금 : 성인 중고생(19세미만) : 20%할인 유아(13세미만) : 50%할인 */
    -- 조회
    select * from ticket_price;
    -- 추가
	insert into ticket_price values('우등', 60000);
	-- 수정
    UPDATE ticket_price SET type = '우등', price=60000 where type = '우등';
    -- 삭제
    DELETE FROM ticket_price WHERE type = '우등';


