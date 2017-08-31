create table aeroporto (
	id integer 				not null,
	nome varchar(60) 		not null,
	tamanho_pista_km float  not null,
	id_cidade integer       not null,
	
	constraint pk_aeroporto primary key (id),
	constraint fk_aeroporto_cidade foreign key (id_cidade)
							       references cidade(id)
);

create generator gen_aeroporto_id; 