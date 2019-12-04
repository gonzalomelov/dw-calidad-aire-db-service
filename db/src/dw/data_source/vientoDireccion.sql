insert into dw.vientodireccion(idrangovientodireccion, descrangovientodireccion, min, max)
select idrangovientodireccion, descrangovientodireccion, min, max from data.vientodireccion;