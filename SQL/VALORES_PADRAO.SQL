insert into papel values (1, 'Piloto');
insert into papel values (2, 'Comissário');
insert into papel values (3, 'Atendente');
insert into papel values (4, 'Administrador');

insert into permissao values (1, 'Registrar Passagem');
insert into permissao values (2, 'Realizar Check-In');
insert into permissao values (3, 'Confirmar Embarque');
insert into permissao values (4, 'Alterar Horario Embarque');

insert into papel_permissao values (2, 2);
insert into papel_permissao values (2, 3);
insert into papel_permissao values (2, 4);
insert into papel_permissao values (3, 1);
insert into papel_permissao values (3, 2);

insert into usuario values (1, 'admin', '21232F297A57A5A743894A0E4A801FC3', 'Administrador', 4);
