INSERT INTO TARIFARIO_GENERAL(id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto,estado, estado_reg)
SELECT ID_PROVEEDOR, id_tipo_servicio, CAST(TO_CHAR( CURRENT_TIMESTAMP, 'YYYYMMDD') AS NUMERIC ), id_moneda, monto,estado, estado_reg
FROM tarifario_general
WHERE id_dia in (
    select id_dia from dia_semana
    where id_dia < CAST(TO_CHAR( CURRENT_TIMESTAMP, 'YYYYMMDD') AS NUMERIC )
    order by id_dia DESC
    LIMIT 1
) and estado_reg = true;

INSERT INTO TARIFARIO_EMBARCACION(id_dia, id_embarcacion, id_proveedor, id_tipo_servicio, id_moneda, monto, estado,estado_reg)
SELECT CAST(TO_CHAR( CURRENT_TIMESTAMP, 'YYYYMMDD') AS NUMERIC ), id_embarcacion, id_proveedor, id_tipo_servicio, id_moneda, monto, estado,estado_reg
FROM tarifario_embarcacion
WHERE id_dia in (
    select id_dia from dia_semana
    where id_dia < CAST(TO_CHAR( CURRENT_TIMESTAMP , 'YYYYMMDD') AS NUMERIC )
    order by id_dia DESC
    LIMIT 1
) and estado_reg = true;

INSERT INTO TARIFARIO_PLANTA(id_dia, id_planta, id_proveedor, id_tipo_servicio, id_moneda, monto, estado,estado_reg)
SELECT CAST(TO_CHAR( CURRENT_TIMESTAMP, 'YYYYMMDD') AS NUMERIC ), id_planta, id_proveedor, id_tipo_servicio, id_moneda, monto, estado,estado_reg
FROM tarifario_planta
WHERE id_dia in (
    select id_dia from dia_semana
    where id_dia < CAST(TO_CHAR( CURRENT_TIMESTAMP , 'YYYYMMDD') AS NUMERIC )
    order by id_dia DESC
    LIMIT 1
) and estado_reg = true;

