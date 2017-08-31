create table usuario (
	id integer 				not null,
	login varchar(60) 		not null,
	senha varchar(60)       not null,

	constraint pk_usuario primary key (id),
	constraint uk_usuario_login unique (login)
);

create generator gen_usuario_id;
insert into usuario values (1, 'admin', '21232F297A57A5A743894A0E4A801FC3');