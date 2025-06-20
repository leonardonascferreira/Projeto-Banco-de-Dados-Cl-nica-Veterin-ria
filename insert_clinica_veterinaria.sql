use db_clinica_veterinaria;

insert into tbl_tutores (nome, cpf, rg)
								values
                                ('Leonardo Nascimento Ferreira', '68527685682', '123456789'),
                                ('Daniela de Souza Dias', '97015486519', '987654321'),
								('Larissa Mendes Oliveira', '32165498700', '112233445'), 
								('Bruno Almeida Castro', '74185296312', '556677889'),
								('Renata Souza Lima', '15935748625', '778899665'),
								('Gabriel Martins Silva', '98765432144', '334455667');

insert into tbl_telefone_tutor (id_tutores, numero)
								values
                                ('3', '11995556677'),
                                ('4', '11990001122');

insert into tbl_email_tutor (id_tutores, email)
								values
                                ('1', 'leonardo.ferreira@gmail.com'),
                                ('2', 'daniela.dias@hotmail.com'),
                                ('3', 'larissa.oliveira@yahoo.com'),
                                ('6', 'gabriel.silva@yahoo.com');

insert into tbl_endereco (id_tutores, logradouro, bairro, cep, cidade, estado, pais)
								values
                                ('1', 'Rua das Acácias, 123', 'Jardim Primavera', '01234567', 'São Paulo', 'SP', 'Brasil'),
                                ('2', 'Rua das Acácias, 123', 'Jardim Primavera', '01234567', 'São Paulo', 'SP', 'Brasil'),
                                ('6', 'Travessa Jacarandá, 222', 'Parque Industrial', '09876543', 'Guarulhos', 'SP', 'Brasil');

insert into tbl_pets (id_tutores, nome, especie, raca, sexo, data_nascimento, peso, observacoes)
								values
                                ('1', 'Nero', 'Cachorro', 'Doberman', 'M', '2026-09-05', 41.30, null),
								('2', 'Atena', 'Gato', 'SRD', 'F', '2021-12-02', 5.00, 'Muito carinhosa com seus donos'),
								('2', 'Bona', 'Gato', 'SRD', 'F', '2024-03-30', 3.80, null),
								('3', 'Robson', 'Porquinho-da-india', 'SRD', 'M', '2022-08-07', 0.80, null),
								('4', 'Rex', 'Cachorro', 'Boxer', 'M', '2017-08-25', 29.00, null),
								('5', 'Bella', 'Cachorro', 'Poodle', 'F', '2020-12-10', 8.00, null),
								('6', 'Mingau', 'Gato', 'SRD', 'M', '2019-05-01', 5.00, null);

insert into tbl_historico_pet (id_pets, observacoes)
								values
                                ('1', 'Sem registros clínicos até o momento.'),
                                ('4', 'Sem registros clínicos até o momento.'),
                                ('5', 'Pet apresentou sintomas de dermatite e foi vacinado contra raiva.'),
                                ('7', 'Sem registros clínicos até o momento.');

insert into tbl_historico_pet (id_pets, observacoes)
								values
                                ('3', 'Apresenta dificuldade para realizar movimentos que envolvem a articulação do quadril'),
								('1', 'Sinais de espirros, secreção nasal e coceira nos olhos observados durante mudanças de estação, sugerindo uma reação alérgica ao pó e ácaros.'),
								('7', 'Reação cutânea, como urticária e inchaço, após administração de antibióticos à base de penicilina. É importante evitar esse medicamento.');

insert into tbl_vacinas (id_historico_pet, nome_vacina)
								values
                                ('5', 'Vacina Antirrábica');

insert into tbl_comorbidades (id_historico_pet, nome_comorbidade)
								values
                                ('8', 'Displasia coxofemoral');

insert into tbl_alergias (id_historico_pet, nome_alergia)
								values
                                ('10', 'Alergia a medicamentos (penicilina)'),
                                ('9', 'Alergia a ácaros');

insert into tbl_funcionarios (nome, cpf)
								values
                                ('Juliana Castro Lima', '78901234567'),
                                ('Tainá Moura Vasconcelos', '34567890123'),
                                ('Camila Santos Rocha', '56789012345'),
								('Gabriela Fernandes Rocha', '01234567890'),
								('Helena Gomes Carvalho', '88990011223');

insert into tbl_cargo (id_funcionarios, nome_cargo)
								values 
								('5', 'Veterinário'),
								('1', 'Recepcionista'),
								('3', 'Recepcionista'),
								('2', 'Estagiária'),
								('4', 'Atendente');

insert into tbl_telefone_funcionario (id_funcionarios, numero)
								values
								('1','5511912345678'),
								('2','5511934567890'),
								('3','5511987654321');

insert into tbl_email_funcionario (id_funcionarios, email)
								values
								('1','juliana.lima@clinicaveterinaria.com.br'),
								('2','taina.vasconcelos@clinicaveterinaria.com.br'),
                                ('8','gabriela.rocha@clinicaveterinaria.com.br'),
                                ('9','helena.carvalho@clinicaveterinaria.com.br');

insert into tbl_atendimento (id_pets, id_funcionarios, data_hora, valor_cobrado)
								values
								('5', '3', '2025-09-12 09:23:22', '90.00'),
								('1', '1', '2025-09-16 11:57:39', '75.00'),
								('2', '3', '2025-09-17 14:22:56', '40.00');

insert into tbl_servicos (nome, descricao, valor)
								values
								('Vacina contra Raiva', 'Aplicação de vacina para prevenção da raiva, doença viral grave.', '90.00'),
								('Vacina de Vermífugo', 'Aplicação de vacina para prevenção contra vermes intestinais', '75.00');

insert into tbl_atendimento_servico (id_atendimento, id_servicos)
								values
								('1', '1'),
								('2', '2'),
								('3', '3');

insert into tbl_veterinarios (id_funcionarios, especialidade, crmv)
								values
								('5', 'Clinica Geral', 'CRMV-SP12345'),
								('6', 'Cirurgia', 'CRMV-SP23456'),
								('7', 'Anestesiologia', 'CRMV-PR67890'),
								('9', 'Cirurgia Especializada', 'CRMV-RJ34567');