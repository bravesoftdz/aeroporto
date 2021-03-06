﻿--drop view vw_aeroporto;
--drop view vw_cidade;
--drop view vw_usuario;

create view vw_aeroporto as
select a.id               "Cód."
     , a.nome 			  "Nome"
     , a.tamanho_pista_km "Tamanho da Pista (KM)"
     , c.nome 			  "Cidade"
  from aeroporto a inner join cidade c on (a.id_cidade = c.id);
  
create view vw_cidade as
select id as "Cód."
     , nome as "Nome"
     , populacao as "População"
  from cidade;
  
create view vw_usuario as
select id as "Cód."
     , login as "login"
     , nome as "Nome"  
  from usuario;  
  
                                                                                                                                                                                                                                                                                                                                                                  