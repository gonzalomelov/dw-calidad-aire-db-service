insert into dw.vientovelocidad(idrangovientovelocidad, descrangovientovelocidad, min, max)
select idrangovientovelocidad, descrangovientovelocidad, min, max from data.vientovelocidad;