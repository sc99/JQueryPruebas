
create database jquery;
use jquery;

create table alumnos(
idAlumno int not null primary key,
nombre nvarchar(30) not null,
aPaterno nvarchar(30) not null,
aMaterno nvarchar (30) not null);

insert into alumnos values 
(1,'a1','p1','m1'),
(2,'a2','p2','m2');

select * from alumnos;

drop procedure if exists sp_obtenAlumnos;
delimiter **
create procedure sp_obtenAlumnos()
begin
	select * from alumnos;
end; **
delimiter ;

drop procedure if exists sp_nuevoAlumno;
delimiter **
create procedure sp_nuevoAlumno(in nom nvarchar(30),pat nvarchar(30) , mat nvarchar (30))
begin
	declare idA int;
    declare msj nvarchar (20);
    declare exist int(1);
    
    set idA=(select ifnull(max(idAlumno)+1,0) from alumnos);
    set exist=(select count(*) from  alumnos where nombre=nom and aPaterno=pat and aMaterno=mat);
    if exist=1 then
		set msj='Existe';
	else
		insert into alumnos value(idA,nom,pat,mat);
		set msj='Agregado';
    end if;
	select msj as Resultado;
end ; **
delimiter ;

    
call sp_nuevoAlumno('a3','p1','m1');
call sp_obtenAlumnos();