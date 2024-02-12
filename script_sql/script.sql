CREATE DATABASE sis_administrative;
use sis_administrative;

CREATE TABLE tb_professor(
	cd_professor int not null identity primary key,
	ds_professor varchar(70),
	cpf varchar(15),
	data_nascimento date,
	endereco varchar (80),
	cidade varchar(80),
	curriculo varchar (300),
	email varchar(80),
	foto varchar(20)
)

CREATE TABLE tb_curso(
	cd_curso int not null identity primary key,
	ds_curso varchar(80),
	ativo int default 1,
	resumo text,
	cd_professor int  foreign  key references tb_professor(cd_professor)
) 


CREATE TABLE tb_modulo(
	cd_modulo int identity primary key,
	ds_modulo varchar(80),
	texto_modulo text,
	anexo varchar(20),
	cd_curso int foreign key references tb_curso(cd_curso)
)