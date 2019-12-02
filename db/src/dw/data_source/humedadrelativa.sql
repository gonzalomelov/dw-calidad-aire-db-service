insert into dw.humedadrelativa(idrangohumedadrelativa, descrangohumedadrelativa, min, max)
select idrangohumedadrelativa, descrangohumedadrelativa, min, max from data.humedadrelativa;