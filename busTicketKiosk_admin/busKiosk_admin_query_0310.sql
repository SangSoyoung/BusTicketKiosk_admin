	/* ���� ��� */
    -- ��ȸ
    select * from bus_data;
    -- �˻�(������)
    select * from bus_data where busNo like '%ex1b1%';
    -- �߰�
    insert into bus_data values ('ex3b1', 40, '�Ϲ�', '�������', '03��1236', '�ڱ浿');
    -- ����
    UPDATE bus_data SET busNo='ex3b1', seat=40, grade='�Ϲ�', company='�������', plate='03��1236', driver='�ڱ浿' where busNo='ex3b1';
    -- ����
    DELETE FROM bus_data WHERE busNo='ex3b1';
    
    --------------------------------------------------------------
    /* ������ �ð�ǥ */
    -- ��ȸ
    select * from bus_timetable where busNo = 'ex1b1';
    -- �˻�(�ð�)
    select * from bus_timetable where busNo = 'ex1b1' and to_char(ddate, 'yyyy-MM-dd')='2022-02-11';
    -- �߰�*
    insert into bus_timetable values (
        'ex1b1', '[����]��������', '[�λ�]���ذ���', 
        to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), 
        to_date('2022-02-11 13:30', 'yyyy-MM-dd HH24:MI'), 
        40, 12, '�Ϲ�', '�¾���');
	-- ����
    UPDATE bus_timetable SET 
        busNo='ex1b1', 
        dpt_st='[����]��������', arrv_st='[�λ�]���ذ���', 
        ddate=to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), 
        adate=to_date('2022-02-11 13:30', 'yyyy-MM-dd HH24:MI'),
        seat=40,
        unBookedSeat=12,
        grade='�Ϲ�',
        company='�¾���'
    where ddate=to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI') and busno='ex1b1';
    -- ����
    DELETE FROM bus_timetable 
        WHERE busNo = 'ex1b1' 
        and ddate=to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI');
    
    -- �ð�ǥ �߰���, *�����¼� ���̺� ���� + �¼����� �߰�*
    /* �����ڵ�(ex1b1) ��߳�¥(2022-02-11) ��߽ð�(09:30) */
    create table bus_seat_ex1b1_20220211_0930 (
        seatNo number(2) primary KEY,
        booking CHAR(1) not null
    );
    /* �������(0)���� �Է� - �Ϲ�(40) | ���(21) �ݺ��� */
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
    /* ������ ��� */
    -- ��ȸ
	select * from bus_station;
    -- �˻�(����/����)
    select * from bus_station where station like '%��%';
    select * from bus_station where city like '%����%';
    /*[tomcat]��û Ÿ�ٿ��� ��ȿ���� ���� ���ڰ� �߰ߵǾ����ϴ�. ��ȿ�� ���ڵ��� RFC 7230�� RFC 3986�� ���ǵǾ� �ֽ��ϴ�.*/
	/* ��Ĺ server.xml�� Connector�� relaxedQueryChars="[]()^|&quot;" �߰� */
	-- �߰�
    insert into bus_station (city, station) values ('����', '[����]�߰�');
	-- ����
    UPDATE bus_station SET city='����', station='[����]���ﳲ��' where station='[����]���ﳲ��';
    -- ����
    DELETE FROM bus_station WHERE station='[����]�߰�';
    
    --------------------------------------------------------------
    /* ���� �ð�ǥ */
    -- ��ȸ
    select * from bus_timetable where dpt_st = '[����]��������';
    -- �˻�(�ð�)
    select * from bus_timetable where dpt_st = '[����]��������' and to_char(ddate, 'yyyyMMdd') = '20220211';
    -- �߰� *�����¼� ���̺� ���� + �¼����� �߰�*
    insert into bus_timetable values ('ex1b1', '[����]��������', '[�λ�]���ذ���', to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), to_date('2022-02-11 13:30', 'yyyy-MM-dd HH24:MI'), 20, 12, '�Ϲ�', '�¾���');
	-- ����
    UPDATE bus_timetable SET 
        busNo='ex1b1', 
        dpt_st='[����]��������', arrv_st='[�λ�]���ذ���', 
        ddate=to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI'), 
        adate=to_date('2022-02-11 13:30', 'yyyy-MM-dd HH24:MI'),
        seat=40,
        unBookedSeat=12,
        grade='�Ϲ�',
        company='�¾���'
    where ddate=to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI') and busno='ex1b1';
    -- ����
    DELETE FROM bus_timetable 
    WHERE busNo = 'ex1b1' 
        and ddate=to_date('2022-02-11 09:30', 'yyyy-MM-dd HH24:MI');
    
    /***************************************************************/
	/* ������� : ���� �߰��(19���̸�) : 20%���� ����(13���̸�) : 50%���� */
    -- ��ȸ
    select * from ticket_price;
    -- �߰�
	insert into ticket_price values('���', 60000);
	-- ����
    UPDATE ticket_price SET type = '���', price=60000 where type = '���';
    -- ����
    DELETE FROM ticket_price WHERE type = '���';


