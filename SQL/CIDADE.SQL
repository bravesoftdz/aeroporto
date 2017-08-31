create table cidade (
	id integer not null, 
	nome varchar(60) not null, 
	populacao integer,
	
	constraint pk_cidade primary key (id)
);

create generator gen_cidade_id;
