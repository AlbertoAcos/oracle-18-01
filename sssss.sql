

create table menores_edad (id_menores integer primary key , nombre varchar2(60), edad integer);

create or replace procedure generar_mil
as begin
--generamos los mil
for i IN 1..1000 loop
insert into menores_edad values(i,'alberto',46);
end loop;
end;
/
-- vamos a ejecutar el procedimiento 

begin
generar_mil();
end;
/

select * from menores_edad;
select count(*) from menores_edad;

--generar un procedimiento almacenado que nos haga una actualizacion de tal manera que impida que 
--actualiczen edades menores a 18 años. debe marcar un error

create or replace procedure actualizar_edad(age in integer) as
begin
if age<18 then
raise_application_error (-20001,'No acepto edades menores a 18');
else
update menores_edad  set edad=age where id_menores=id;
end if;
end;
/
