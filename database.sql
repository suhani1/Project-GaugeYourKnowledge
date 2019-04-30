//users

create table users(first_name char(50),last_name char(50),email varchar(50),user_id varchar(10) not null,password varchar(15),emptype char(1),
constraint chk_emptype check(emptype in('U','A','a','u')),constraint Users_pk primary key(user_id)); 
insert into users values('aaaa','aaaa','aaaa@gmail.com','user1','user1','U');
insert into users values('bbbb','bbbb','bbbb@gmail.com','user2','user2','U');






//exam
create table exam(examid varchar2(20) Primary key,examdescription varchar2(20),skillset varchar2(20),
competencylevel varchar2(10),user_id varchar2(10) references users(user_id));
ALTER TABLE exam modify competencylevel constraint chk_competencylevel check(competencylevel in ('1','2','3')) ;
insert into exam values('ex1','mcq','java','1','user1');
insert into exam values('ex2','mcq','html','2','user1');




//assessment
create table assessment(user_id varchar2(10) references users(user_id),
examid varchar2(20) references exam(examid),examdescription varchar2(20),competencylevel varchar2(10),assessmentid number primary key,starttime timestamp,endtime timestamp);
ALTER TABLE assessment modify competencylevel constraint chk_competency_level check(competencylevel in ('1','2','3')) ;
alter table assessment add score number(3);
insert into assessment values('user1','ex1','mcq','1',100,to_date('03-04-2019 16:00','DD-MM-yyyy HH24:MI'),to_date('03-04-2019 18:00','DD-MM-yyyy HH24:MI'));
insert into assessment values('user2','ex2','mcq','2',101,to_date('03-04-2019 16:00','DD-MM-yyyy HH24:MI'),to_date('03-04-2019 18:00','DD-MM-yyyy HH24:MI'))




//question
create table question(questionid varchar2(10) Primary Key,questioncreator varchar2(15),
question varchar2(500),choice1 varchar2(500), choice2 varchar2(500), choice3 varchar2(500),
 choice4 varchar2(500),selection varchar2(1),skillset varchar2(20),competencylevel varchar2(10),marks number(3));
alter table question add examid varchar2(20) references exam(examid);
ALTER TABLE question modify competencylevel constraint chk_competency_level1 check(competencylevel in ('1','2','3')) ;


//TO SELECT MAX ID
select max(to_number(substr(questionid,2),9999)) from question order by questionid;
