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

---------------------------------------------------------------------------------------------------
--11/10/17


create table vendedor (numero_vendedor integer,
                      nombre_vendedor varchar2(80),
                      area_ventas varchar2(60),
                      constraint pk_nv primary key(numero_vendedor)
                      );
                      
                      DESCRIBE almacen;
                      describe vendedor;
                      
create table cliente (numero_cliente integer,
                      numero_almacen integer,
                      nombre_cliente varchar2(60),
                      constraint pk_nc primary key(numero_cliente),
                      constraint fk1_na foreign key (numero_almacen)
                      references almacen(numero_almacen)
                      );       
create table ventas (id_ventas integer,
                    numero_cliente integer,
                    numero_vendedor integer,
                    monto_venta float,
                    constraint pk_idw1 primary key (id_ventas),
                    constraint fk1_nc1 foreign key(numero_cliente)
                    references cliente,
                    constraint fk2_nv1 foreign key (numero_vendedor)
                    references vendedor                   
                    );                      
                      
                      