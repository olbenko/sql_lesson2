DROP DATABASE IF EXISTS `WhatsApp`;
CREATE DATABASE `WhatsApp`;
USE `WhatsApp`;
SHOW TABLES;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
id_user int primary key not null auto_increment unique,
number char(30) unique not null,
name char(60) not null);

DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
id_profile int primary key not null auto_increment unique,
name char(60),
phone int unique,
birthday date,
photo blob,
user_id int unique not null,
FOREIGN KEY (user_id) REFERENCES `user` (id_user));

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
id_status int primary key not null auto_increment unique,
name char(60),
media_id int not null unique,
user_id int  unique not null,
FOREIGN KEY (user_id) REFERENCES `user` (id_user));


DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
id_media int primary key not null auto_increment unique,
name char(60),
photo blob,
video blob,
FOREIGN KEY (id_media) REFERENCES `status` (media_id));

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
id_messages int primary key not null auto_increment unique,
from_user int not null,
to_user int not null,
text char(120),
date datetime,
FOREIGN KEY (from_user) REFERENCES `user` (id_user),
FOREIGN KEY (to_user) REFERENCES `user` (id_user));




