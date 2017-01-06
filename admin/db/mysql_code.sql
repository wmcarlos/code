create database code;

use code;

create table cd_cr_column_type(
	column_type_id int auto_increment not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	isactive char(1) not null default 'Y',
	constraint pk_column_type_id primary key (column_type_id)
)engine = InnoDB;

create table cd_cr_window_type(
	window_type_id int auto_increment not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	isactive char(1) not null default 'Y',
	constraint pk_window_type_id primary key (window_type_id)
)engine = InnoDB;

create table cd_cr_element_type(
	element_type_id int auto_increment not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	isactive char(1) not null default 'Y',
	constraint pk_element_type_id primary key (element_type_id)
)engine = InnoDB;

create table cd_cr_field_type(
	field_type_id int auto_increment not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	isactive char(1) not null default 'Y',
	constraint pk_field_type_id primary key (field_type_id)
)engine = InnoDB;

create table cd_cr_item_type(
	item_type_id int auto_increment not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	icon_class varchar(30) null,
	isactive char(1) not null default 'Y',
	constraint pk_item_type_id primary key (item_type_id)
)engine = InnoDB;

create table cd_cr_role(
	role_id int auto_increment not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	isactive char(1) not null default 'Y',
	constraint pk_role_id primary key (role_id)
)engine = InnoDB;

create table cd_cr_list(
	list_id int auto_increment not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	json text,
	list_type char(1) not null default 'I',
	isactive char(1) not null default 'Y',
	constraint pk_list_id primary key (list_id)
)engine = InnoDB;

create table cd_cr_query(
	query_id int auto_increment not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	sqlquery text,
	value varchar(60) not null,
	showname varchar(60) not null,
	isactive char(1) not null default 'Y',
	constraint pk_query_id primary key (query_id)
)engine = InnoDB;

create table cd_cr_table(
	table_id int auto_increment not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	tablename varchar(60) not null,
	name varchar(60) not null,
	isview char(1) not null default 'N',
	isactive char(1) not null default 'Y',
	constraint pk_table_id primary key (table_id)
)engine = InnoDB;

create table cd_cr_column(
	column_id int auto_increment not null,
	table_id int not null,
	column_type_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	columnname varchar(60) not null,
	name varchar(60) not null,
	size numeric,
	position int not null default 0,
	isactive char(1) not null default 'Y',
	constraint pk_column_id primary key (column_id),
	constraint fk_table_id foreign key (table_id) references cd_cr_table (table_id) on update cascade on delete restrict,
	constraint fk_column_type_id foreign key (column_type_id) references cd_cr_column_type (column_type_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_cr_window(
	window_id int auto_increment not null,
	table_id int not null,
	window_type_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	isactive char(1) not null default 'Y',
	constraint pk_window_id primary key (window_id),
	constraint fk_table_id01 foreign key (table_id) references cd_cr_table (table_id) on update cascade on delete restrict,
	constraint fk_window_type_id foreign key (window_type_id) references cd_cr_window_type (window_type_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_cr_field(
	field_id int auto_increment not null,
	column_id int not null,
	field_type_id int not null,
	list_id int not null,
	query_id int not null,
	parent_field_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	name varchar(60) not null,
	showname varchar(60) not null,
	jscondition text,
	ingrid char(1) not null default 'Y',
	isactive char(1) not null default 'Y',
	constraint pk_field_id primary key (field_id),
	constraint fk_column_id foreign key (column_id) references cd_cr_column (column_id) on update cascade on delete restrict,
	constraint fk_field_type_id foreign key (field_type_id) references cd_cr_field_type (field_type_id) on update cascade on delete restrict,
	constraint fk_list_id foreign key (list_id) references cd_cr_list (list_id) on update cascade on delete restrict,
	constraint fk_query_id foreign key (query_id) references cd_cr_query (query_id) on update cascade on delete restrict,
	constraint fk_parent_field_id foreign key (parent_field_id) references cd_cr_field (field_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_cr_element(
	element_id int auto_increment not null,
	window_id int not null,
	element_type_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	position int not null default 0,
	isactive char(1) not null default 'Y',
	constraint pk_element_id primary key (element_id),
	constraint fk_window_id foreign key (window_id) references cd_cr_window (window_id) on update cascade on delete restrict,
	constraint fk_element_type_id foreign key (element_type_id) references cd_cr_element_type (element_type_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_cr_item(
	item_id int auto_increment not null,
	item_type_id int not null,
	parent_item_id int not null,
	window_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	isfor char(1) not null default 'I',
	name varchar(60) not null,
	content text,
	url varchar(150) null,
	position int not null default 0,
	isactive char(1) not null default 'Y',
	constraint pk_item_id primary key (item_id),
	constraint fk_item_type_id foreign key (item_type_id) references cd_cr_item_type (item_type_id) on update cascade on delete restrict,
	constraint fk_parent_item_id foreign key (parent_item_id) references cd_cr_item (item_id) on update cascade on delete restrict,
	constraint fk_window_id001 foreign key (window_id) references cd_cr_window (window_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_cr_user(
	user_id int auto_increment not null,
	role_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	firts_name varchar(60) not null,
	last_name varchar(60) not null,
	sex char(1) not null,
	birthday date not null,
	email varchar(255) not null,
	phone varchar(20) not null,
	username varchar(30) not null,
	password varchar(100) not null,
	isactive char(1) not null default 'Y',
	constraint pk_user_id primary key (user_id),
	constraint fk_role_id foreign key (role_id) references cd_cr_role (role_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_cr_access(
	access_id int auto_increment not null,
	role_id int not null,
	item_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	isactive char(1) not null default 'Y',
	constraint pk_access_id primary key (access_id),
	constraint fk_role_id001 foreign key (role_id) references cd_cr_role (role_id) on update cascade on delete restrict,
	constraint fk_item_id foreign key (item_id) references cd_cr_item (item_id) on update cascade on delete restrict
)engine = InnoDB;

create table cd_cr_post(
	post_id int auto_increment not null,
	user_id int not null,
	created timestamp not null default current_timestamp,
	updated timestamp null,
	title varchar(100) not null,
	content text,
	tags varchar(200) null,
	thumbnail varchar(100) null,
	status char(1) not null default 'D',
	constraint pk_post_id primary key (post_id),
	constraint fk_user_id foreign key (user_id) references cd_cr_user (user_id) on update cascade on delete restrict
)engine = InnoDB;