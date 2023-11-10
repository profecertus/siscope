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
    id_anio      INTEGER NOT NULL,
    fecha_inicio INTEGER NOT NULL,
    fecha_fin    INTEGER NOT NULL,
    tipo_semana  CHAR(1) NOT NULL
);

ALTER TABLE semana ADD CONSTRAINT semana_pk PRIMARY KEY ( id_anio );

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

CREATE TABLE tarifario_general (
    id_proveedor     INTEGER NOT NULL,
    id_tipo_servicio INTEGER NOT NULL,
    id_anio          INTEGER NOT NULL,
    id_moneda        INTEGER,
    monto            NUMERIC(10, 2)
);

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE tarifario_general
    ADD CONSTRAINT tarifario_general_rel_prov_tiposerv_fk FOREIGN KEY ( id_proveedor,
                                                                        id_tipo_servicio )
        REFERENCES rel_prov_tiposerv ( id_proveedor,
                                       id_tipo_servicio );

ALTER TABLE tarifario_general
    ADD CONSTRAINT tarifario_general_semana_fk FOREIGN KEY ( id_anio )
        REFERENCES semana ( id_anio );

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
