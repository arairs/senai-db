select user, host from mysql.user;
create user 'novo-usuario'@'localhost' identified by 'senai@123';
create database pizzaria;
grant all privileges on pizzaria.* to 'novo-usuario'@'localhost';
revoke create on pizzaria.*from 'novo-usuario'@'localhost';

