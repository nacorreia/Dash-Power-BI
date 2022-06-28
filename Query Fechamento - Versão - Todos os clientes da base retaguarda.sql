Use prdretaguarda /*UTILIZAÇÃO DE BANCO DE PRODUÇÃO DO RETAGUARDA*/


/*SELEÇÃO DE VISÃO DE VERSÕES DOS CLIENTES ATIVOS */
/*ANALISANDO PELA DATA DE FECHAMENTO DO CAIXA*/

select 
       l.RedeID,
       r.Nome as nomeRede,
       l.LojaID,
       l.CNPJ,
       l.Nome as nomeLoja,
	   l.Ativo,
       max(ml.DataPing) as maxDataPing,
       min(ml.DataPing) as minDataPing,
       isnull (max(ml.Versao), 'responsivo legado v1 ou v0') as maxVersao,
      (select max(c.DataFechamento) from caixa c where c.LojaID = l.LojaID ) as dtUltFechamento

from loja l
join rede r on r.RedeID = l.RedeID
left join MonitoriaLoja ml on ml.lojaid = l.lojaid 
group by l.lojaid, l.redeid, l.nome,r.Nome, l.CNPJ, l.Ativo



