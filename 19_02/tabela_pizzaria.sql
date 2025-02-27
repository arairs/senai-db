
use pizzaria;

create table pizza(
id_pizza int auto_increment primary key,
sabor varchar(250),
ingredientes varchar(250)
);

create table regioes(

);

create table estados (

);

create table municipios(

);

select * from pizza;

alter table pizza 
add preco dec(6,2);

create user 'luiz-maia'@'%' identified by 'senai@123';
grant insert,update,select on pizzaria.pizza to 'luiz-maia'@'%';
grant delete on pizzaria.pizza to 'luiz-maia'@'%';
grant select on pizzaria.au_pizza to 'luiz-maia'@'%';

DELIMITER $$
create trigger depois_insert_pizza
after insert on pizza
for each row
begin
insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
values (new.id_pizza, new.sabor, new.ingredientes, user(), now(), 'insert');
end$$

DELIMITER ;


DELIMITER $$
create trigger depois_update_pizza
after update on pizza
for each row
begin
insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
values (old.id_pizza, old.sabor, old.ingredientes, user(), now(), 'update');
end$$

DELIMITER ;

DELIMITER $$
create trigger depois_delete_pizza
before delete on pizza
for each row
begin
insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
values (old.id_pizza, old.sabor, old.ingredientes, user(), now(), 'delete');
end$$

DELIMITER ;

insert into pizza (sabor, ingredientes) values('banana', 'canela e banana');

