create view vw_aeroporto as
select a.id               "Cód."
     , a.nome 			  "Nome"
     , a.tamanho_pista_km "Tamanho da Pista (KM)"
     , c.nome 			  "Cidade"
  from aeroporto a inner join cidade c on (a.id_cidade = c.id);
