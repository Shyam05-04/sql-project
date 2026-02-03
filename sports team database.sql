---using DDL commands---
create database sports;
use sports;

create table cricket(
team_id int primary key auto_increment,
team_name varchar(100),
league_id int);

create table players(
player_num int primary key auto_increment,
player_name varchar(100),
team_id int,
roles varchar(100),
age int,
foreign key(team_id)references cricket(team_id)
);

create table coaches(
coach_id int primary key auto_increment,
first_name varchar(100),
last_name varchar(100),
join_date date,
team_id int,
foreign key (coach_id) references cricket (team_id)
);

create table scores(
match_id int,
team_score int,
team_num int,
primary key (match_id),
foreign key(match_id) references coaches(coach_id)
);

create table leagues(
league_id int primary key auto_increment,
league_name varchar(100)
);

---using DML commands---

insert into cricket(team_name,league_id) values
('india',1),('west indies',2),('australia',3),('england',2),('srilanka',1);

insert into players (player_name,team_id,roles,age)values
('virat kohli',1,'batsman',36),
('chris gayle',2,'batsman',45),
('hardik',3,'all rounder',31),
('ms dhoni',2,'wicket keeper',43),
('r ashwin',1,'bowler',38);

insert into coaches(first_name,last_name,join_date,team_id) values
('rahul','dravid','2024-11-5',1),
('gary','kirsten','2020-09-7',2),
('rickey','ponting','2018-05-9',3),
('stuart','law','2015-08-10',2);

insert into scores (match_id,team_score,team_num) values
(1,168,01),(2,155,02),(3,180,03),(4,177,04);

insert into leagues (league_name) values
('world cup'),('ipl'),('test match'),('T20');

---using DDL and DML COMMANDS---
select * from cricket where team_id='3';
alter table cricket add column native varchar(100);
alter table cricket drop column native;

select player_name,roles from players
where team_id ='2';

update players
set roles='all rounder'
where player_num=2;

---using aggregate functions---

select* from coaches
order by join_date;

select team_id,count(*)as first_name
from coaches
group by team_id;

select distinct team_id 
from coaches
order by team_id;

---using join functions---

select p.player_name
from players p
left join scores s on match_id=s.match_id;
 
select p.player_name
from players p
right join scores s on match_id=s.match_id;



















