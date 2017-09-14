delete from usuario;
delete from papel_permissao;
delete from permissao;
delete from papel;

insert into papel values (0, 'Piloto');
insert into papel values (1, 'Comissário');
insert into papel values (2, 'Atendente');
insert into papel values (3, 'Administrador');

insert into permissao values (0, 'Registrar Passagem');
insert into permissao values (1, 'Realizar Check-In');
insert into permissao values (2, 'Confirmar Embarque');
insert into permissao values (3, 'Alterar Horario Embarque');

insert into papel_permissao values (1, 1);
insert into papel_permissao values (1, 2);
insert into papel_permissao values (1, 3);
insert into papel_permissao values (2, 0);
insert into papel_permissao values (2, 1);

insert into usuario values (1, 'Administrador', 'admin', '21232F297A57A5A743894A0E4A801FC3', 3);
