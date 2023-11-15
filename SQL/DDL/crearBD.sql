CREATE TABLE banco (
    id_banco     INTEGER NOT NULL,
    nombre_banco VARCHAR(70),
    estado       BOOLEAN,
    estado_reg   BOOLEAN
);

ALTER TABLE banco ADD CONSTRAINT banco_pk PRIMARY KEY ( id_banco );

CREATE TABLE camara (
    placa        CHAR(10) NOT NULL,
    marca        CHAR(50),
    modelo       CHAR(50),
    id_proveedor INTEGER NOT NULL,
    estado       BOOLEAN,
    estado_reg   BOOLEAN
);

ALTER TABLE camara ADD CONSTRAINT camara_pk PRIMARY KEY ( placa );

CREATE TABLE cliente (
    ruc    CHAR(11) NOT NULL,
    nombre VARCHAR(50)
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( ruc );

CREATE TABLE destino (
    id_destino  INTEGER GENERATED ALWAYS AS IDENTITY,
    nombre      VARCHAR(100),
    abreviatura CHAR(20),
    estado      BOOLEAN,
    estado_reg  BOOLEAN
);

COMMENT ON COLUMN destino.nombre IS
    'Nombre del destino';

COMMENT ON COLUMN destino.abreviatura IS
    'Abreviatura';

ALTER TABLE destino ADD CONSTRAINT destino_pk PRIMARY KEY ( id_destino );

CREATE TABLE embarcacion (
    id_embarcacion INTEGER GENERATED ALWAYS AS IDENTITY,
    id_proveedor   INTEGER NOT NULL,
    nombre         VARCHAR(100),
    num_matricula  VARCHAR(50),
    tonelaje       NUMERIC(10, 2),
    estado         BOOLEAN,
    estado_reg     BOOLEAN
);

COMMENT ON COLUMN embarcacion.id_proveedor IS
    'Señala la embarcación a quien esta asociado como proveedor';

ALTER TABLE embarcacion ADD CONSTRAINT embarcacion_pk PRIMARY KEY ( id_embarcacion );

CREATE TABLE emp_proveedor (
    id_proveedor     INTEGER GENERATED ALWAYS AS IDENTITY,
    id_tipodoc       INTEGER NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    nombre           VARCHAR(70),
    apellido_pat     VARCHAR(70),
    apellido_mat     VARCHAR(70),
    estado_reg       BOOLEAN
);

ALTER TABLE emp_proveedor
    ADD CONSTRAINT emp_proveedor_pk PRIMARY KEY ( id_proveedor,
                                                  id_tipodoc,
                                                  numero_documento );

CREATE TABLE forma_pago (
    id_forma_pago INTEGER NOT NULL,
    nombre        VARCHAR(50),
    estado        BOOLEAN,
    estado_reg    BOOLEAN
);

ALTER TABLE forma_pago ADD CONSTRAINT forma_pago_pk PRIMARY KEY ( id_forma_pago );

CREATE TABLE moneda (
    id_moneda   INTEGER NOT NULL,
    nombre      VARCHAR(20),
    abreviatura CHAR(5)
);

ALTER TABLE moneda ADD CONSTRAINT moneda_pk PRIMARY KEY ( id_moneda );

CREATE TABLE planta (
    id_planta  INTEGER GENERATED ALWAYS AS IDENTITY,
    nombre     VARCHAR(80),
    ruc        CHAR(11) NOT NULL,
    direccion  VARCHAR(100),
    cod_ubigeo VARCHAR(10) NOT NULL,
    estado     BOOLEAN,
    estado_reg BOOLEAN
);

ALTER TABLE planta ADD CONSTRAINT planta_pk PRIMARY KEY ( id_planta );

CREATE TABLE proveedor (
    id_proveedor     INTEGER GENERATED ALWAYS AS IDENTITY,
    razon_social     VARCHAR(100) NOT NULL,
    nombre_comercial VARCHAR(100),
    id_tipodoc       INTEGER NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    direccion        VARCHAR(100),
    telefono         VARCHAR(15),
    correo           VARCHAR(70),
    estado           BOOLEAN NOT NULL,
    estado_reg       BOOLEAN NOT NULL
);

CREATE UNIQUE INDEX proveedor__idx ON
    proveedor (
        numero_documento
    ASC );

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( id_proveedor );

CREATE TABLE rel_embarcacion_proveedor (
    id_embarcacion   INTEGER NOT NULL,
    id_proovedor     INTEGER NOT NULL,
    id_tipo_servicio INTEGER NOT NULL
);

ALTER TABLE rel_embarcacion_proveedor
    ADD CONSTRAINT rel_embarcacion_proveedor_pk PRIMARY KEY ( id_embarcacion,
                                                              id_proovedor,
                                                              id_tipo_servicio );

CREATE TABLE rel_planta_destino (
    id_planta  INTEGER NOT NULL,
    id_destino INTEGER NOT NULL
);

ALTER TABLE rel_planta_destino ADD CONSTRAINT rel_planta_destino_pk PRIMARY KEY ( id_planta,
                                                                                  id_destino );

CREATE TABLE rel_planta_proveedor (
    id_planta        INTEGER NOT NULL,
    id_proveedor     INTEGER NOT NULL,
    id_tipo_servicio INTEGER NOT NULL
);

ALTER TABLE rel_planta_proveedor
    ADD CONSTRAINT planta_proveedor_pk PRIMARY KEY ( id_planta,
                                                     id_proveedor,
                                                     id_tipo_servicio );

CREATE TABLE rel_prov_tiposerv (
    id_proveedor     INTEGER NOT NULL,
    id_tipo_servicio INTEGER NOT NULL,
    estado           BOOLEAN,
    estado_reg       BOOLEAN
);

ALTER TABLE rel_prov_tiposerv ADD CONSTRAINT rel_prov_tiposerv_pk PRIMARY KEY ( id_proveedor,
                                                                                id_tipo_servicio );

CREATE TABLE semana (
    id_semana      INTEGER NOT NULL,
    fecha_inicio INTEGER NOT NULL,
    fecha_fin    INTEGER NOT NULL,
    tipo_semana  CHAR(1) NOT NULL,
    estado       BOOLEAN
);

ALTER TABLE semana ADD CONSTRAINT semana_pk PRIMARY KEY ( id_semana );

CREATE TABLE tipo_cambio (
    id_tipocambio  INTEGER NOT NULL,
    id_moneda_orig INTEGER NOT NULL,
    id_moneda_dest INTEGER NOT NULL,
    valor          NUMERIC(10, 2) NOT NULL
);

ALTER TABLE tipo_cambio ADD CONSTRAINT tipo_cambio_pk PRIMARY KEY ( id_tipocambio,
                                                                    id_moneda_dest );

CREATE TABLE tipo_documento (
    id_tipodoc  INTEGER NOT NULL,
    nombre      VARCHAR(30) NOT NULL,
    abreviatura VARCHAR(15) NOT NULL,
    longitud    INTEGER,
    tipo        CHAR(1),
    estado      BOOLEAN,
    estado_reg  BOOLEAN
);

COMMENT ON COLUMN tipo_documento.estado_reg IS
    '1 = Activo
0 = Eliminado';

ALTER TABLE tipo_documento ADD CONSTRAINT tipo_documento_pk PRIMARY KEY ( id_tipodoc );

CREATE TABLE tipo_servicio (
    id_tipo_servicio INTEGER NOT NULL,
    tipo_tarifa      INTEGER,
    nombre           VARCHAR(100) NOT NULL,
    id_um            INTEGER NOT NULL,
    estado           BOOLEAN,
    estado_reg       BOOLEAN
);

ALTER TABLE tipo_servicio ADD CONSTRAINT tipo_servicio_pk PRIMARY KEY ( id_tipo_servicio );

CREATE TABLE trabajador (
    id_tipodoc       INTEGER NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    nombres          VARCHAR(70) NOT NULL,
    apellido_pat     VARCHAR(70),
    apellido_mat     VARCHAR(70),
    id_forma_pago    INTEGER NOT NULL,
    id_banco         INTEGER NOT NULL,
    cta_bancaria     VARCHAR(40),
    id_moneda        INTEGER NOT NULL,
    estado           BOOLEAN,
    estado_reg       BOOLEAN
);

COMMENT ON COLUMN trabajador.cta_bancaria IS
    'Cuenta Bancaria';

ALTER TABLE trabajador ADD CONSTRAINT trabajador_pk PRIMARY KEY ( id_tipodoc,
                                                                  numero_documento );

CREATE TABLE ubigeo (
    cod_ubigeo   VARCHAR(10) NOT NULL,
    departamento VARCHAR(50),
    provincia    VARCHAR(50),
    distrito     VARCHAR(50),
    superficie   NUMERIC(10, 4),
    posx         NUMERIC(10,4),
    posy         NUMERIC(10, 4),
    estado_reg   BOOLEAN
);

ALTER TABLE ubigeo ADD CONSTRAINT ubigeo_pk PRIMARY KEY ( cod_ubigeo );

CREATE TABLE unidad_medida (
    id_um       INTEGER NOT NULL,
    nombre      VARCHAR(30) NOT NULL,
    abreviatura VARCHAR(5) NOT NULL,
    estado      BOOLEAN,
    estado_reg  BOOLEAN
);

create table dia_semana
(
    id_dia    integer not null constraint dia_semana_pk primary key,
    id_semana integer constraint dia_semana_semana_id_semana_fk references public.semana,
    nombre_dia char(20) NOT NULL,
    caracteristica char(1)
);

comment on table public.dia_semana is 'Realización de dia de semana';

comment on column public.dia_semana.id_dia is 'Id del dia AAAAMMDD';

alter table dia_semana
    add constraint dia_semana_semana_id_semana_fk
        foreign key (id_semana) references semana;

CREATE TABLE tarifario_general (
    id_proveedor     INTEGER NOT NULL,
    id_tipo_servicio INTEGER NOT NULL,
    id_dia           INTEGER NOT NULL,
    id_moneda        INTEGER,
    monto            NUMERIC(10, 2),
    estado           BOOLEAN,
    estado_reg       BOOLEAN
);

ALTER TABLE tarifario_general ADD CONSTRAINT tarifario_general_pk PRIMARY KEY ( id_proveedor, id_tipo_servicio, id_dia );

--  ERROR: FK name length exceeds maximum allowed length(30) 
--ALTER TABLE tarifario_general
--    ADD CONSTRAINT tarifario_general_rel_prov_tiposerv_fk FOREIGN KEY ( id_proveedor,
--                                                                        id_tipo_servicio )
--        REFERENCES rel_prov_tiposerv ( id_proveedor,
--                                       id_tipo_servicio );

ALTER TABLE tarifario_general
    ADD CONSTRAINT tarifario_general_semana_fk FOREIGN KEY ( id_dia )
        REFERENCES dia_semana ( id_dia );
        

ALTER TABLE unidad_medida ADD CONSTRAINT unidad_medida_pk PRIMARY KEY ( id_um );

ALTER TABLE camara
    ADD CONSTRAINT camara_proveedor_fk FOREIGN KEY ( id_proveedor )
        REFERENCES proveedor ( id_proveedor );

ALTER TABLE embarcacion
    ADD CONSTRAINT embarcacion_proveedor_fk FOREIGN KEY ( id_proveedor )
        REFERENCES proveedor ( id_proveedor );

ALTER TABLE emp_proveedor
    ADD CONSTRAINT emp_proveedor_proveedor_fk FOREIGN KEY ( id_proveedor )
        REFERENCES proveedor ( id_proveedor );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE emp_proveedor
    ADD CONSTRAINT emp_proveedor_tipo_documento_fk FOREIGN KEY ( id_tipodoc )
        REFERENCES tipo_documento ( id_tipodoc );

ALTER TABLE planta
    ADD CONSTRAINT planta_cliente_fk FOREIGN KEY ( ruc )
        REFERENCES cliente ( ruc );

ALTER TABLE rel_planta_proveedor
    ADD CONSTRAINT planta_proveedor_planta_fk FOREIGN KEY ( id_planta )
        REFERENCES planta ( id_planta );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE rel_planta_proveedor
    ADD CONSTRAINT planta_proveedor_rel_prov_tiposerv_fk FOREIGN KEY ( id_proveedor,
                                                                       id_tipo_servicio )
        REFERENCES rel_prov_tiposerv ( id_proveedor,
                                       id_tipo_servicio );

ALTER TABLE planta
    ADD CONSTRAINT planta_ubigeo_fk FOREIGN KEY ( cod_ubigeo )
        REFERENCES ubigeo ( cod_ubigeo );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE rel_embarcacion_proveedor
    ADD CONSTRAINT rel_embarcacion_proveedor_embarcacion_fk FOREIGN KEY ( id_embarcacion )
        REFERENCES embarcacion ( id_embarcacion );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE rel_embarcacion_proveedor
    ADD CONSTRAINT rel_embarcacion_proveedor_rel_prov_tiposerv_fk FOREIGN KEY ( id_proovedor,
                                                                                id_tipo_servicio )
        REFERENCES rel_prov_tiposerv ( id_proveedor,
                                       id_tipo_servicio );

ALTER TABLE rel_planta_destino
    ADD CONSTRAINT rel_planta_destino_destino_fk FOREIGN KEY ( id_destino )
        REFERENCES destino ( id_destino );

ALTER TABLE rel_planta_destino
    ADD CONSTRAINT rel_planta_destino_planta_fk FOREIGN KEY ( id_planta )
        REFERENCES planta ( id_planta );

ALTER TABLE rel_prov_tiposerv
    ADD CONSTRAINT rel_prov_tiposerv_proveedor_fk FOREIGN KEY ( id_proveedor )
        REFERENCES proveedor ( id_proveedor );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE rel_prov_tiposerv
    ADD CONSTRAINT rel_prov_tiposerv_tipo_servicio_fk FOREIGN KEY ( id_tipo_servicio )
        REFERENCES tipo_servicio ( id_tipo_servicio );

ALTER TABLE tipo_cambio
    ADD CONSTRAINT tipo_cambio_moneda_fk FOREIGN KEY ( id_moneda_orig )
        REFERENCES moneda ( id_moneda );

ALTER TABLE tipo_servicio
    ADD CONSTRAINT tipo_servicio_unidad_medida_fk FOREIGN KEY ( id_um )
        REFERENCES unidad_medida ( id_um );

ALTER TABLE trabajador
    ADD CONSTRAINT trabajador_banco_fk FOREIGN KEY ( id_banco )
        REFERENCES banco ( id_banco );

ALTER TABLE trabajador
    ADD CONSTRAINT trabajador_forma_pago_fk FOREIGN KEY ( id_forma_pago )
        REFERENCES forma_pago ( id_forma_pago );

ALTER TABLE trabajador
    ADD CONSTRAINT trabajador_moneda_fk FOREIGN KEY ( id_moneda )
        REFERENCES moneda ( id_moneda );

ALTER TABLE trabajador
    ADD CONSTRAINT trabajador_tipo_documento_fk FOREIGN KEY ( id_tipodoc )
        REFERENCES tipo_documento ( id_tipodoc );





DO $$
DECLARE
    year_to_process INTEGER := 2020; -- Puedes cambiar el año según tus necesidades
    fecha_inicio_semana DATE;
    fecha_fin_semana DATE;
    numero_semana_actual INTEGER;
    semana_numero INTEGER;
BEGIN
    FOR numero_semana_actual IN 1..52 -- Suponiendo semanas de 1 a 52 en un año
    LOOP
        -- Obtener la fecha de inicio de la semana actual
        fecha_inicio_semana := (DATE_TRUNC('week', MAKE_DATE(year_to_process, 1, 1)) + (numero_semana_actual - 1) * INTERVAL '1 week')::DATE;

        -- Obtener la fecha de fin de la semana actual
        fecha_fin_semana := fecha_inicio_semana + INTERVAL '6 days';
        semana_numero = year_to_process * 100 + numero_semana_actual;

        INSERT INTO semana(id_semana, fecha_inicio, fecha_fin, tipo_semana, estado)
        VALUES(semana_numero, TO_NUMBER(TO_CHAR(fecha_inicio_semana, 'YYYYMMDD'), '99999999'),
               TO_NUMBER(TO_CHAR(fecha_fin_semana, 'YYYYMMDD'), '99999999'), 'O', true);

        -- Puedes imprimir o hacer cualquier otra operación con el número de semana, fecha de inicio y fecha de fin
        RAISE NOTICE 'Número de Semana: %, Fecha de Inicio: %, Fecha de Fin: %', numero_semana_actual, fecha_inicio_semana, fecha_fin_semana;
    END LOOP;
END $$;


DO $$ 
DECLARE
    fecha_ini INTEGER;
    fecha_f INTEGER;
    semana INTEGER;
    i INTEGER;
    fecha DATE;
    numero_dia_semana INTEGER;
    nombre_dia_semana TEXT;
    dia_inte INTEGER;
BEGIN
    FOR semana, fecha_ini, fecha_f IN SELECT id_semana, fecha_inicio, fecha_fin FROM semana WHERE id_semana BETWEEN 202302 AND 202601
    LOOP
        fecha := TO_DATE(CAST(fecha_ini AS CHAR(8)), 'YYYYMMDD');
        FOR i IN 0..6
        LOOP
            numero_dia_semana := EXTRACT(DOW FROM fecha)::INTEGER;

            dia_inte := TO_NUMBER(TO_CHAR(fecha, 'YYYYMMDD'), '99999999');
            -- Mapear el número del día de la semana al nombre del día
            CASE
                WHEN numero_dia_semana = 0 THEN nombre_dia_semana := 'Domingo';
                WHEN numero_dia_semana = 1 THEN nombre_dia_semana := 'Lunes';
                WHEN numero_dia_semana = 2 THEN nombre_dia_semana := 'Martes';
                WHEN numero_dia_semana = 3 THEN nombre_dia_semana := 'Miércoles';
                WHEN numero_dia_semana = 4 THEN nombre_dia_semana := 'Jueves';
                WHEN numero_dia_semana = 5 THEN nombre_dia_semana := 'Viernes';
                WHEN numero_dia_semana = 6 THEN nombre_dia_semana := 'Sábado';
                ELSE nombre_dia_semana = 'DESCONOCIDO';
            END CASE;
            INSERT INTO dia_semana(id_dia, id_semana, nombre_dia, caracteristica)
            VALUES(dia_inte, semana, nombre_dia_semana, 'O');

            fecha := fecha + INTERVAL '1 day';

        END LOOP;
    END LOOP;
END $$;

