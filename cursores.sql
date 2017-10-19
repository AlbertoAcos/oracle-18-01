--18/10/17
--Cursores implicitos: se ocupan para sentencias que usen SELECT con retorno de una sola fila
--Aplicaciones con cursores implicitos y explicitos
--Caso 1 Uniones de tablas(joins) con cursores explicitos
--Creamos la siguiente tabla
create table cartera_clientes(ID integer primary key, nombre varchar2(40),
edad integer, sueldo_base float);

--insertamos datos
insert into cartera_clientes values(1,'Alberto',23,5000);
insert into cartera_clientes values(2,'miguel',24,3000);
insert into cartera_clientes values(3,'Alexis',25,8000);
insert into cartera_clientes values(4,'Tachi',26,7000);
insert into cartera_clientes values(5,'Alan',28,6000);

select * from cartera_clientes;
--Escribir implicito que obtenga el sueldo base de el registro que tiene
--id=3, una vez obtenido que multiplique el sueldo base por 20 horas laboradas y o asigne
--a una variable local llamada pago_nomina
--imprimir el resultado de esa variable

  declare 
  sueldo float;
  pago_nomina float;
  begin
  --declaramos el cursor implicito 
  select sueldo_base into sueldo from cartera_clientes where id=3;
  pago_nomina:=sueldo*20; 
  dbms_output.put_line('El pago es '||pago_nomina);
  end;
  /
  set serveroutput on;
--Genere la siguinete tabla en oracle que tenga su campo
--primary key autoincrementable de 2 en 2 empezando desde el 1
--es decir la secuencia sera 1,3,5,7,9,11
--NOTA=> en oracle no existe el auto incrementable

--En oracle para auto incrementable un primary key se debe usar otro objeto de base de 
--datos llamado secuencia 

--1.- creamos tabla
create table nominas (id_nomina integer primary key, nombre varchar2(60));
--2.- generar una secuencua
create sequence sec_nominas 
start with 1
increment by 2
nomaxvalue;
--3.-creamos procedimiento de incersion 
create or replace procedure guardar_nomina(my_id out integer,
my_nombre in varchar2)
as
begin
select sec_nominas.nextval into my_id from dual;
insert into nominas values(my_id, my_nombre);
end;
/
--finalmente vamos a probar el procedimiento con un bloque pd sql
declare
valor integer;
begin
guardar_nomina(valor,'beto');
dbms_output.put_line('El pk generado es'||valor);
end;
/
select * from nominas;


