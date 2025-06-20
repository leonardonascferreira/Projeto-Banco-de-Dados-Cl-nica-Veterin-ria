create database db_clinica_veterinaria;

use db_clinica_veterinaria;

create table tbl_tutores (
	id int not null primary key auto_increment,
    nome varchar(100),
    cpf varchar(11) not null unique,
    rg varchar(20) not null unique
);

create table tbl_telefone_tutor (
	id int not null primary key auto_increment,
    numero varchar(45) not null,
    id_tutores int not null,
    
    constraint FK_Tutores_Telefone_Tutor
    foreign key (id_tutores)
    references tbl_tutores (id)
);

create table tbl_email_tutor (
	id int not null primary key auto_increment,
    email varchar(255) not null,
    id_tutores int not null,
    
    constraint FK_Tutores_Email_Tutor
    foreign key (id_tutores)
    references tbl_tutores (id)
);

create table tbl_endereco (
	id int not null primary key auto_increment,
    logradouro varchar(100) not null,
    bairro varchar(60) not null,
    cep varchar(10) not null,
    cidade varchar(60) not null,
    estado char(2) not null,
    pais varchar(60) not null,
    id_tutores int not null,
    
    constraint FK_Tutores_Endereco
    foreign key (id_tutores)
    references tbl_tutores (id)
);

create table tbl_pets (
	id int not null primary key auto_increment,
    nome varchar(100) not null,
    especie varchar(60) not null,
    raca varchar(60) not null,
    sexo char(1) not null,
    data_nascimento date not null,
    peso decimal(5,2) not null,
    observacoes text null,
    id_tutores int not null,
    
    constraint FK_Tutores_Pets
    foreign key (id_tutores)
    references tbl_tutores (id)
);

create table tbl_historico_pet (
	id int not null primary key auto_increment,
    observacoes text null,
    id_pets int not null,
    
    constraint FK_Pets_Historico_Pet
    foreign key (id_pets)
    references tbl_pets (id)
);

create table tbl_alergias (
	id int not null primary key auto_increment,
    nome_alergia varchar(60) not null,
    id_historico_pet int not null,
    
    constraint FK_Historico_Pet_Alergias
    foreign key (id_historico_pet)
	references tbl_historico_pet (id)
);

create table tbl_cirurgias (
	id int not null primary key auto_increment,
    nome_cirurgia varchar(60) not null,
    id_historico_pet int not null,
    
    constraint FK_Historico_Pet_Cirurgias
    foreign key (id_historico_pet)
	references tbl_historico_pet (id)
);

create table tbl_vacinas (
	id int not null primary key auto_increment,
    nome_vacina varchar(60) not null,
    id_historico_pet int not null,
    
    constraint FK_Historico_Pet_Vacinas
    foreign key (id_historico_pet)
	references tbl_historico_pet (id)
);

create table tbl_comorbidades (
	id int not null primary key auto_increment,
    nome_comorbidade varchar(60) not null,
    id_historico_pet int not null,
    
    constraint FK_Historico_Pet_Comorbidades
    foreign key (id_historico_pet)
	references tbl_historico_pet (id)
);

create table tbl_funcionarios (
	id int not null primary key auto_increment,
    nome varchar(100) not null,
    cpf varchar(11) not null unique,
    
    constraint FK_Funcionarios_Cargo
    foreign key (id_funcionarios)
    references tbl_funcionarios (id)
);

create table tbl_cargo (
	id int not null primary key auto_increment,
    nome_cargo varchar(45) not null,
    id_funcionarios int not null,
    
    constraint FK_Funcionarios_Cargo
    foreign key (id_funcionarios)
    references tbl_funcionarios (id)
);

create table tbl_veterinarios (
	id int not null primary key auto_increment,
    crmv varchar(22) not null unique,
    especialidade varchar(45) not null,
    id_funcionarios int not null,
    
    constraint FK_Funcionarios_Veterinarios
    foreign key (id_funcionarios)
    references tbl_funcionarios (id)
);

create table tbl_telefone_funcionario (
	id int not null primary key auto_increment,
    numero varchar(45) not null,
    id_funcionarios int not null,
    
    constraint FK_Funcionarios_Telefone_Funcionario
    foreign key (id_funcionarios)
    references tbl_funcionarios (id)
);

create table tbl_email_funcionario (
	id int not null primary key auto_increment,
    email varchar(255) not null,
    id_funcionarios int not null,
    
    constraint FK_Funcionarios_Email_Funcionario
    foreign key (id_funcionarios)
    references tbl_funcionarios (id)
);

create table tbl_atendimento (
	id int not null primary key auto_increment,
    data_hora datetime not null,
    valor_cobrado decimal(10,2) not null,
    id_pets int not null,
    id_funcionarios int not null,
    
    constraint FK_Pets_Atendimento
    foreign key (id_pets)
    references tbl_pets (id),
    
    constraint FK_Funcionarios_Atendimento
    foreign key (id_funcionarios)
    references tbl_funcionarios (id)
);

create table tbl_servicos (
	id int not null primary key auto_increment,
    nome varchar(45) not null,
    descricao text not null,
    valor decimal(10,2) not null
);

create table tbl_atendimento_servico (
	id int not null primary key auto_increment,
    id_atendimento int not null,
    id_servicos int not null,
    
    constraint FK_Atendimento_Atendimento_Servico
    foreign key (id_atendimento)
    references tbl_atendimento (id),
    
    constraint FK_Servicos_Atendimento_Servico
    foreign key (id_servicos)
    references tbl_servicos (id)
);

show tables;