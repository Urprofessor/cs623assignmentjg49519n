create database assignment default character set utf8;

use assignment;

create table AUTHOR(
	EmailAddr varchar(20) not null default '',
	LastName varchar(20) not null default '',
	FirstName varchar(20) not null default '',
	primary key(EmailAddr)
) engine=myisam charset=utf8;

insert into AUTHOR values('ALex@gmail.com', 'Zhao', 'Alex');
insert into AUTHOR values('Bob@gmail.com', 'Qian', 'Bob');
insert into AUTHOR values('Cancy@gmail.com', 'Sun', 'Cancy');

select * from AUTHOR;

create table PAPER(
	ID smallint(4) unsigned not null auto_increment,
	Title varchar(30) not null default '',
	Abstract text not null default '',
	FileName varchar(20) not null default '',
	primary key(ID)
) engine=myisam charset=utf8 auto_increment=1;

insert into PAPER (Title, Abstract, FileName) values('Java', 'Learning', 'Homework1');
insert into PAPER (Title, Abstract, FileName) values('Database', 'Learning', 'Homework2');
insert into PAPER (Title, Abstract, FileName) values('Network', 'Learning', 'Homework2');

create table AUTHOR_SUBMITS_PAPER(
	ID_PAPER smallint(4) unsigned not null,
	EmailAddr_AUTHOR varchar(20) not null default '',
	foreign key(ID_PAPER) references PAPER(ID),
	foreign key(EmailAddr_AUTHOR) references AUTHOR(EmailAddr)
) engine=myisam charset=utf8;

insert into AUTHOR_SUBMITS_PAPER values(1, 'ALex@gmail.com');
insert into AUTHOR_SUBMITS_PAPER values(2, 'Bob@gmail.com');
insert into AUTHOR values('Cancy@gmail.com', 'Sun', 'Cancy');

create table REVIEWER(
	EmailAddr varchar(20) not null default '',
	LastName varchar(20) not null default '',
	FirstName varchar(20) not null default '',
	AuthorFeedback varchar(20) not null default '',
	PhoneNum int(15) not null default 0,
	Affiliation varchar(20) not null default '',
	primary key(EmailAddr)
) engine=myisam charset=utf8;

insert into REVIEWER values('Drux@gmail.com', 'Li', 'Drux', 'Good', '710155321', 'Project1');
insert into REVIEWER values('Elle@gmail.com', 'Zhou', 'Elle', 'Awesome', '719650399', 'Project2');
insert into REVIEWER values('Frank@gmail.com', 'Wu', 'Frank', ':)', '689341699', 'Project3');
insert into REVIEWER values('Grey@gmail.com', 'Zheng', 'Grey', ':(', '718654889', 'Project4');
insert into REVIEWER values('Harry@gmail.com', 'Wang', 'Harry', 'perfect', '718654999', 'Project5');


create table REVIEWER_ASSIGNED_PAPER(
	ID_PAPER smallint(4) unsigned not null,
	EmailAddr_REVIEWER varchar(20) not null default '',
	foreign key(ID_PAPER) references PAPER(ID),
	foreign key(EmailAddr_REVIEWER) references REVIEWER(EmailAddr)
) engine=myisam charset=utf8;

insert into REVIEWER_ASSIGNED_PAPER values(1, 'ALex@gmail.com');
insert into REVIEWER_ASSIGNED_PAPER values(2, 'Bob@gmail.com');
insert into REVIEWER_ASSIGNED_PAPER values(3, 'Cancy@gmail.com');

create table TOPIC(
	ID smallint(4) unsigned not null auto_increment,
	TopicName varchar(30) not null default '',
	primary key(ID)
) engine=myisam charset=utf8 auto_increment=1;

insert into TOPIC (TopicName) values('Deaplearning');
insert into TOPIC (TopicName) values('Network');

create table REVIEWER_HAS_TOPIC(
	EmailAddr_REVIEWER varchar(20) not null default '',
	ID_TOPIC smallint(4) unsigned not null,
	foreign key(ID_TOPIC) references TOPIC(ID),
	foreign key(EmailAddr_REVIEWER) references REVIEWER(EmailAddr)
) engine=myisam charset=utf8;

insert into REVIEWER_HAS_TOPIC values('ALex@gmail.com', 1);
insert into REVIEWER_HAS_TOPIC values('Bob@gmail.com', 2);
insert into REVIEWER_HAS_TOPIC values('Cancy@gmail.com', 3);

create table REVIEW(
	ID smallint(4) unsigned not null auto_increment,
	Recommendation text not null default '',
	MeritScore smallint(4) not null default 0,
	PaperId smallint(4) not null default 1,
	ReadabilityScore smallint(4) not null default 0,
	ReviewerId smallint(4) not null default 1,
	OriginalityScore smallint(4) not null default 0,
	RelevanceScore smallint(4) not null default 0,
	foreign key(PaperId) references PAPER(ID),
	primary key(ID)
) engine=myisam charset=utf8 auto_increment=1;

insert into REVIEW values(1, ' ',67, 1, 99, 1, 96, 90);
insert into REVIEW values(2, ' ', 35, 2, 86, 2, 95, 95);
insert into REVIEW values(3, ' ', 41, 3, 90, 3, 90, 100);

create table REVIEWER_SUBMITS_REVIEW(
	ID_REVIEW smallint(4) unsigned not null,
	EmailAddr_REVIEWER varchar(20) not null default '',
	foreign key(ID_REVIEW) references REVIEW(ID),
	foreign key(EmailAddr_REVIEWER) references REVIEWER(EmailAddr)
) engine=myisam charset=utf8;

insert into REVIEWER_SUBMITS_REVIEW values(1, 'ALex@gmail.com');
insert into REVIEWER_SUBMITS_REVIEW values(2, 'Bob@gmail.com');


