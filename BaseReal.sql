CREATE DATABASE sistemaCursos;
USE sistemaCursos;

CREATE TABLE Curso (
    idCurso INT PRIMARY KEY NOT NULL, /*1*/
    idMaestro INT NOT NULL,/*1*/
    nombreMaestro VARCHAR(50) NOT NULL,/*petrucho*/
    nombreCurso VARCHAR(50) NOT NULL,/*matematicas1*/
    descripcion VARCHAR(120) NOT NULL,/*mates chidas*/
    fechaInicio DATE NOT NULL,/**/
    fechaFin DATE NOT NULL,/**/
    costo FLOAT NOT NULL,/*100*/
    FOREIGN KEY (idMaestro) REFERENCES Maestro(idMaestro)
);

CREATE TABLE Alumno(
    idAlumno INT PRIMARY KEY NOT NULL,
    nombreAlumno VARCHAR(50) NOT NULL,
    apellidoAlumno VARCHAR(50) NOT NULL,
    usuarioAlumno VARCHAR(50) NOT NULL,
    contrasena VARCHAR(50) NOT NULL,
    correoAlumno VARCHAR(50) NOT NULL,
    telefono VARCHAR(10) NOT NULL
);

INSERT INTO Alumno (idAlumno,nombreAlumno,apellidoAlumno,usuarioAlumno,contrasena,correoAlumno,telefono) VALUES
(1,"Juan","Perez","Juanez45","qwerty123","juanp@gmail.com","3411334543");

CREATE TABLE Maestro (
    idMaestro INT PRIMARY KEY NOT NULL,/*1*/
    nombreMaestro VARCHAR(50) NOT NULL,/*petrucho*/
    apellidoMaestro VARCHAR(50) NOT NULL,/*auditore*/
    usuarioMaestro VARCHAR(50) NOT NULL,/*MasterBros*/
    contrasena VARCHAR(50) NOT NULL,/*qwerty123*/
    correoMaestro VARCHAR(50) NOT NULL,/*petruchoAuditore@gmail.com*/
    telefono VARCHAR(10) NOT NULL/*3411233245*/
);

CREATE TABLE Comentario (
    idComentario INT NOT NULL,/*1*/
    idAlumno INT NOT NULL,/*1......este seria juan perez*/
    idCurso INT NOT NULL,/*1.......este seria matematicas1*/
    comentario VARCHAR(500) NOT NULL,/*Excelente Curso!*/
    PRIMARY KEY (idComentario),
    FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno),
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

CREATE TABLE DetalleCurso (
    idDetalleCurso INT PRIMARY KEY NOT NULL,/*1*/
    idCurso INT NOT NULL,/*1*/
    temario VARCHAR(500) NOT NULL,/*?*/
    materialesEspecificos VARCHAR(500),/*?*/
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

CREATE TABLE Periodo (
    idPeriodo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,/*1*/
    nombrePeriodo VARCHAR(50) NOT NULL/*2024A - 2024B - 2025A - 2025B ETC*/
);

CREATE TABLE CursoPeriodo (
    idCursoPeriodo INT PRIMARY KEY NOT NULL,/*1*/
    idCurso INT NOT NULL,/*1...Este seria matematicas1*/
    idPeriodo INT NOT NULL,/*1...Este seria 2024A*/
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso),
    FOREIGN KEY (idPeriodo) REFERENCES Periodo(idPeriodo)
);

CREATE TABLE CursoPeriodoAlumno (
    idCursoPeriodoAlumno INT NOT NULL AUTO_INCREMENT,/*1*/
    idCurso INT NOT NULL,/*1... Este seria matematicas1*/
    idAlumno INT NOT NULL,/*1... Este sería Juan Perez*/
    estado VARCHAR(20) NOT NULL,/*Pagado*/
    PRIMARY KEY (idCursoPeriodoAlumno),
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso),
    FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
);

CREATE TABLE Pagos (
    idPago INT PRIMARY KEY NOT NULL AUTO_INCREMENT,/*1*/
    idCursoPeriodoAlumno INT NOT NULL,/*1*/
    monto FLOAT NOT NULL,/*100*/
    fechaPago DATE NOT NULL,/*30/04/2024*/
    FOREIGN KEY (idCursoPeriodoAlumno) REFERENCES CursoPeriodoAlumno(idCursoPeriodoAlumno)
);
