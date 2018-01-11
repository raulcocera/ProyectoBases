create database gimnasio;
use gimnasio;
create table cliente(cedula int primary key, nombre varchar(10), apellido varchar(10), fecha_nac date, sexo varchar(9), telefono varchar(20), direccion varchar(50), correo varchar(30));
create table trabajador(cedula varchar(10) primary key, nombre varchar(20), apellido varchar(20), fecha_nac date, sexo varchar(9), telefono varchar(20), direccion varchar(50), correo varchar(30));
create table progreso(id_cliente varchar(10), id_trabajador varchar(10), progreso varchar(50), primary key (id_cliente,id_trabajador), foreign key(id_cliente) references cliente(cedula), foreign key(id_trabajador) references trabajador(cedula));
create table implemento(id_implemento varchar(10) primary key, iva varchar(10), fecha_venta date, fecha_caducidad date, cant_inventario varchar(20));
create table detalle(id_detalle varchar(10) primary key, descripcion varchar(50), producto varchar(10), foreign key(producto) references implemento(id_implemento));
create table entrenamiento(id_entrenamiento varchar(10) primary key, id_cliente varchar(10), id_trabajador varchar(10), foreign key(id_cliente) references cliente(cedula), foreign key(id_trabajador) references trabajador(cedula));
create table compra(id_compra varchar(10) primary key, id_implemento varchar(10), id_trabajador varchar(10), id_cliente varchar(10), total double, descuento varchar(10), foreign key(id_implemento) references implemento(id_implemento), foreign key(id_trabajador) references trabajador(cedula), foreign key(id_cliente) references cliente(cedula));
create table detalle_compra(id_detalle_compra varchar(10) primary key, cantidad int, producto varchar(10), factura varchar(10), precio double, foreign key(producto) references implemento(id_implemento), foreign key(factura) references compra(id_compra));
create table registro_admin(id_registro varchar(10) primary key, id_trabajador varchar(10), sueldo double, cargo varchar(50), horario varchar(100), foreign key(id_trabajador) references trabajador(cedula));
create table forma_pago(id_pago varchar(10) primary key, id_compra varchar(10), forma varchar(20), foreign key(id_compra) references compra(id_compra));
create table rol_pago(id_rol varchar(10) primary key, id_trabajador varchar(10), fecha_pago date, comision varchar(10), forma_pago varchar(20), seguro_social varchar(50), subtotal double, total double, foreign key(id_trabajador) references registro_admin(id_registro), foreign key(forma_pago) references forma_pago(id_pago));
create table membresia(id_membresia varchar(10) primary key, id_cliente varchar(10), fecha_inicio date, fecha_fin date, tipo varchar(15), forma_pago varchar(15), foreign key(id_cliente) references cliente(cedula), foreign key(forma_pago) references forma_pago(id_pago));
create table registro_membresia(id_registromembresia varchar(10) primary key, duracion varchar(30), estado varchar(20), precio double, membresia varchar(10), fecha_registro date, foreign key(membresia) references membresia(id_membresia));
