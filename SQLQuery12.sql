create database tecnologia

use tecnologia 

create table Tipo_Usuarios(
	id int primary key identity(1,1),
	tipo_usuario varchar(15) null,

);


create table Empresa(
	id int primary key identity(1,1),
	nombre varchar(100) null,
	direccion varchar(100) null,
	telefono varchar(9) null,
	email_insti varchar(50) null
);

create table Proveedor(
	id int primary key identity(1,1),
	nombre varchar(100) null,
	direccion varchar(100) null,
	telefono varchar(9) null
);

create table Marca_producto(
	id int primary key identity(1,1),
	marca varchar(50) null
);

create table Categoria(
	id int primary key identity(1,1),
	tipo_categoria varchar(50) null,
	descripcion varchar(400) null
)

create table Garantia(
	id int primary key identity(1,1),
	fecha_inicio datetime null,
	fecha_fin datetime null,
	duracion_garantia varchar(100),
	descripcion varchar(400) null
);

create table Producto(
	id int primary key identity(1,1),
	nombre varchar(50) null,
	cantidad int null,
	modelo varchar(50) null,
	costo decimal(4,2) null,
	descripcion varchar(400) null,
	precio_venta decimal(4,2) null,
	fecha_ingreso datetime null,
	imagen_producto image null,
	id_empresa int null,
	id_proveedor int null,
	id_categoria int null,
	id_marca_producto int null,
	id_garantia int null,
	CONSTRAINT FK_ProductoGarantia FOREIGN KEY (id_garantia)     
    REFERENCES Garantia (id),
	CONSTRAINT FK_ProductoMarca FOREIGN KEY (id_marca_producto)     
    REFERENCES Marca_producto (id),
	CONSTRAINT FK_ProductoCategoria FOREIGN KEY (id_categoria)     
    REFERENCES Categoria (id),
	CONSTRAINT FK_ProductoProveedor FOREIGN KEY (id_proveedor)     
    REFERENCES Proveedor (id),
	CONSTRAINT FK_ProductoEmpresa FOREIGN KEY (id_empresa)     
    REFERENCES Empresa (id)
);


create table Cargo(
	id int primary key identity(1,1),
	tipo_cargo varchar(25) null,
	id_empresa int null,
	CONSTRAINT FK_Cargo FOREIGN KEY (id_empresa)     
    REFERENCES Empresa (id)
);

SELECT * FROM Cargo

create table Empleado(
	id int primary key identity(1,1),
	DUI varchar(10) null,
	nombres varchar(150) null,
	email varchar(100) null,
	telefono varchar(9) null,
	direccion varchar(50) null,
	edad int null,
	salario decimal(4,3) null,
	fecha_nac date null,
	id_cargo int null,
	CONSTRAINT FK_CargoEmpresa FOREIGN KEY (id_cargo)     
    REFERENCES Cargo (id)
	
);

INSERT INTO Empleado VALUES ('05967007-2', 'Matthew Gaitan', 'matthew@gmail.com', '7498-3253', 'San Salvador', 20, 500.00, '18-10-25', 1)

create table Cliente(
	id int primary key identity(1,1),
	nombre varchar(150) null,
	email varchar(100) null,
	telefono varchar(9) null,
	id_empresa int null,
	CONSTRAINT FK_Empresa FOREIGN KEY (id_empresa)     
    REFERENCES Empresa (id)
);


create table Usuario(
	id int primary key identity(1,1),
	username varchar(10) null,
	contrasenia varchar(50) null,
	id_tipo int null,
	id_cliente int null,
	id_empleado int null,
	CONSTRAINT FK_Tipo FOREIGN KEY (id_tipo)     
    REFERENCES Tipo_Usuarios (id),
	CONSTRAINT FK_Cliente FOREIGN KEY (id_cliente)     
    REFERENCES Cliente (id),
	CONSTRAINT FK_Empleado FOREIGN KEY (id_empleado)     
    REFERENCES Empleado (id)
);

create table Tipo_servicios(
	id int primary key identity(1,1),
	tipo varchar(300) null
);

create table Servicios(
	id int primary key identity(1,1),
	fecha datetime null,
	precio decimal(4,3),
	id_tipo_servicio int null,
	CONSTRAINT FK_TipoServicios FOREIGN KEY (id_tipo_servicio)
	REFERENCES Tipo_servicios (id)
);

create table Pago(
	id int primary key identity(1,1),
	tipo_pago varchar(100) null,
	id_servicio int null,
	CONSTRAINt FK_PagoServicio FOREIGN KEY (id_servicio)
	REFERENCES Servicios (id)
);


create table Factura(
	id int primary key identity(1,1),
	descripcion varchar(400) null,
	fecha datetime null,
	id_pago int null,
	id_producto int null,
	id_empleado int null,
	CONSTRAINt FK_FacturaEmpleado FOREIGN KEY (id_empleado)
	REFERENCES Empleado (id),
	CONSTRAINT FK_FacturaPago FOREIGN KEY (id_pago)
	REFERENCES Pago (id),
	CONSTRAINT FK_FacturaProducto FOREIGN KEY (id_producto)
	REFERENCES Producto (id)
);

