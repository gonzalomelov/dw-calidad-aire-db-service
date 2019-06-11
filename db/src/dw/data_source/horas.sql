insert into dw.horas(idHora, hora, idRangoHoras, descRangoHoras)
select idHora, hora, idRangoHoras, descRangoHoras from data.horas;