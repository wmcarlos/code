create database code;

use code;

create table cd_module(
	module_id int auto_increment not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(30) not null,
	position int not null default 1,
	icon_class varchar(20) null,
	isactive char(1) not null default 'Y',
	constraint pk_module_id primary key (module_id)
)engine = InnoDB;

create table cd_service(
	service_id int auto_increment not null,
	module_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(30) not null,
	url varchar(100) not null,
	position int not null default 1,
	icon_class varchar(20) null,
	isactive char(1) not null default 'Y',
	constraint pk_service_id primary key (service_id),
	constraint fk_module_id foreign key (module_id) references cd_module (module_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_user(
	user_id int auto_increment not null,
	role int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex char(1) not null,
	birthday date not null,
	email varchar(255) not null,
	phone varchar(20) null,
	username varchar(40) not null,
	password varchar(100) not null,
	avatar varchar(100) not null default 'avatar_blank.jpg',
	isactive char(1) not null default 'Y',
	constraint pk_user_id primary key (user_id)
)engine = InnoDB;

create table cd_access(
	access_id int auto_increment not null,
	user_id int not null,
	role int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	isactive char(1) not null default 'Y',
	constraint pk_access_id primary key (access_id),
	constraint fk_user_id foreign key (user_id) references cd_user (user_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_code(
	code_id int auto_increment not null,
	user_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	wiki text,
	isactive char(1) not null default 'Y',
	constraint pk_code_id primary key (code_id),
	constraint fk_user_id01 foreign key (user_id) references cd_user (user_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_file(
	file_id int auto_increment not null,
	code_id int not null,
	file_type int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(40) not null,
	url varchar(60) not null,
	position int not null default 1,
	developer_code text,
	production_code text,
	isactive char(1) not null default 'Y',
	constraint pk_file_id primary key (file_id),
	constraint fk_code_id foreign key (code_id) references cd_code (code_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_page(
	page_id int auto_increment not null,
	user_id int not null,
	code_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	url varchar(255) not null,
	isactive char(1) not null default 'Y',
	constraint pk_page_id primary key (page_id),
	constraint fk_user_id02 foreign key (user_id) references cd_user (user_id) on update cascade on delete restrict,
	constraint fk_code_id01 foreign key (code_id) references cd_code (code_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_parameter(
	parameter_id int auto_increment not null,
	user_id int not null,
	parameter_type int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	parameter_name varchar(30) not null,
	show_name varchar(30) not null,
	json_values text,
	isactive char(1) not null default 'Y',
	constraint pk_parameter_id primary key (parameter_id),
	constraint fk_user_id03 foreign key (user_id) references cd_user (user_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_paramaeter_code(
	parameter_code_id int auto_increment not null,
	code_id int not null,
	parameter_id int not null,
	page_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	position int not null default 1,
	value varchar(255) not null,
	constraint pk_parameter_code_id primary key (parameter_code_id),
	constraint fk_code_id02 foreign key (code_id) references cd_code (code_id) on update cascade on delete restrict,
	constraint fk_page_id foreign key (page_id) references cd_page (page_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_click(
	click_id int auto_increment not null,
	page_id int not null,
	os varchar(60) null,
	browser varchar(60) null,
	ip varchar(30) not null,
	country_code varchar(10) null,
	country_name varchar(60) null,
	region_name varchar(60) null,
	city varchar(60) null,
	time_zone varchar(60) null,
	latitude varchar(60) null,
	longitude varchar(60) null,
	constraint pk_click_id primary key (click_id),
	constraint fk_page_id01 foreign key (page_id) references cd_page (page_id) on update cascade on delete restrict
)engine = InnoDB;