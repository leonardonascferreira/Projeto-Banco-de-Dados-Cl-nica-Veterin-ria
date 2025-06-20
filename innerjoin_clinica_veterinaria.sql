use db_clinica_veterinaria;

select * from tbl_tutores;
select * from tbl_pets;
select * from tbl_funcionarios;
select * from tbl_cargo;
select * from tbl_veterinarios;
select * from tbl_servicos;
select * from tbl_atendimento;
select * from tbl_atendimento_servico;

/*Lista tutores, seus pets, o funcionário que atendeu e os serviços realizados*/
select tbl_tutores.nome as nome_tutor, tbl_tutores.cpf,
		tbl_pets.nome as nome_pet, tbl_pets.especie,
        tbl_funcionarios.nome as func_atendeu,
        tbl_servicos.nome_servico, tbl_servicos.descricao,
        tbl_atendimento.data_hora, tbl_atendimento.valor_cobrado
from tbl_tutores
		inner join tbl_pets
			on tbl_tutores.id = tbl_pets.id_tutores
		inner join tbl_atendimento
			on tbl_pets.id = tbl_atendimento.id_pets
		inner join tbl_funcionarios
			on tbl_funcionarios.id = tbl_atendimento.id_funcionarios
		inner join tbl_atendimento_servico
			on tbl_atendimento.id = tbl_atendimento_servico.id_atendimento
		inner join tbl_servicos
			on tbl_servicos.id = tbl_atendimento_servico.id_servicos;

/*Lista os veterinários com seus dados pessoais, cargo e especialidade*/
select tbl_funcionarios.nome, tbl_funcionarios.cpf,
		tbl_cargo.nome_cargo,
        tbl_veterinarios.especialidade, tbl_veterinarios.crmv
from tbl_funcionarios
		inner join tbl_cargo
			on tbl_funcionarios.id = tbl_cargo.id_funcionarios
		inner join tbl_veterinarios
			on tbl_funcionarios.id = tbl_veterinarios.id_funcionarios;

/*Lista informações pessoais completas dos tutores (email, telefone, endereço)*/
select tbl_tutores.nome, tbl_tutores.cpf, tbl_tutores.rg,
		tbl_email_tutor.email,
        tbl_telefone_tutor.numero,
        tbl_endereco.logradouro, tbl_endereco.bairro, tbl_endereco.cidade, tbl_endereco.estado
from tbl_tutores
		inner join tbl_email_tutor
			on tbl_tutores.id = tbl_email_tutor.id_tutores
		inner join tbl_telefone_tutor
			on tbl_tutores.id = tbl_telefone_tutor.id_tutores
		inner join tbl_endereco
			on tbl_tutores.id = tbl_endereco.id_tutores;

/*Lista os pets que têm algum histórico (alergia, cirurgia, vacina ou comorbidade) agrupando os dados numa linha*/
select tbl_pets.nome as nome_pet,
		group_concat(distinct tbl_alergias.nome_alergia separator ', ') as alergia,
        group_concat(distinct tbl_cirurgias.nome_cirurgia separator ', ') as cirurgia,
        group_concat(distinct tbl_vacinas.nome_vacina separator ', ') as vacina,
        group_concat(distinct tbl_comorbidades.nome_comorbidade separator ', ') as comorbidade
from tbl_pets
		inner join tbl_historico_pet
			on tbl_pets.id = tbl_historico_pet.id_pets
		left join tbl_alergias
			on tbl_historico_pet.id = tbl_alergias.id_historico_pet
		left join tbl_cirurgias
			on tbl_historico_pet.id = tbl_cirurgias.id_historico_pet
		left join tbl_vacinas
			on tbl_historico_pet.id = tbl_vacinas.id_historico_pet
		left join tbl_comorbidades
			on tbl_historico_pet.id = tbl_comorbidades.id_historico_pet
		group by tbl_pets.id, tbl_pets.nome
        having alergia is not null
			or cirurgia is not null
            or vacina is not null
            or comorbidade is not null;