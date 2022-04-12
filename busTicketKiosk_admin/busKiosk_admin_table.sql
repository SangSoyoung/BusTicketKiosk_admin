
    /***************************************************************/
    /* ���� ��� ���̺� */
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

    insert into bus_data values ('ex1b1', 40, '�Ϲ�', '�¾���', '01��1234', 'ȫ�浿');
    insert into bus_data values ('ex2b1', 21, '���', '�鸶���', '02��1235', '��浿');
    insert into bus_data values ('ex3b1', 40, '�Ϲ�', '�������', '03��1236', '�ڱ浿');
    select * from bus_data;
    
    /***************************************************************/
    /* ������ ��� */
	create table bus_station (
        city VARCHAR2(20),
        station VARCHAR2(50),
        constraint station_pk primary key(station)
	);
	desc bus_station;
	
	/*[tomcat]��û Ÿ�ٿ��� ��ȿ���� ���� ���ڰ� �߰ߵǾ����ϴ�. ��ȿ�� ���ڵ��� RFC 7230�� RFC 3986�� ���ǵǾ� �ֽ��ϴ�.*/
	/* ��Ĺ server.xml�� Connector�� relaxedQueryChars="[]()^|&quot;" �߰� */
	insert into bus_station (city, station) values ('����', '[����]��������');
	insert into bus_station (city, station) values ('����', '[����]������');
	insert into bus_station (city, station) values ('����', '[����]���');
	insert into bus_station (city, station) values ('����', '[����]���ﳲ��');
	insert into bus_station (city, station) values ('�λ�', '[�λ�]���ذ���');
	insert into bus_station (city, station) values ('�λ�', '[�λ�]�λ굿��(����)');
	insert into bus_station (city, station) values ('�λ�', '[�λ�]�λ꼭��');
	insert into bus_station (city, station) values ('�뱸', '[�뱸]�뱸�Ϻ�');
	insert into bus_station (city, station) values ('�뱸', '[�뱸]�뱸����');
	insert into bus_station (city, station) values ('��õ', '[��õ]��õ');
	insert into bus_station (city, station) values ('��õ', '[��õ]��õ�۵�');
	insert into bus_station (city, station) values ('����', '[����]����(��������)');
	insert into bus_station (city, station) values ('����', '[����]��������');
	commit;
	
	select * from bus_station;
	
	/***************************************************************/
	/* ���� �ð�ǥ : �����ڵ� ��߽ð� �����ð� ���(���/�Ϲ�) �ܿ��� ȸ��*/
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
    
    /* ���±� */
    insert into bus_timetable values ('ex1b1', '[����]��������', '[�λ�]���ذ���', to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 13:30', 'yyyy-MM-dd HH24:MI'), 40, 28, '�Ϲ�', '�¾���');
	insert into bus_timetable values ('ex2b1', '[����]��������', '[�뱸]�뱸�Ϻ�',  to_date('2022-02-11 15:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 19:00', 'yyyy-MM-dd HH24:MI'), 21, 15, '���', '�鸶���');
    insert into bus_timetable values ('ex3b1', '[����]��������', '[��õ]��õ',  to_date('2022-02-11 12:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 16:00', 'yyyy-MM-dd HH24:MI'), 40, 40, '�Ϲ�', '�������');
	/* ���±� */
    insert into bus_timetable values ('ex1b1', '[�λ�]���ذ���', '[����]��������', to_date('2022-02-12 09:30', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-12 13:30', 'yyyy-MM-dd HH24:MI'), 40, 36, '�Ϲ�', '�¾���');
	insert into bus_timetable values ('ex2b1', '[�뱸]�뱸�Ϻ�', '[����]��������',  to_date('2022-02-12 15:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-12 19:00', 'yyyy-MM-dd HH24:MI'), 21, 10, '���', '�鸶���');
    insert into bus_timetable values ('ex3b1', '[��õ]��õ', '[����]��������',  to_date('2022-02-12 12:00', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-12 16:00', 'yyyy-MM-dd HH24:MI'), 40, 22, '�Ϲ�', '�������');
	commit;
    
    select * from bus_timetable;
    
    /***************************************************************/
	/* ����ǥ : ���� �߰��(19���̸�) : 20%���� ����(13���̸�) : 50%���� */
    create table ticket_price (
	    type VARCHAR2(20),
	    price NUMBER(5)
	);
	insert into ticket_price values('���', 60000);
	insert into ticket_price values('�Ϲ�', 30000);
	commit;
    
	select * from ticket_price;
	
    /***************************************************************/
    /*������ ����*/
    create SEQUENCE b_seq;

    /***************************************************************/  
	/* �������� : �����ȣ(sequence), ��߿�, ������, ��߽ð�, ���, ȸ��, ����(����/�߰��/����), ž���ο�, ����, �¼���ȣ*/
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
    /* ���� �¼� ���̺�(�ܿ��¼� Ȯ��): �������� ���� - �Ϲ�(40)/���(21) */
    /* �����ڵ� : ex1b1(�¾���) �ð� : 2022-02-11 09:30 */
    create table bus_seat_ex1b1_20220211_0930 (
        seatNo number(2) primary KEY,
        booking CHAR(1) not null
    );
    desc bus_seat_ex1b1_20220211_0930;
   
    /* �������� : 1 / ������� : 0 */
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
    /*�����ڵ� : ex1b1(�¾���) �ð� : 2022-02-12 09:30 */
    create table bus_seat_ex1b1_20220212_0930 (
        seatNo number(2) primary KEY,
        booking CHAR(1) not null
    );
    desc bus_seat_ex1b1_20220212_0930;

    /* �������� : 1 / ������� : 0 */
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
    