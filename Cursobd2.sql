--Clase del 7/10/18
--constraint =restricciones
create table almacen (numero_almacen integer, ubicacion_almacen varchar2(80),
                      constraint  pk_na primary key (numero_almacen)
                      );--vamos a generar un procedimiento almacenado para guardar una entidad
                      --una entidad o registro tipo almacen
                      
  create or replace procedure guardar_almacen (mi_id IN integer,
                              mi_ubicacion IN varchar2)
                              as 
                              begin
                              --Aqui la logica del procedimiento 
                      insert into almacen values(mi_id, mi_ubicacion);
                      end;
                      /
                      
                      
--vamos a probar que funciona nuestro procedimiento
begin
guardar_almacen(1,'Plymouth');
end;
/

select *from almacen;