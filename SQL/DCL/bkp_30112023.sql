--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.0

-- Started on 2023-11-30 18:24:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16760)
-- Name: banco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banco (
    id_banco integer NOT NULL,
    nombre_banco character varying(70),
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.banco OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16765)
-- Name: camara; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.camara (
    placa character(10) NOT NULL,
    marca character(50),
    modelo character(50),
    id_proveedor integer NOT NULL,
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.camara OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16770)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    ruc character(11) NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16776)
-- Name: destino; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.destino (
    id_destino integer NOT NULL,
    nombre character varying(100),
    abreviatura character(20),
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.destino OWNER TO postgres;

--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN destino.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.destino.nombre IS 'Nombre del destino';


--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN destino.abreviatura; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.destino.abreviatura IS 'Abreviatura';


--
-- TOC entry 218 (class 1259 OID 16775)
-- Name: destino_id_destino_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.destino ALTER COLUMN id_destino ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.destino_id_destino_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 241 (class 1259 OID 16869)
-- Name: dia_semana; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dia_semana (
    id_dia integer NOT NULL,
    id_semana integer,
    nombre_dia character(20) NOT NULL,
    caracteristica character(1)
);


ALTER TABLE public.dia_semana OWNER TO postgres;

--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE dia_semana; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dia_semana IS 'Realización de dia de semana';


--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN dia_semana.id_dia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dia_semana.id_dia IS 'Id del dia AAAAMMDD';


--
-- TOC entry 244 (class 1259 OID 17001)
-- Name: dual; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dual (
    valor integer
);


ALTER TABLE public.dual OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16782)
-- Name: embarcacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.embarcacion (
    id_embarcacion integer NOT NULL,
    id_proveedor integer NOT NULL,
    nombre character varying(100),
    num_matricula character varying(50),
    tonelaje numeric(10,2),
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.embarcacion OWNER TO postgres;

--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN embarcacion.id_proveedor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.embarcacion.id_proveedor IS 'Señala la embarcación a quien esta asociado como proveedor';


--
-- TOC entry 220 (class 1259 OID 16781)
-- Name: embarcacion_id_embarcacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.embarcacion ALTER COLUMN id_embarcacion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.embarcacion_id_embarcacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16788)
-- Name: emp_proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emp_proveedor (
    id_proveedor integer NOT NULL,
    id_tipodoc integer NOT NULL,
    numero_documento character varying(20) NOT NULL,
    nombre character varying(70),
    apellido_pat character varying(70),
    apellido_mat character varying(70),
    estado_reg boolean
);


ALTER TABLE public.emp_proveedor OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16787)
-- Name: emp_proveedor_id_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.emp_proveedor ALTER COLUMN id_proveedor ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.emp_proveedor_id_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16793)
-- Name: forma_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forma_pago (
    id_forma_pago integer NOT NULL,
    nombre character varying(50),
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.forma_pago OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16798)
-- Name: moneda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moneda (
    id_moneda integer NOT NULL,
    nombre character varying(20),
    abreviatura character(5)
);


ALTER TABLE public.moneda OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16804)
-- Name: planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planta (
    id_planta integer NOT NULL,
    nombre character varying(80),
    direccion character varying(100),
    cod_ubigeo character varying(10) NOT NULL,
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.planta OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16803)
-- Name: planta_id_planta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.planta ALTER COLUMN id_planta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planta_id_planta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 16810)
-- Name: proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedor (
    id_proveedor integer NOT NULL,
    razon_social character varying(100) NOT NULL,
    nombre_comercial character varying(100),
    id_tipodoc integer NOT NULL,
    numero_documento character varying(20) NOT NULL,
    direccion character varying(100),
    telefono character varying(15),
    correo character varying(70),
    estado boolean NOT NULL,
    estado_reg boolean NOT NULL
);


ALTER TABLE public.proveedor OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16809)
-- Name: proveedor_id_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.proveedor ALTER COLUMN id_proveedor ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.proveedor_id_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16816)
-- Name: rel_embarcacion_proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_embarcacion_proveedor (
    id_embarcacion integer NOT NULL,
    id_proovedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL
);


ALTER TABLE public.rel_embarcacion_proveedor OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 17037)
-- Name: rel_planta_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_planta_cliente (
    ruc character(11) NOT NULL,
    id_planta integer NOT NULL
);


ALTER TABLE public.rel_planta_cliente OWNER TO postgres;

--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE rel_planta_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.rel_planta_cliente IS 'Relacion entre la planta con el cliente';


--
-- TOC entry 231 (class 1259 OID 16821)
-- Name: rel_planta_destino; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_planta_destino (
    id_planta integer NOT NULL,
    id_destino integer NOT NULL
);


ALTER TABLE public.rel_planta_destino OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16826)
-- Name: rel_planta_proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_planta_proveedor (
    id_planta integer NOT NULL,
    id_proveedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL
);


ALTER TABLE public.rel_planta_proveedor OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16831)
-- Name: rel_prov_tiposerv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_prov_tiposerv (
    id_proveedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL,
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.rel_prov_tiposerv OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16836)
-- Name: semana; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semana (
    id_semana integer NOT NULL,
    fecha_inicio integer NOT NULL,
    fecha_fin integer NOT NULL,
    tipo_semana character(1) NOT NULL,
    estado boolean
);


ALTER TABLE public.semana OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16882)
-- Name: tarifario_camara; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarifario_camara (
    cod_ubigeo character varying(10) NOT NULL,
    placa character(10) NOT NULL,
    id_dia integer NOT NULL,
    id_moneda integer,
    monto numeric(10,2),
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.tarifario_camara OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17017)
-- Name: tarifario_embarcacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarifario_embarcacion (
    id_dia integer NOT NULL,
    id_embarcacion integer NOT NULL,
    id_proveedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL,
    id_moneda integer,
    monto numeric(10,2),
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.tarifario_embarcacion OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16879)
-- Name: tarifario_general; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarifario_general (
    id_proveedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL,
    id_dia integer NOT NULL,
    id_moneda integer,
    monto numeric(10,2),
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.tarifario_general OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 17085)
-- Name: tarifario_muelle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarifario_muelle (
    id_proveedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL,
    id_tipo_sub_servicio integer NOT NULL,
    id_dia integer NOT NULL,
    id_moneda integer,
    monto numeric(10,2),
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.tarifario_muelle OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17027)
-- Name: tarifario_planta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarifario_planta (
    id_dia integer NOT NULL,
    id_planta integer NOT NULL,
    id_proveedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL,
    id_moneda integer,
    monto numeric(10,2),
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.tarifario_planta OWNER TO postgres;

--
-- TOC entry 3572 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN tarifario_planta.id_dia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tarifario_planta.id_dia IS 'El dia de la tarifa';


--
-- TOC entry 235 (class 1259 OID 16841)
-- Name: tipo_cambio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_cambio (
    id_tipocambio integer NOT NULL,
    id_moneda_orig integer NOT NULL,
    id_moneda_dest integer NOT NULL,
    valor numeric(10,2) NOT NULL
);


ALTER TABLE public.tipo_cambio OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16846)
-- Name: tipo_documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_documento (
    id_tipodoc integer NOT NULL,
    nombre character varying(30) NOT NULL,
    abreviatura character varying(15) NOT NULL,
    longitud integer,
    tipo character(1),
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.tipo_documento OWNER TO postgres;

--
-- TOC entry 3575 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN tipo_documento.estado_reg; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tipo_documento.estado_reg IS '1 = Activo
0 = Eliminado';


--
-- TOC entry 237 (class 1259 OID 16851)
-- Name: tipo_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_servicio (
    id_tipo_servicio integer NOT NULL,
    tipo_tarifa integer,
    nombre character varying(100) NOT NULL,
    id_um integer NOT NULL,
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.tipo_servicio OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 17074)
-- Name: tipo_sub_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_sub_servicio (
    id_tipo_servicio integer NOT NULL,
    id_tipo_sub_servicio integer NOT NULL,
    nombre character varying(100),
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.tipo_sub_servicio OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 17084)
-- Name: tipo_sub_servicio_id_tipo_sub_servicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tipo_sub_servicio ALTER COLUMN id_tipo_sub_servicio ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tipo_sub_servicio_id_tipo_sub_servicio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 16856)
-- Name: trabajador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trabajador (
    id_tipodoc integer NOT NULL,
    numero_documento character varying(20) NOT NULL,
    nombres character varying(70) NOT NULL,
    apellido_pat character varying(70),
    apellido_mat character varying(70),
    id_forma_pago integer NOT NULL,
    id_banco integer NOT NULL,
    cta_bancaria character varying(40),
    id_moneda integer NOT NULL,
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.trabajador OWNER TO postgres;

--
-- TOC entry 3579 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN trabajador.cta_bancaria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.trabajador.cta_bancaria IS 'Cuenta Bancaria';


--
-- TOC entry 239 (class 1259 OID 16861)
-- Name: ubigeo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ubigeo (
    cod_ubigeo character varying(10) NOT NULL,
    departamento character varying(50),
    provincia character varying(50),
    distrito character varying(50),
    superficie numeric(10,4),
    posx numeric(10,4),
    posy numeric(10,4),
    estado_reg boolean
);


ALTER TABLE public.ubigeo OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16866)
-- Name: unidad_medida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidad_medida (
    id_um integer NOT NULL,
    nombre character varying(30) NOT NULL,
    abreviatura character varying(5) NOT NULL,
    estado boolean,
    estado_reg boolean
);


ALTER TABLE public.unidad_medida OWNER TO postgres;

--
-- TOC entry 3503 (class 0 OID 16760)
-- Dependencies: 215
-- Data for Name: banco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (1, 'BANCO DE CREDITO', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (2, 'ALFIN BANCO', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (3, 'BBVA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (4, 'BANCO BCI', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (5, 'BANCO DEL COMERCIO', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (6, 'BANCO DE LA NACION', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (7, 'BANCO FALABELLA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (8, 'BANCO GNB', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (9, 'BANBIF', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (10, 'INTERBANK', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (11, 'BANCO PICHINCHA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (12, 'BANCO RIPLEY', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (13, 'BANCO SANTANDER ', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (14, 'BANK OF CHINA (PERU)', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (15, 'CITIBANK DEL PERU', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (16, 'ICBC PERU BANK S.A.', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (17, 'MIBANCO', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (18, 'SCOTIABANK PERU', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (19, 'COMPARTAMOS FINANCIE', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (20, 'CREDISCOTIA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (21, 'FINANCIERA CONFIANZA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (22, 'FINANCIERA CREDINKA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (23, 'FINANCIERA EFECTIVA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (24, 'FINANCIERA OH', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (25, 'FINANCIERA PROMESA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (26, 'FINANCIERA QAPAQ', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (27, 'CMAC CUSCO', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (28, 'CMAC AREQUIPA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (29, 'CMAC SULLANA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (30, 'CMAC DEL SANTA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (31, 'CMAC HUANCAYO', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (32, 'CMAC ICA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (33, 'CMAC MAYNAS', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (34, 'CMAC PAITA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (35, 'CMAC PIURA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (36, 'CMAC TACNA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (37, 'CMAC TRUJILLO', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (38, 'CMAC LIMA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (39, 'CRAC CENCOSUD SCOTIA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (40, 'CRAC LOS ANDES', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (41, 'CRAC DEL CENTRO', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (42, 'CRAC PRYMERA', true, true);
INSERT INTO public.banco (id_banco, nombre_banco, estado, estado_reg) VALUES (43, 'CRAC INCASUR', true, true);


--
-- TOC entry 3504 (class 0 OID 16765)
-- Dependencies: 216
-- Data for Name: camara; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.camara (placa, marca, modelo, id_proveedor, estado, estado_reg) VALUES ('D1E 828   ', 'JAC                                               ', 'HFC1131KR1                                        ', 1, true, true);
INSERT INTO public.camara (placa, marca, modelo, id_proveedor, estado, estado_reg) VALUES ('C0Q 920   ', 'DODGE                                             ', 'D-500                                             ', 1, true, true);
INSERT INTO public.camara (placa, marca, modelo, id_proveedor, estado, estado_reg) VALUES ('ADP 892   ', 'VOLKSWAGEN                                        ', '17.250 CONSTELLETION                              ', 1, true, true);


--
-- TOC entry 3505 (class 0 OID 16770)
-- Dependencies: 217
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente (ruc, nombre) VALUES ('20606319551', 'MAREA BAJA SAC');
INSERT INTO public.cliente (ruc, nombre) VALUES ('20604884005', 'GRUPO M Y OLA PEZ S.A.C');
INSERT INTO public.cliente (ruc, nombre) VALUES ('20502510470', 'BELTRAN PERU EIRL');
INSERT INTO public.cliente (ruc, nombre) VALUES ('20403277895', 'INVERSIONES DULCEMAR SAC');
INSERT INTO public.cliente (ruc, nombre) VALUES ('20603582668', 'CMM PRODUCTS SAC');
INSERT INTO public.cliente (ruc, nombre) VALUES ('20480156979', 'CONSORCIO MUZA SAC');
INSERT INTO public.cliente (ruc, nombre) VALUES ('20298256968', 'PACIFIC DEEP FROZEN S.A');
INSERT INTO public.cliente (ruc, nombre) VALUES ('10046448427', 'RIVERA ZAMBRANO GUILLERMO');


--
-- TOC entry 3507 (class 0 OID 16776)
-- Dependencies: 219
-- Data for Name: destino; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.destino (id_destino, nombre, abreviatura, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (1, 'ANCHOA', 'ANC                 ', true, true);
INSERT INTO public.destino (id_destino, nombre, abreviatura, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (2, 'CONSERVA', 'CONS                ', true, true);


--
-- TOC entry 3529 (class 0 OID 16869)
-- Dependencies: 241
-- Data for Name: dia_semana; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240101, 202401, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240102, 202401, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240103, 202401, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240104, 202401, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240105, 202401, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240106, 202401, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240107, 202401, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240108, 202402, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240109, 202402, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240110, 202402, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240111, 202402, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240112, 202402, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240113, 202402, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240114, 202402, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240115, 202403, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240116, 202403, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240117, 202403, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240118, 202403, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240119, 202403, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240120, 202403, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240121, 202403, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240122, 202404, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240123, 202404, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240124, 202404, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240125, 202404, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240126, 202404, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240127, 202404, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240128, 202404, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240129, 202405, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240130, 202405, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240131, 202405, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240201, 202405, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240202, 202405, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240203, 202405, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240204, 202405, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240205, 202406, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240206, 202406, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240207, 202406, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240208, 202406, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240209, 202406, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240210, 202406, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240211, 202406, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240212, 202407, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240213, 202407, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240214, 202407, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240215, 202407, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240216, 202407, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240217, 202407, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240218, 202407, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240219, 202408, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240220, 202408, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240221, 202408, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240222, 202408, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240223, 202408, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240224, 202408, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240225, 202408, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240226, 202409, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240227, 202409, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240228, 202409, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240229, 202409, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240301, 202409, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240302, 202409, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240303, 202409, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240304, 202410, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240305, 202410, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240306, 202410, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240307, 202410, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240308, 202410, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240309, 202410, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240310, 202410, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240311, 202411, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240312, 202411, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240313, 202411, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240314, 202411, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240315, 202411, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240316, 202411, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240317, 202411, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240318, 202412, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240319, 202412, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240320, 202412, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240321, 202412, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240322, 202412, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240323, 202412, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240324, 202412, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240325, 202413, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240326, 202413, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240327, 202413, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240328, 202413, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240329, 202413, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240330, 202413, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240331, 202413, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240401, 202414, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240402, 202414, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240403, 202414, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240404, 202414, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240405, 202414, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240406, 202414, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240407, 202414, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240408, 202415, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240409, 202415, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240410, 202415, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240411, 202415, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240412, 202415, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240413, 202415, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240414, 202415, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240415, 202416, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240416, 202416, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240417, 202416, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240418, 202416, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240419, 202416, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240420, 202416, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240421, 202416, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240422, 202417, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240423, 202417, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240424, 202417, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240425, 202417, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240426, 202417, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240427, 202417, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240428, 202417, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240429, 202418, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240430, 202418, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240501, 202418, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240502, 202418, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240503, 202418, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240504, 202418, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240505, 202418, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240506, 202419, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240507, 202419, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240508, 202419, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240509, 202419, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240510, 202419, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240511, 202419, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240512, 202419, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240513, 202420, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240514, 202420, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240515, 202420, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240516, 202420, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240517, 202420, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240518, 202420, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240519, 202420, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240520, 202421, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240521, 202421, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240522, 202421, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240523, 202421, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240524, 202421, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240525, 202421, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240526, 202421, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240527, 202422, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240528, 202422, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240529, 202422, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240530, 202422, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240531, 202422, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240601, 202422, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240602, 202422, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240603, 202423, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240604, 202423, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240605, 202423, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240606, 202423, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240607, 202423, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240608, 202423, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240609, 202423, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240610, 202424, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240611, 202424, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240612, 202424, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240613, 202424, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240614, 202424, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240615, 202424, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240616, 202424, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240617, 202425, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240618, 202425, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240619, 202425, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240620, 202425, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240621, 202425, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240622, 202425, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240623, 202425, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240624, 202426, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240625, 202426, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240626, 202426, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240627, 202426, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240628, 202426, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240629, 202426, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240630, 202426, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240701, 202427, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240702, 202427, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240703, 202427, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240704, 202427, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240705, 202427, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240706, 202427, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240707, 202427, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240708, 202428, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240709, 202428, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240710, 202428, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240711, 202428, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240712, 202428, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240713, 202428, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240714, 202428, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240715, 202429, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240716, 202429, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240717, 202429, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240718, 202429, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240719, 202429, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240720, 202429, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240721, 202429, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240722, 202430, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240723, 202430, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240724, 202430, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240725, 202430, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240726, 202430, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240727, 202430, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240728, 202430, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240729, 202431, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240730, 202431, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240731, 202431, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240801, 202431, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240802, 202431, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240803, 202431, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240804, 202431, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240805, 202432, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240806, 202432, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240807, 202432, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240808, 202432, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240809, 202432, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240810, 202432, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240811, 202432, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240812, 202433, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240813, 202433, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240814, 202433, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240815, 202433, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240816, 202433, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240817, 202433, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240818, 202433, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240819, 202434, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240820, 202434, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240821, 202434, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240822, 202434, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240823, 202434, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240824, 202434, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240825, 202434, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240826, 202435, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240827, 202435, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240828, 202435, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240829, 202435, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240830, 202435, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240831, 202435, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240901, 202435, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240902, 202436, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240903, 202436, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240904, 202436, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240905, 202436, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240906, 202436, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240907, 202436, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240908, 202436, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240909, 202437, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240910, 202437, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240911, 202437, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240912, 202437, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240913, 202437, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240914, 202437, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240915, 202437, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240916, 202438, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240917, 202438, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240918, 202438, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240919, 202438, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240920, 202438, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240921, 202438, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240922, 202438, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240923, 202439, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240924, 202439, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240925, 202439, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240926, 202439, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240927, 202439, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240928, 202439, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240929, 202439, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20240930, 202440, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241001, 202440, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241002, 202440, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241003, 202440, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241004, 202440, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241005, 202440, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241006, 202440, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241007, 202441, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241008, 202441, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241009, 202441, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241010, 202441, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241011, 202441, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241012, 202441, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241013, 202441, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241014, 202442, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241015, 202442, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241016, 202442, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241017, 202442, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241018, 202442, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241019, 202442, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241020, 202442, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241021, 202443, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241022, 202443, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241023, 202443, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241024, 202443, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241025, 202443, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241026, 202443, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241027, 202443, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241028, 202444, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241029, 202444, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241030, 202444, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241031, 202444, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241101, 202444, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241102, 202444, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241103, 202444, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241104, 202445, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241105, 202445, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241106, 202445, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241107, 202445, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241108, 202445, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241109, 202445, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241110, 202445, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241111, 202446, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241112, 202446, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241113, 202446, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241114, 202446, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241115, 202446, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241116, 202446, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241117, 202446, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241118, 202447, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241119, 202447, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241120, 202447, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241121, 202447, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241122, 202447, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241123, 202447, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241124, 202447, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241125, 202448, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241126, 202448, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241127, 202448, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241128, 202448, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241129, 202448, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241130, 202448, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241201, 202448, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241202, 202449, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241203, 202449, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241204, 202449, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241205, 202449, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241206, 202449, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241207, 202449, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241208, 202449, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241209, 202450, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241210, 202450, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241211, 202450, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241212, 202450, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241213, 202450, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241214, 202450, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241215, 202450, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241216, 202451, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241217, 202451, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241218, 202451, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241219, 202451, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241220, 202451, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241221, 202451, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241222, 202451, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241223, 202452, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241224, 202452, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241225, 202452, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241226, 202452, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241227, 202452, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241228, 202452, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241229, 202452, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241230, 202501, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20241231, 202501, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250101, 202501, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250102, 202501, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250103, 202501, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250104, 202501, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250105, 202501, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250106, 202502, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250107, 202502, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250108, 202502, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250109, 202502, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250110, 202502, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250111, 202502, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250112, 202502, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250113, 202503, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250114, 202503, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250115, 202503, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250116, 202503, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250117, 202503, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250118, 202503, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250119, 202503, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250120, 202504, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250121, 202504, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250122, 202504, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250123, 202504, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250124, 202504, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250125, 202504, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250126, 202504, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250127, 202505, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250128, 202505, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250129, 202505, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250130, 202505, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250131, 202505, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250201, 202505, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250202, 202505, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250203, 202506, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250204, 202506, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250205, 202506, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250206, 202506, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250207, 202506, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250208, 202506, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250209, 202506, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250210, 202507, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250211, 202507, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250212, 202507, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250213, 202507, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250214, 202507, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250215, 202507, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250216, 202507, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250217, 202508, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250218, 202508, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250219, 202508, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250220, 202508, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250221, 202508, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250222, 202508, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250223, 202508, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250224, 202509, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250225, 202509, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250226, 202509, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250227, 202509, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250228, 202509, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250301, 202509, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250302, 202509, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250303, 202510, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250304, 202510, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250305, 202510, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250306, 202510, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250307, 202510, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250308, 202510, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250309, 202510, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250310, 202511, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250311, 202511, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250312, 202511, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250313, 202511, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250314, 202511, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250315, 202511, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250316, 202511, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250317, 202512, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250318, 202512, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250319, 202512, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250320, 202512, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250321, 202512, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250322, 202512, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250323, 202512, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250324, 202513, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250325, 202513, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250326, 202513, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250327, 202513, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250328, 202513, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250329, 202513, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250330, 202513, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250331, 202514, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250401, 202514, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250402, 202514, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250403, 202514, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250404, 202514, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250405, 202514, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250406, 202514, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250407, 202515, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250408, 202515, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250409, 202515, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250410, 202515, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250411, 202515, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250412, 202515, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250413, 202515, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250414, 202516, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250415, 202516, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250416, 202516, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250417, 202516, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250418, 202516, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250419, 202516, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250420, 202516, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250421, 202517, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250422, 202517, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250423, 202517, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250424, 202517, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250425, 202517, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250426, 202517, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250427, 202517, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250428, 202518, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250429, 202518, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250430, 202518, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250501, 202518, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250502, 202518, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250503, 202518, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250504, 202518, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250505, 202519, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250506, 202519, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250507, 202519, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250508, 202519, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250509, 202519, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250510, 202519, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250511, 202519, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250512, 202520, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250513, 202520, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250514, 202520, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250515, 202520, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250516, 202520, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250517, 202520, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250518, 202520, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250519, 202521, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250520, 202521, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250521, 202521, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250522, 202521, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250523, 202521, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250524, 202521, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250525, 202521, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250526, 202522, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250527, 202522, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250528, 202522, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250529, 202522, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250530, 202522, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250531, 202522, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250601, 202522, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250602, 202523, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250603, 202523, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250604, 202523, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250605, 202523, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250606, 202523, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250607, 202523, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250608, 202523, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250609, 202524, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250610, 202524, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250611, 202524, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250612, 202524, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250613, 202524, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250614, 202524, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250615, 202524, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250616, 202525, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250617, 202525, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250618, 202525, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250619, 202525, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250620, 202525, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250621, 202525, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250622, 202525, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250623, 202526, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250624, 202526, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250625, 202526, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250626, 202526, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250627, 202526, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250628, 202526, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250629, 202526, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250630, 202527, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250701, 202527, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250702, 202527, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250703, 202527, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250704, 202527, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250705, 202527, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250706, 202527, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250707, 202528, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250708, 202528, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250709, 202528, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250710, 202528, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250711, 202528, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250712, 202528, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250713, 202528, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250714, 202529, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250715, 202529, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250716, 202529, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250717, 202529, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250718, 202529, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250719, 202529, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250720, 202529, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250721, 202530, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250722, 202530, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250723, 202530, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250724, 202530, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250725, 202530, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250726, 202530, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250727, 202530, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250728, 202531, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250729, 202531, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250730, 202531, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250731, 202531, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250801, 202531, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250802, 202531, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250803, 202531, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250804, 202532, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250805, 202532, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250806, 202532, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250807, 202532, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250808, 202532, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250809, 202532, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250810, 202532, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250811, 202533, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250812, 202533, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250813, 202533, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250814, 202533, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250815, 202533, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250816, 202533, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250817, 202533, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250818, 202534, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250819, 202534, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250820, 202534, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250821, 202534, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250822, 202534, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250823, 202534, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250824, 202534, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250825, 202535, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250826, 202535, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250827, 202535, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250828, 202535, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250829, 202535, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250830, 202535, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250831, 202535, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250901, 202536, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250902, 202536, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250903, 202536, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250904, 202536, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250905, 202536, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250906, 202536, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250907, 202536, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250908, 202537, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250909, 202537, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250910, 202537, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250911, 202537, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250912, 202537, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250913, 202537, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250914, 202537, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250915, 202538, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250916, 202538, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250917, 202538, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250918, 202538, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250919, 202538, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250920, 202538, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250921, 202538, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250922, 202539, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250923, 202539, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250924, 202539, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250925, 202539, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250926, 202539, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250927, 202539, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250928, 202539, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250929, 202540, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20250930, 202540, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251001, 202540, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251002, 202540, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251003, 202540, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251004, 202540, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251005, 202540, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251006, 202541, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251007, 202541, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251008, 202541, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251009, 202541, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251010, 202541, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251011, 202541, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251012, 202541, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251013, 202542, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251014, 202542, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251015, 202542, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251016, 202542, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251017, 202542, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251018, 202542, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251019, 202542, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251020, 202543, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251021, 202543, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251022, 202543, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251023, 202543, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251024, 202543, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251025, 202543, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251026, 202543, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251027, 202544, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251028, 202544, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251029, 202544, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251030, 202544, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251031, 202544, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251101, 202544, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251102, 202544, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251103, 202545, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251104, 202545, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251105, 202545, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251106, 202545, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251107, 202545, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251108, 202545, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251109, 202545, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251110, 202546, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251111, 202546, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251112, 202546, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251113, 202546, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251114, 202546, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251115, 202546, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251116, 202546, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251117, 202547, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251118, 202547, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251119, 202547, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251120, 202547, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251121, 202547, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251122, 202547, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251123, 202547, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251124, 202548, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251125, 202548, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251126, 202548, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251127, 202548, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251128, 202548, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251129, 202548, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251130, 202548, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251201, 202549, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251202, 202549, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251203, 202549, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251204, 202549, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251205, 202549, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251206, 202549, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251207, 202549, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251208, 202550, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251209, 202550, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251210, 202550, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251211, 202550, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251212, 202550, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251213, 202550, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251214, 202550, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251215, 202551, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251216, 202551, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251217, 202551, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251218, 202551, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251219, 202551, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251220, 202551, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251221, 202551, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251222, 202552, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251223, 202552, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251224, 202552, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251225, 202552, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251226, 202552, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251227, 202552, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251228, 202552, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251229, 202601, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251230, 202601, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20251231, 202601, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20260101, 202601, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20260102, 202601, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20260103, 202601, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20260104, 202601, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230102, 202302, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230103, 202302, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230104, 202302, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230105, 202302, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230106, 202302, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230107, 202302, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230108, 202302, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230109, 202303, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230110, 202303, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230111, 202303, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230112, 202303, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230113, 202303, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230114, 202303, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230115, 202303, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230116, 202304, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230117, 202304, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230118, 202304, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230119, 202304, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230120, 202304, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230121, 202304, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230122, 202304, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230123, 202305, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230124, 202305, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230125, 202305, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230126, 202305, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230127, 202305, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230128, 202305, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230129, 202305, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230130, 202306, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230131, 202306, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230201, 202306, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230202, 202306, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230203, 202306, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230204, 202306, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230205, 202306, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230206, 202307, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230207, 202307, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230208, 202307, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230209, 202307, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230210, 202307, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230211, 202307, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230212, 202307, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230213, 202308, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230214, 202308, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230215, 202308, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230216, 202308, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230217, 202308, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230218, 202308, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230219, 202308, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230220, 202309, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230221, 202309, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230222, 202309, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230223, 202309, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230224, 202309, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230225, 202309, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230226, 202309, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230227, 202310, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230228, 202310, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230301, 202310, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230302, 202310, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230303, 202310, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230304, 202310, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230305, 202310, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230306, 202311, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230307, 202311, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230308, 202311, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230309, 202311, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230310, 202311, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230311, 202311, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230312, 202311, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230313, 202312, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230314, 202312, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230315, 202312, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230316, 202312, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230317, 202312, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230318, 202312, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230319, 202312, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230320, 202313, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230321, 202313, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230322, 202313, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230323, 202313, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230324, 202313, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230325, 202313, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230326, 202313, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230327, 202314, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230328, 202314, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230329, 202314, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230330, 202314, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230331, 202314, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230401, 202314, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230402, 202314, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230403, 202315, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230404, 202315, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230405, 202315, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230406, 202315, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230407, 202315, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230408, 202315, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230409, 202315, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230410, 202316, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230411, 202316, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230412, 202316, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230413, 202316, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230414, 202316, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230415, 202316, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230416, 202316, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230417, 202317, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230418, 202317, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230419, 202317, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230420, 202317, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230421, 202317, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230422, 202317, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230423, 202317, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230424, 202318, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230425, 202318, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230426, 202318, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230427, 202318, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230428, 202318, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230429, 202318, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230430, 202318, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230501, 202319, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230502, 202319, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230503, 202319, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230504, 202319, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230505, 202319, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230506, 202319, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230507, 202319, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230508, 202320, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230509, 202320, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230510, 202320, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230511, 202320, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230512, 202320, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230513, 202320, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230514, 202320, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230515, 202321, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230516, 202321, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230517, 202321, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230518, 202321, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230519, 202321, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230520, 202321, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230521, 202321, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230522, 202322, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230523, 202322, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230524, 202322, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230525, 202322, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230526, 202322, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230527, 202322, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230528, 202322, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230529, 202323, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230530, 202323, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230531, 202323, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230601, 202323, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230602, 202323, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230603, 202323, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230604, 202323, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230605, 202324, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230606, 202324, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230607, 202324, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230608, 202324, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230609, 202324, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230610, 202324, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230611, 202324, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230612, 202325, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230613, 202325, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230614, 202325, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230615, 202325, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230616, 202325, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230617, 202325, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230618, 202325, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230619, 202326, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230620, 202326, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230621, 202326, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230622, 202326, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230623, 202326, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230624, 202326, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230625, 202326, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230626, 202327, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230627, 202327, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230628, 202327, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230629, 202327, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230630, 202327, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230701, 202327, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230702, 202327, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230703, 202328, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230704, 202328, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230705, 202328, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230706, 202328, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230707, 202328, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230708, 202328, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230709, 202328, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230710, 202329, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230711, 202329, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230712, 202329, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230713, 202329, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230714, 202329, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230715, 202329, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230716, 202329, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230717, 202330, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230718, 202330, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230719, 202330, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230720, 202330, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230721, 202330, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230722, 202330, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230723, 202330, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230724, 202331, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230725, 202331, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230726, 202331, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230727, 202331, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230728, 202331, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230729, 202331, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230730, 202331, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230731, 202332, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230801, 202332, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230802, 202332, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230803, 202332, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230804, 202332, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230805, 202332, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230806, 202332, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230807, 202333, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230808, 202333, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230809, 202333, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230810, 202333, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230811, 202333, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230812, 202333, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230813, 202333, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230814, 202334, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230815, 202334, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230816, 202334, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230817, 202334, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230818, 202334, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230819, 202334, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230820, 202334, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230821, 202335, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230822, 202335, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230823, 202335, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230824, 202335, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230825, 202335, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230826, 202335, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230827, 202335, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230828, 202336, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230829, 202336, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230830, 202336, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230831, 202336, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230901, 202336, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230902, 202336, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230903, 202336, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230904, 202337, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230905, 202337, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230906, 202337, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230907, 202337, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230908, 202337, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230909, 202337, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230910, 202337, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230911, 202338, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230912, 202338, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230913, 202338, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230914, 202338, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230915, 202338, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230916, 202338, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230917, 202338, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230918, 202339, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230919, 202339, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230920, 202339, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230921, 202339, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230922, 202339, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230923, 202339, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230924, 202339, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230925, 202340, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230926, 202340, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230927, 202340, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230928, 202340, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230929, 202340, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20230930, 202340, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231001, 202340, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231002, 202341, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231003, 202341, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231004, 202341, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231005, 202341, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231006, 202341, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231007, 202341, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231008, 202341, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231009, 202342, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231010, 202342, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231011, 202342, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231012, 202342, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231013, 202342, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231014, 202342, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231015, 202342, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231016, 202343, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231017, 202343, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231018, 202343, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231019, 202343, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231020, 202343, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231021, 202343, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231022, 202343, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231023, 202344, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231024, 202344, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231025, 202344, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231026, 202344, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231027, 202344, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231028, 202344, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231029, 202344, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231030, 202345, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231031, 202345, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231101, 202345, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231102, 202345, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231103, 202345, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231104, 202345, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231105, 202345, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231106, 202346, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231107, 202346, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231108, 202346, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231109, 202346, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231110, 202346, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231111, 202346, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231112, 202346, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231113, 202347, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231114, 202347, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231115, 202347, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231116, 202347, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231117, 202347, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231118, 202347, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231119, 202347, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231120, 202348, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231121, 202348, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231122, 202348, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231123, 202348, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231124, 202348, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231125, 202348, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231126, 202348, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231127, 202349, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231128, 202349, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231129, 202349, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231130, 202349, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231201, 202349, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231202, 202349, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231203, 202349, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231204, 202350, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231205, 202350, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231206, 202350, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231207, 202350, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231208, 202350, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231209, 202350, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231210, 202350, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231211, 202351, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231212, 202351, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231213, 202351, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231214, 202351, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231215, 202351, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231216, 202351, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231217, 202351, 'Domingo             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231218, 202352, 'Lunes               ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231219, 202352, 'Martes              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231220, 202352, 'Miércoles           ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231221, 202352, 'Jueves              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231222, 202352, 'Viernes             ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231223, 202352, 'Sábado              ', 'O');
INSERT INTO public.dia_semana (id_dia, id_semana, nombre_dia, caracteristica) VALUES (20231224, 202352, 'Domingo             ', 'O');


--
-- TOC entry 3532 (class 0 OID 17001)
-- Dependencies: 244
-- Data for Name: dual; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dual (valor) VALUES (0);


--
-- TOC entry 3509 (class 0 OID 16782)
-- Dependencies: 221
-- Data for Name: embarcacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.embarcacion (id_embarcacion, id_proveedor, nombre, num_matricula, tonelaje, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (11, 16, 'JACKSON', '', 0.00, true, true);
INSERT INTO public.embarcacion (id_embarcacion, id_proveedor, nombre, num_matricula, tonelaje, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (3, 3, 'LUNIX EUSMAR', 'PL-27209-CM', 0.00, true, true);
INSERT INTO public.embarcacion (id_embarcacion, id_proveedor, nombre, num_matricula, tonelaje, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (4, 4, 'MI AGUSTINA', 'ZS-02812-BM', 0.00, true, true);
INSERT INTO public.embarcacion (id_embarcacion, id_proveedor, nombre, num_matricula, tonelaje, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (5, 10, 'FRANCESCA PÁOLA', 'ZS-06427-CM', 0.00, true, true);
INSERT INTO public.embarcacion (id_embarcacion, id_proveedor, nombre, num_matricula, tonelaje, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (6, 10, 'ADEMIR', 'CE-26533-CM', 0.00, true, true);
INSERT INTO public.embarcacion (id_embarcacion, id_proveedor, nombre, num_matricula, tonelaje, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (7, 12, 'MI JUANITA', 'CE-34471-CM', 0.00, true, true);
INSERT INTO public.embarcacion (id_embarcacion, id_proveedor, nombre, num_matricula, tonelaje, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (8, 13, 'CALEB', 'PS-23205-CM', 0.00, true, true);
INSERT INTO public.embarcacion (id_embarcacion, id_proveedor, nombre, num_matricula, tonelaje, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (9, 15, 'MI MARGARITA', 'PS-28852-BM', 0.00, true, true);
INSERT INTO public.embarcacion (id_embarcacion, id_proveedor, nombre, num_matricula, tonelaje, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (10, 17, 'CAMILA', 'TA-02327-CM', 0.00, true, true);


--
-- TOC entry 3511 (class 0 OID 16788)
-- Dependencies: 223
-- Data for Name: emp_proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3512 (class 0 OID 16793)
-- Dependencies: 224
-- Data for Name: forma_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.forma_pago (id_forma_pago, nombre, estado, estado_reg) VALUES (1, 'EFECTIVO', true, true);
INSERT INTO public.forma_pago (id_forma_pago, nombre, estado, estado_reg) VALUES (2, 'DEPOSITO EN CUENTA', true, true);


--
-- TOC entry 3513 (class 0 OID 16798)
-- Dependencies: 225
-- Data for Name: moneda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moneda (id_moneda, nombre, abreviatura) VALUES (1, 'SOLES', 'S/.  ');
INSERT INTO public.moneda (id_moneda, nombre, abreviatura) VALUES (2, 'DOLARES', '$    ');


--
-- TOC entry 3515 (class 0 OID 16804)
-- Dependencies: 227
-- Data for Name: planta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planta (id_planta, nombre, direccion, cod_ubigeo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (1, 'GRUPO M Y OLA PEZ S.A.C.', '', 'A021809', true, true);
INSERT INTO public.planta (id_planta, nombre, direccion, cod_ubigeo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (2, 'PLANTA NEPTUNO', '', 'A021801', true, true);
INSERT INTO public.planta (id_planta, nombre, direccion, cod_ubigeo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (3, 'BELTRAN PERU EIRL', '', 'A021801', true, true);
INSERT INTO public.planta (id_planta, nombre, direccion, cod_ubigeo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (4, 'INVERSIONES DULCEMAR SAC', '', 'A021803', true, true);
INSERT INTO public.planta (id_planta, nombre, direccion, cod_ubigeo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (5, 'CMM PRODUCTS SAC', '', 'A021809', true, true);
INSERT INTO public.planta (id_planta, nombre, direccion, cod_ubigeo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (8, 'CONSORCIO  MUZA SAC', '', 'A200801', true, true);
INSERT INTO public.planta (id_planta, nombre, direccion, cod_ubigeo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (9, 'PACIFIC DEEP FROZEN S.A.', '', 'A021103', true, true);


--
-- TOC entry 3517 (class 0 OID 16810)
-- Dependencies: 229
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (1, 'NEGOCIO E INVERSION FRESCOMAR EIRL', 'FRESCOMAR', 6, '20569231877', 'AV. JOSE GALVEZ No. 900', '947117894', 'CFRESCOMAR1@HOTMAIL.COM', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (3, 'BERNAL LUMBRES JUAN FREDDY', 'FREDDY BERNAL', 6, '10403920873', 'CALLE COLON No. 920 -LAMBAYEQUE', '933226801', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (4, 'FIESTAS GALAN MANUEL HUMBERTO', 'POOL AGUSTINA', 6, '10425846201', 'AV. COSTANERA No. 2200 DPTO 1302 LIMA SAN MIGUEL', '928680297', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (2, 'SERVICIO CONSEVERO PESCARTE SAC', 'CRIDANI', 6, '20608991418', 'CAL SANTA HONORATA 360 URB PANDO ET TRES DPTO 101', '933649080', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (5, 'SERVICIOS GENERALES HUGOMAR EIRL', 'HUGO CORTEZ', 6, '20600801962', 'AV ARICA MZ. G LT 23 LA VICTORIA - CHIMBOTE', '933452385', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (6, 'NEGOCIACIONES STEFANY EIRL', 'SERVIMAR', 6, '20602946828', 'JR. MANUEL RUIZ 109 - CHIMBOTE', '998344048', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (7, 'BADA CRUZ MIGUEL ANGEL', 'HIELO BADA', 6, '10451193649', 'JR. HUASCAR EL PORVENIR MZA B LTE 13 POZO 5 DE SEDACHIMBOTE', '933311208', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (8, 'ROLDAN DOLORES MARCO ANTONIO', 'MARCO ANTONIO', 1, '43819102', 'SAN JUAN MZA 23 LTE 6 PASAJE 4', '934551016', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (9, 'CRUZADO ARQUINIGO MIGUEL ANGEL', 'MIGUEL BELTRAN', 1, '42846246', 'JR LIMA 852 - CHIMBOTE - FLORIDA BAJA', '920993788', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (10, 'PESQUERA NEVENKA EIRL', 'NEVENKA', 6, '20602038387', 'JR ELIAS AGUIRRE 463 - CHIMBOTE', '997191930', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (11, 'INVERSIONES SANTEJ E.I.R.L.', 'HIELO WILSON', 6, '20602636837', '', '0', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (12, 'JONH LENNO PUESCAS FIESTAS', 'JONH PUESCAS', 1, '40755909', 'CALLE JUAN CARLOS FIESTAS LARA  - SAN JOSE - LAMBAYEQUE', '960184475', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (15, 'INFANTE SANCHEZ JORGE LUIS', 'MARGARITA', 1, '32912672', '', '', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (16, 'PALACIOS PERICHE JUAN JACKSON', 'JACKSON', 1, '41833051', '', '', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (17, 'FERNIBEL S.A.C.', '', 6, '20605181113', 'CAL.28 DE JULIO NRO. 360 LAMBAYEQUE - LAMBAYEQUE - SAN JOSE', '989220531', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (13, 'MENDOZA ARROYO JACKSIN MARLO ', 'MARLO MENDOZA', 1, '32942655', '', '', '', true, true);
INSERT INTO public.proveedor (id_proveedor, razon_social, nombre_comercial, id_tipodoc, numero_documento, direccion, telefono, correo, estado, estado_reg) OVERRIDING SYSTEM VALUE VALUES (21, 'PILAR', 'ARTEAGA', 1, '32875299', '', '0', '', true, true);


--
-- TOC entry 3518 (class 0 OID 16816)
-- Dependencies: 230
-- Data for Name: rel_embarcacion_proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rel_embarcacion_proveedor (id_embarcacion, id_proovedor, id_tipo_servicio) VALUES (5, 21, 11);
INSERT INTO public.rel_embarcacion_proveedor (id_embarcacion, id_proovedor, id_tipo_servicio) VALUES (3, 21, 11);


--
-- TOC entry 3535 (class 0 OID 17037)
-- Dependencies: 247
-- Data for Name: rel_planta_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rel_planta_cliente (ruc, id_planta) VALUES ('20604884005', 1);
INSERT INTO public.rel_planta_cliente (ruc, id_planta) VALUES ('20606319551', 2);
INSERT INTO public.rel_planta_cliente (ruc, id_planta) VALUES ('20502510470', 3);
INSERT INTO public.rel_planta_cliente (ruc, id_planta) VALUES ('20403277895', 4);
INSERT INTO public.rel_planta_cliente (ruc, id_planta) VALUES ('20603582668', 5);
INSERT INTO public.rel_planta_cliente (ruc, id_planta) VALUES ('20480156979', 8);
INSERT INTO public.rel_planta_cliente (ruc, id_planta) VALUES ('20298256968', 9);
INSERT INTO public.rel_planta_cliente (ruc, id_planta) VALUES ('10046448427', 9);


--
-- TOC entry 3519 (class 0 OID 16821)
-- Dependencies: 231
-- Data for Name: rel_planta_destino; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rel_planta_destino (id_planta, id_destino) VALUES (1, 1);
INSERT INTO public.rel_planta_destino (id_planta, id_destino) VALUES (2, 1);
INSERT INTO public.rel_planta_destino (id_planta, id_destino) VALUES (3, 2);
INSERT INTO public.rel_planta_destino (id_planta, id_destino) VALUES (4, 2);
INSERT INTO public.rel_planta_destino (id_planta, id_destino) VALUES (5, 2);
INSERT INTO public.rel_planta_destino (id_planta, id_destino) VALUES (8, 2);
INSERT INTO public.rel_planta_destino (id_planta, id_destino) VALUES (9, 2);
INSERT INTO public.rel_planta_destino (id_planta, id_destino) VALUES (9, 1);


--
-- TOC entry 3520 (class 0 OID 16826)
-- Dependencies: 232
-- Data for Name: rel_planta_proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rel_planta_proveedor (id_planta, id_proveedor, id_tipo_servicio) VALUES (3, 9, 8);
INSERT INTO public.rel_planta_proveedor (id_planta, id_proveedor, id_tipo_servicio) VALUES (1, 9, 8);


--
-- TOC entry 3521 (class 0 OID 16831)
-- Dependencies: 233
-- Data for Name: rel_prov_tiposerv; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (1, 6, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (5, 7, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (8, 8, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (9, 8, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (4, 1, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (3, 1, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (10, 1, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (6, 2, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (7, 3, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (2, 7, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (2, 3, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (11, 3, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (12, 1, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (13, 1, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (15, 1, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (16, 1, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (17, 1, true, true);
INSERT INTO public.rel_prov_tiposerv (id_proveedor, id_tipo_servicio, estado, estado_reg) VALUES (21, 11, true, true);


--
-- TOC entry 3522 (class 0 OID 16836)
-- Dependencies: 234
-- Data for Name: semana; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202001, 20191230, 20200105, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202002, 20200106, 20200112, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202003, 20200113, 20200119, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202004, 20200120, 20200126, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202005, 20200127, 20200202, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202006, 20200203, 20200209, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202007, 20200210, 20200216, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202008, 20200217, 20200223, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202009, 20200224, 20200301, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202010, 20200302, 20200308, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202011, 20200309, 20200315, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202012, 20200316, 20200322, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202013, 20200323, 20200329, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202014, 20200330, 20200405, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202015, 20200406, 20200412, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202016, 20200413, 20200419, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202017, 20200420, 20200426, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202018, 20200427, 20200503, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202019, 20200504, 20200510, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202020, 20200511, 20200517, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202021, 20200518, 20200524, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202022, 20200525, 20200531, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202023, 20200601, 20200607, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202024, 20200608, 20200614, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202025, 20200615, 20200621, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202026, 20200622, 20200628, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202027, 20200629, 20200705, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202028, 20200706, 20200712, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202029, 20200713, 20200719, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202030, 20200720, 20200726, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202031, 20200727, 20200802, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202032, 20200803, 20200809, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202033, 20200810, 20200816, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202034, 20200817, 20200823, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202035, 20200824, 20200830, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202036, 20200831, 20200906, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202037, 20200907, 20200913, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202038, 20200914, 20200920, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202039, 20200921, 20200927, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202040, 20200928, 20201004, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202041, 20201005, 20201011, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202042, 20201012, 20201018, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202043, 20201019, 20201025, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202044, 20201026, 20201101, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202045, 20201102, 20201108, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202046, 20201109, 20201115, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202047, 20201116, 20201122, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202048, 20201123, 20201129, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202049, 20201130, 20201206, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202050, 20201207, 20201213, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202051, 20201214, 20201220, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202052, 20201221, 20201227, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202101, 20201228, 20210103, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202102, 20210104, 20210110, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202103, 20210111, 20210117, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202104, 20210118, 20210124, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202105, 20210125, 20210131, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202106, 20210201, 20210207, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202107, 20210208, 20210214, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202108, 20210215, 20210221, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202109, 20210222, 20210228, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202110, 20210301, 20210307, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202111, 20210308, 20210314, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202112, 20210315, 20210321, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202113, 20210322, 20210328, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202114, 20210329, 20210404, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202115, 20210405, 20210411, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202116, 20210412, 20210418, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202117, 20210419, 20210425, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202118, 20210426, 20210502, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202119, 20210503, 20210509, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202120, 20210510, 20210516, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202121, 20210517, 20210523, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202122, 20210524, 20210530, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202123, 20210531, 20210606, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202124, 20210607, 20210613, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202125, 20210614, 20210620, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202126, 20210621, 20210627, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202127, 20210628, 20210704, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202128, 20210705, 20210711, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202129, 20210712, 20210718, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202130, 20210719, 20210725, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202131, 20210726, 20210801, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202132, 20210802, 20210808, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202133, 20210809, 20210815, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202134, 20210816, 20210822, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202135, 20210823, 20210829, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202136, 20210830, 20210905, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202137, 20210906, 20210912, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202138, 20210913, 20210919, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202139, 20210920, 20210926, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202140, 20210927, 20211003, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202141, 20211004, 20211010, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202142, 20211011, 20211017, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202143, 20211018, 20211024, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202144, 20211025, 20211031, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202145, 20211101, 20211107, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202146, 20211108, 20211114, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202147, 20211115, 20211121, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202148, 20211122, 20211128, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202149, 20211129, 20211205, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202150, 20211206, 20211212, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202151, 20211213, 20211219, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202152, 20211220, 20211226, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202201, 20211227, 20220102, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202202, 20220103, 20220109, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202203, 20220110, 20220116, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202204, 20220117, 20220123, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202205, 20220124, 20220130, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202206, 20220131, 20220206, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202207, 20220207, 20220213, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202208, 20220214, 20220220, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202209, 20220221, 20220227, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202210, 20220228, 20220306, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202211, 20220307, 20220313, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202212, 20220314, 20220320, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202213, 20220321, 20220327, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202214, 20220328, 20220403, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202215, 20220404, 20220410, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202216, 20220411, 20220417, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202217, 20220418, 20220424, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202218, 20220425, 20220501, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202219, 20220502, 20220508, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202220, 20220509, 20220515, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202221, 20220516, 20220522, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202222, 20220523, 20220529, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202223, 20220530, 20220605, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202224, 20220606, 20220612, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202225, 20220613, 20220619, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202226, 20220620, 20220626, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202227, 20220627, 20220703, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202228, 20220704, 20220710, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202229, 20220711, 20220717, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202230, 20220718, 20220724, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202231, 20220725, 20220731, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202232, 20220801, 20220807, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202233, 20220808, 20220814, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202234, 20220815, 20220821, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202235, 20220822, 20220828, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202236, 20220829, 20220904, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202237, 20220905, 20220911, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202238, 20220912, 20220918, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202239, 20220919, 20220925, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202240, 20220926, 20221002, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202241, 20221003, 20221009, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202242, 20221010, 20221016, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202243, 20221017, 20221023, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202244, 20221024, 20221030, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202245, 20221031, 20221106, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202246, 20221107, 20221113, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202247, 20221114, 20221120, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202248, 20221121, 20221127, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202249, 20221128, 20221204, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202250, 20221205, 20221211, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202251, 20221212, 20221218, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202252, 20221219, 20221225, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202401, 20240101, 20240107, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202402, 20240108, 20240114, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202403, 20240115, 20240121, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202404, 20240122, 20240128, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202405, 20240129, 20240204, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202406, 20240205, 20240211, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202407, 20240212, 20240218, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202408, 20240219, 20240225, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202409, 20240226, 20240303, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202410, 20240304, 20240310, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202411, 20240311, 20240317, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202412, 20240318, 20240324, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202413, 20240325, 20240331, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202414, 20240401, 20240407, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202415, 20240408, 20240414, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202416, 20240415, 20240421, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202417, 20240422, 20240428, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202418, 20240429, 20240505, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202419, 20240506, 20240512, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202420, 20240513, 20240519, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202421, 20240520, 20240526, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202422, 20240527, 20240602, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202423, 20240603, 20240609, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202424, 20240610, 20240616, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202425, 20240617, 20240623, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202426, 20240624, 20240630, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202427, 20240701, 20240707, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202428, 20240708, 20240714, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202429, 20240715, 20240721, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202430, 20240722, 20240728, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202431, 20240729, 20240804, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202432, 20240805, 20240811, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202433, 20240812, 20240818, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202434, 20240819, 20240825, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202435, 20240826, 20240901, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202436, 20240902, 20240908, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202437, 20240909, 20240915, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202438, 20240916, 20240922, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202439, 20240923, 20240929, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202440, 20240930, 20241006, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202441, 20241007, 20241013, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202442, 20241014, 20241020, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202443, 20241021, 20241027, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202444, 20241028, 20241103, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202445, 20241104, 20241110, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202446, 20241111, 20241117, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202447, 20241118, 20241124, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202448, 20241125, 20241201, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202449, 20241202, 20241208, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202450, 20241209, 20241215, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202451, 20241216, 20241222, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202452, 20241223, 20241229, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202501, 20241230, 20250105, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202502, 20250106, 20250112, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202503, 20250113, 20250119, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202504, 20250120, 20250126, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202505, 20250127, 20250202, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202506, 20250203, 20250209, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202507, 20250210, 20250216, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202508, 20250217, 20250223, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202509, 20250224, 20250302, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202510, 20250303, 20250309, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202511, 20250310, 20250316, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202512, 20250317, 20250323, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202513, 20250324, 20250330, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202514, 20250331, 20250406, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202515, 20250407, 20250413, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202516, 20250414, 20250420, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202517, 20250421, 20250427, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202518, 20250428, 20250504, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202519, 20250505, 20250511, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202520, 20250512, 20250518, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202521, 20250519, 20250525, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202522, 20250526, 20250601, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202523, 20250602, 20250608, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202524, 20250609, 20250615, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202525, 20250616, 20250622, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202526, 20250623, 20250629, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202527, 20250630, 20250706, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202528, 20250707, 20250713, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202529, 20250714, 20250720, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202530, 20250721, 20250727, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202531, 20250728, 20250803, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202532, 20250804, 20250810, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202533, 20250811, 20250817, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202534, 20250818, 20250824, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202535, 20250825, 20250831, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202536, 20250901, 20250907, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202537, 20250908, 20250914, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202538, 20250915, 20250921, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202539, 20250922, 20250928, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202540, 20250929, 20251005, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202541, 20251006, 20251012, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202542, 20251013, 20251019, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202543, 20251020, 20251026, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202544, 20251027, 20251102, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202545, 20251103, 20251109, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202546, 20251110, 20251116, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202547, 20251117, 20251123, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202548, 20251124, 20251130, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202549, 20251201, 20251207, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202550, 20251208, 20251214, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202551, 20251215, 20251221, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202552, 20251222, 20251228, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202601, 20251229, 20260104, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202602, 20260105, 20260111, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202603, 20260112, 20260118, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202604, 20260119, 20260125, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202605, 20260126, 20260201, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202606, 20260202, 20260208, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202607, 20260209, 20260215, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202608, 20260216, 20260222, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202609, 20260223, 20260301, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202610, 20260302, 20260308, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202611, 20260309, 20260315, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202612, 20260316, 20260322, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202613, 20260323, 20260329, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202614, 20260330, 20260405, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202615, 20260406, 20260412, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202616, 20260413, 20260419, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202617, 20260420, 20260426, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202618, 20260427, 20260503, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202619, 20260504, 20260510, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202620, 20260511, 20260517, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202621, 20260518, 20260524, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202622, 20260525, 20260531, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202623, 20260601, 20260607, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202624, 20260608, 20260614, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202625, 20260615, 20260621, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202626, 20260622, 20260628, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202627, 20260629, 20260705, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202628, 20260706, 20260712, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202629, 20260713, 20260719, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202630, 20260720, 20260726, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202631, 20260727, 20260802, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202632, 20260803, 20260809, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202633, 20260810, 20260816, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202634, 20260817, 20260823, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202635, 20260824, 20260830, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202636, 20260831, 20260906, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202637, 20260907, 20260913, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202638, 20260914, 20260920, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202639, 20260921, 20260927, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202640, 20260928, 20261004, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202641, 20261005, 20261011, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202642, 20261012, 20261018, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202643, 20261019, 20261025, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202644, 20261026, 20261101, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202645, 20261102, 20261108, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202646, 20261109, 20261115, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202647, 20261116, 20261122, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202648, 20261123, 20261129, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202649, 20261130, 20261206, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202650, 20261207, 20261213, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202651, 20261214, 20261220, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202652, 20261221, 20261227, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202701, 20261228, 20270103, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202702, 20270104, 20270110, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202703, 20270111, 20270117, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202704, 20270118, 20270124, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202705, 20270125, 20270131, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202706, 20270201, 20270207, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202707, 20270208, 20270214, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202708, 20270215, 20270221, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202709, 20270222, 20270228, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202710, 20270301, 20270307, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202711, 20270308, 20270314, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202712, 20270315, 20270321, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202713, 20270322, 20270328, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202714, 20270329, 20270404, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202715, 20270405, 20270411, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202716, 20270412, 20270418, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202717, 20270419, 20270425, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202718, 20270426, 20270502, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202719, 20270503, 20270509, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202720, 20270510, 20270516, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202721, 20270517, 20270523, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202722, 20270524, 20270530, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202723, 20270531, 20270606, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202724, 20270607, 20270613, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202725, 20270614, 20270620, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202726, 20270621, 20270627, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202727, 20270628, 20270704, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202728, 20270705, 20270711, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202729, 20270712, 20270718, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202730, 20270719, 20270725, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202731, 20270726, 20270801, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202732, 20270802, 20270808, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202733, 20270809, 20270815, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202734, 20270816, 20270822, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202735, 20270823, 20270829, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202736, 20270830, 20270905, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202737, 20270906, 20270912, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202738, 20270913, 20270919, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202739, 20270920, 20270926, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202740, 20270927, 20271003, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202741, 20271004, 20271010, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202742, 20271011, 20271017, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202743, 20271018, 20271024, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202744, 20271025, 20271031, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202745, 20271101, 20271107, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202746, 20271108, 20271114, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202747, 20271115, 20271121, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202748, 20271122, 20271128, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202749, 20271129, 20271205, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202750, 20271206, 20271212, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202751, 20271213, 20271219, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202752, 20271220, 20271226, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202801, 20271227, 20280102, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202802, 20280103, 20280109, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202803, 20280110, 20280116, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202804, 20280117, 20280123, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202805, 20280124, 20280130, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202806, 20280131, 20280206, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202807, 20280207, 20280213, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202808, 20280214, 20280220, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202809, 20280221, 20280227, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202810, 20280228, 20280305, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202811, 20280306, 20280312, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202812, 20280313, 20280319, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202813, 20280320, 20280326, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202814, 20280327, 20280402, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202815, 20280403, 20280409, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202816, 20280410, 20280416, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202817, 20280417, 20280423, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202818, 20280424, 20280430, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202819, 20280501, 20280507, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202820, 20280508, 20280514, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202821, 20280515, 20280521, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202822, 20280522, 20280528, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202823, 20280529, 20280604, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202824, 20280605, 20280611, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202825, 20280612, 20280618, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202826, 20280619, 20280625, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202827, 20280626, 20280702, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202828, 20280703, 20280709, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202829, 20280710, 20280716, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202830, 20280717, 20280723, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202831, 20280724, 20280730, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202832, 20280731, 20280806, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202833, 20280807, 20280813, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202834, 20280814, 20280820, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202835, 20280821, 20280827, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202836, 20280828, 20280903, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202837, 20280904, 20280910, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202838, 20280911, 20280917, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202839, 20280918, 20280924, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202840, 20280925, 20281001, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202841, 20281002, 20281008, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202842, 20281009, 20281015, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202843, 20281016, 20281022, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202844, 20281023, 20281029, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202845, 20281030, 20281105, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202846, 20281106, 20281112, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202847, 20281113, 20281119, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202848, 20281120, 20281126, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202849, 20281127, 20281203, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202850, 20281204, 20281210, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202851, 20281211, 20281217, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202852, 20281218, 20281224, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202901, 20290101, 20290107, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202902, 20290108, 20290114, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202903, 20290115, 20290121, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202904, 20290122, 20290128, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202905, 20290129, 20290204, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202906, 20290205, 20290211, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202907, 20290212, 20290218, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202908, 20290219, 20290225, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202909, 20290226, 20290304, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202910, 20290305, 20290311, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202911, 20290312, 20290318, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202912, 20290319, 20290325, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202913, 20290326, 20290401, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202914, 20290402, 20290408, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202915, 20290409, 20290415, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202916, 20290416, 20290422, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202917, 20290423, 20290429, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202918, 20290430, 20290506, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202919, 20290507, 20290513, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202920, 20290514, 20290520, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202921, 20290521, 20290527, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202922, 20290528, 20290603, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202923, 20290604, 20290610, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202924, 20290611, 20290617, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202925, 20290618, 20290624, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202926, 20290625, 20290701, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202927, 20290702, 20290708, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202928, 20290709, 20290715, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202929, 20290716, 20290722, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202930, 20290723, 20290729, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202931, 20290730, 20290805, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202932, 20290806, 20290812, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202933, 20290813, 20290819, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202934, 20290820, 20290826, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202935, 20290827, 20290902, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202936, 20290903, 20290909, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202937, 20290910, 20290916, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202938, 20290917, 20290923, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202939, 20290924, 20290930, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202940, 20291001, 20291007, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202941, 20291008, 20291014, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202942, 20291015, 20291021, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202943, 20291022, 20291028, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202944, 20291029, 20291104, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202945, 20291105, 20291111, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202946, 20291112, 20291118, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202947, 20291119, 20291125, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202948, 20291126, 20291202, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202949, 20291203, 20291209, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202950, 20291210, 20291216, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202951, 20291217, 20291223, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202952, 20291224, 20291230, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202301, 20221226, 20230101, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202302, 20230102, 20230108, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202303, 20230109, 20230115, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202304, 20230116, 20230122, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202305, 20230123, 20230129, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202306, 20230130, 20230205, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202307, 20230206, 20230212, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202308, 20230213, 20230219, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202309, 20230220, 20230226, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202310, 20230227, 20230305, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202311, 20230306, 20230312, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202312, 20230313, 20230319, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202313, 20230320, 20230326, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202314, 20230327, 20230402, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202315, 20230403, 20230409, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202316, 20230410, 20230416, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202317, 20230417, 20230423, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202318, 20230424, 20230430, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202319, 20230501, 20230507, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202320, 20230508, 20230514, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202321, 20230515, 20230521, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202322, 20230522, 20230528, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202323, 20230529, 20230604, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202324, 20230605, 20230611, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202325, 20230612, 20230618, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202326, 20230619, 20230625, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202327, 20230626, 20230702, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202328, 20230703, 20230709, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202329, 20230710, 20230716, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202330, 20230717, 20230723, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202331, 20230724, 20230730, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202332, 20230731, 20230806, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202333, 20230807, 20230813, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202334, 20230814, 20230820, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202335, 20230821, 20230827, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202336, 20230828, 20230903, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202337, 20230904, 20230910, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202338, 20230911, 20230917, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202347, 20231113, 20231119, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202348, 20231120, 20231126, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202349, 20231127, 20231203, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202350, 20231204, 20231210, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202351, 20231211, 20231217, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202352, 20231218, 20231224, 'O', true);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202346, 20231106, 20231112, 'O', false);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202345, 20231030, 20231105, 'O', false);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202344, 20231023, 20231029, 'O', false);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202343, 20231016, 20231022, 'O', false);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202342, 20231009, 20231015, 'O', false);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202341, 20231002, 20231008, 'O', false);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202340, 20230925, 20231001, 'O', false);
INSERT INTO public.semana (id_semana, fecha_inicio, fecha_fin, tipo_semana, estado) VALUES (202339, 20230918, 20230924, 'O', false);


--
-- TOC entry 3531 (class 0 OID 16882)
-- Dependencies: 243
-- Data for Name: tarifario_camara; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3533 (class 0 OID 17017)
-- Dependencies: 245
-- Data for Name: tarifario_embarcacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tarifario_embarcacion (id_dia, id_embarcacion, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231126, 5, 21, 11, 2, 2.00, true, true);
INSERT INTO public.tarifario_embarcacion (id_dia, id_embarcacion, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231127, 5, 21, 11, 2, 2.00, true, true);
INSERT INTO public.tarifario_embarcacion (id_dia, id_embarcacion, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231128, 5, 21, 11, 2, 2.00, true, true);
INSERT INTO public.tarifario_embarcacion (id_dia, id_embarcacion, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231128, 3, 21, 11, 1, NULL, true, true);
INSERT INTO public.tarifario_embarcacion (id_dia, id_embarcacion, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231129, 5, 21, 11, 2, 2.00, true, true);
INSERT INTO public.tarifario_embarcacion (id_dia, id_embarcacion, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231129, 3, 21, 11, 1, NULL, true, true);
INSERT INTO public.tarifario_embarcacion (id_dia, id_embarcacion, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231130, 5, 21, 11, 2, 2.00, true, true);
INSERT INTO public.tarifario_embarcacion (id_dia, id_embarcacion, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231130, 3, 21, 11, 1, NULL, true, true);


--
-- TOC entry 3530 (class 0 OID 16879)
-- Dependencies: 242
-- Data for Name: tarifario_general; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (3, 1, 20231123, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (4, 1, 20231123, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (10, 1, 20231123, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (6, 2, 20231123, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (7, 3, 20231123, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (2, 3, 20231123, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (11, 3, 20231123, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (12, 1, 20231123, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (13, 1, 20231123, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (15, 1, 20231123, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (16, 1, 20231123, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (17, 1, 20231123, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (3, 1, 20231124, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (4, 1, 20231124, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (10, 1, 20231124, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (6, 2, 20231124, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (7, 3, 20231124, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (2, 3, 20231124, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (11, 3, 20231124, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (12, 1, 20231124, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (13, 1, 20231124, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (15, 1, 20231124, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (16, 1, 20231124, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (17, 1, 20231124, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (3, 1, 20231125, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (4, 1, 20231125, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (10, 1, 20231125, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (6, 2, 20231125, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (7, 3, 20231125, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (2, 3, 20231125, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (11, 3, 20231125, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (12, 1, 20231125, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (13, 1, 20231125, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (15, 1, 20231125, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (16, 1, 20231125, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (17, 1, 20231125, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (3, 1, 20231126, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (4, 1, 20231126, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (10, 1, 20231126, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (2, 3, 20231126, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (12, 1, 20231126, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (13, 1, 20231126, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (15, 1, 20231126, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (16, 1, 20231126, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (17, 1, 20231126, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (6, 2, 20231126, 1, 18.50, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (7, 3, 20231126, 1, 120.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (11, 3, 20231126, 1, 80.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (3, 1, 20231127, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (4, 1, 20231127, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (10, 1, 20231127, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (2, 3, 20231127, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (12, 1, 20231127, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (13, 1, 20231127, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (15, 1, 20231127, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (16, 1, 20231127, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (17, 1, 20231127, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (6, 2, 20231127, 1, 18.50, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (7, 3, 20231127, 1, 120.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (11, 3, 20231127, 1, 80.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (3, 1, 20231128, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (4, 1, 20231128, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (10, 1, 20231128, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (2, 3, 20231128, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (12, 1, 20231128, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (13, 1, 20231128, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (15, 1, 20231128, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (16, 1, 20231128, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (17, 1, 20231128, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (6, 2, 20231128, 1, 18.50, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (7, 3, 20231128, 1, 120.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (11, 3, 20231128, 1, 80.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (3, 1, 20231129, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (4, 1, 20231129, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (10, 1, 20231129, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (2, 3, 20231129, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (12, 1, 20231129, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (13, 1, 20231129, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (15, 1, 20231129, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (16, 1, 20231129, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (17, 1, 20231129, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (6, 2, 20231129, 1, 18.50, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (7, 3, 20231129, 1, 120.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (11, 3, 20231129, 1, 80.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (3, 1, 20231130, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (4, 1, 20231130, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (10, 1, 20231130, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (2, 3, 20231130, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (12, 1, 20231130, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (13, 1, 20231130, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (15, 1, 20231130, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (16, 1, 20231130, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (17, 1, 20231130, NULL, 0.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (6, 2, 20231130, 1, 18.50, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (7, 3, 20231130, 1, 120.00, true, true);
INSERT INTO public.tarifario_general (id_proveedor, id_tipo_servicio, id_dia, id_moneda, monto, estado, estado_reg) VALUES (11, 3, 20231130, 1, 80.00, true, true);


--
-- TOC entry 3538 (class 0 OID 17085)
-- Dependencies: 250
-- Data for Name: tarifario_muelle; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3534 (class 0 OID 17027)
-- Dependencies: 246
-- Data for Name: tarifario_planta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tarifario_planta (id_dia, id_planta, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231126, 3, 9, 8, 1, 0.40, true, true);
INSERT INTO public.tarifario_planta (id_dia, id_planta, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231127, 3, 9, 8, 1, 0.40, true, true);
INSERT INTO public.tarifario_planta (id_dia, id_planta, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231128, 3, 9, 8, 1, 0.40, true, true);
INSERT INTO public.tarifario_planta (id_dia, id_planta, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231128, 1, 9, 8, 1, 0.00, true, true);
INSERT INTO public.tarifario_planta (id_dia, id_planta, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231129, 3, 9, 8, 1, 0.40, true, true);
INSERT INTO public.tarifario_planta (id_dia, id_planta, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231129, 1, 9, 8, 1, 0.00, true, true);
INSERT INTO public.tarifario_planta (id_dia, id_planta, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231130, 3, 9, 8, 1, 0.40, true, true);
INSERT INTO public.tarifario_planta (id_dia, id_planta, id_proveedor, id_tipo_servicio, id_moneda, monto, estado, estado_reg) VALUES (20231130, 1, 9, 8, 1, 0.00, true, true);


--
-- TOC entry 3523 (class 0 OID 16841)
-- Dependencies: 235
-- Data for Name: tipo_cambio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3524 (class 0 OID 16846)
-- Dependencies: 236
-- Data for Name: tipo_documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_documento (id_tipodoc, nombre, abreviatura, longitud, tipo, estado, estado_reg) VALUES (1, 'LIBRETA ELECTORAL O DNI', 'L.E / DNI', 8, 'N', true, true);
INSERT INTO public.tipo_documento (id_tipodoc, nombre, abreviatura, longitud, tipo, estado, estado_reg) VALUES (4, 'CARNET DE EXTRANJERIA', 'CANET EXT.', 12, 'T', true, true);
INSERT INTO public.tipo_documento (id_tipodoc, nombre, abreviatura, longitud, tipo, estado, estado_reg) VALUES (6, 'REG. UNICO DE CONTRIBUYENTES', 'RUC', 11, 'N', true, true);
INSERT INTO public.tipo_documento (id_tipodoc, nombre, abreviatura, longitud, tipo, estado, estado_reg) VALUES (7, 'PASAPORTE', 'PASAPORTE', 12, 'T', true, true);
INSERT INTO public.tipo_documento (id_tipodoc, nombre, abreviatura, longitud, tipo, estado, estado_reg) VALUES (11, 'PART. DE NACIMIENTO-IDENTIDAD', 'P. NAC.', 15, 'T', true, true);
INSERT INTO public.tipo_documento (id_tipodoc, nombre, abreviatura, longitud, tipo, estado, estado_reg) VALUES (0, 'OTROS', 'OTROS', 15, 'T', true, true);


--
-- TOC entry 3525 (class 0 OID 16851)
-- Dependencies: 237
-- Data for Name: tipo_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (11, 3, 'COMISION EMBARCACION', 2, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (1, 1, 'PESCA', 1, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (2, 1, 'PETROLEO', 3, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (3, 1, 'HIELO', 2, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (4, 1, 'OTROS DESCUENTOS', 2, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (5, 5, 'LIQUIDACION PESCA', 2, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (6, 2, 'FLETE', 2, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (8, 4, 'DESCARGA PLANTA', 2, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (9, 1, 'LAVADO CUBETAS', 2, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (10, 1, 'SERVICIO ADMINISTRATIVO', 2, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (7, 1, 'DESCARGA MUELLE', 2, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (12, 1, 'COMISION PLANTA', 2, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (14, 1, 'HABILITACION', 1, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (15, 1, 'ATRAQUE', 1, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (16, 1, 'CERTIFICADO', 1, true, true);
INSERT INTO public.tipo_servicio (id_tipo_servicio, tipo_tarifa, nombre, id_um, estado, estado_reg) VALUES (13, 1, 'MUELLE', 6, true, true);


--
-- TOC entry 3536 (class 0 OID 17074)
-- Dependencies: 248
-- Data for Name: tipo_sub_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3526 (class 0 OID 16856)
-- Dependencies: 238
-- Data for Name: trabajador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.trabajador (id_tipodoc, numero_documento, nombres, apellido_pat, apellido_mat, id_forma_pago, id_banco, cta_bancaria, id_moneda, estado, estado_reg) VALUES (1, '32912672', 'EDWARD ', 'PERICHE', 'ARISMENDIS', 2, 1, '0', 1, true, true);


--
-- TOC entry 3527 (class 0 OID 16861)
-- Dependencies: 239
-- Data for Name: ubigeo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A000000', 'DESCONOCIDO', 'DESCONOCIDO', 'DESCONOCIDO', NULL, NULL, NULL, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010101', 'Amazonas', 'Chachapoyas', 'Chachapoyas', 153.7800, -77.8714, -6.2294, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010102', 'Amazonas', 'Chachapoyas', 'Asuncion', 25.7100, -77.7122, -6.0317, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010103', 'Amazonas', 'Chachapoyas', 'Balsas', 357.0900, -78.0214, -6.8375, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010104', 'Amazonas', 'Chachapoyas', 'Cheto', 56.9700, -77.7003, -6.2558, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010105', 'Amazonas', 'Chachapoyas', 'Chiliquin', 143.4300, -77.7392, -6.0778, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010106', 'Amazonas', 'Chachapoyas', 'Chuquibamba', 278.6300, -77.8575, -6.9333, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010107', 'Amazonas', 'Chachapoyas', 'Granada', 181.4100, -77.6344, -6.0997, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010108', 'Amazonas', 'Chachapoyas', 'Huancas', 48.7900, -77.8686, -6.1747, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010109', 'Amazonas', 'Chachapoyas', 'La Jalca', 380.3900, -77.8192, -6.4825, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010110', 'Amazonas', 'Chachapoyas', 'Leimebamba', 373.1400, -77.8006, -6.6636, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010111', 'Amazonas', 'Chachapoyas', 'Levanto', 77.5400, -77.8994, -6.3086, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010112', 'Amazonas', 'Chachapoyas', 'Magdalena', 135.4700, -77.9017, -6.3736, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010113', 'Amazonas', 'Chachapoyas', 'Mariscal Castilla', 83.5800, -77.8053, -6.5939, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010114', 'Amazonas', 'Chachapoyas', 'Molinopampa', 333.8600, -77.6683, -6.2056, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010115', 'Amazonas', 'Chachapoyas', 'Montevideo', 119.0100, -77.8025, -6.6133, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010116', 'Amazonas', 'Chachapoyas', 'Olleros', 125.1600, -77.6761, -6.0239, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010117', 'Amazonas', 'Chachapoyas', 'Quinjalca', 91.5900, -77.6600, -6.0850, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010118', 'Amazonas', 'Chachapoyas', 'San Francisco de Daguas', 47.4100, -77.7392, -6.2333, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010119', 'Amazonas', 'Chachapoyas', 'San Isidro de Maino', 101.6700, -77.8439, -6.3533, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010120', 'Amazonas', 'Chachapoyas', 'Soloco', 84.4800, -77.7453, -6.2619, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010121', 'Amazonas', 'Chachapoyas', 'Sonche', 113.2600, -77.7753, -6.2183, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010201', 'Amazonas', 'Bagua', 'Bagua', 150.9900, -78.5319, -5.6389, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010202', 'Amazonas', 'Bagua', 'Aramango', 809.0700, -78.4361, -5.4156, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010203', 'Amazonas', 'Bagua', 'Copallin', 99.0500, -78.4228, -5.6733, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010204', 'Amazonas', 'Bagua', 'El Parco', 18.4800, -78.4764, -5.6247, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010205', 'Amazonas', 'Bagua', 'Imaza', 4430.8400, -78.2903, -5.1600, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010206', 'Amazonas', 'Bagua', 'La Peca', 144.2900, -78.4344, -5.6092, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010301', 'Amazonas', 'Bongara', 'Jumbilla', 154.1800, -77.7958, -5.9006, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010302', 'Amazonas', 'Bongara', 'Chisquilla', 174.9600, -77.7839, -5.9003, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010303', 'Amazonas', 'Bongara', 'Churuja', 33.3400, -77.9517, -6.0192, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010304', 'Amazonas', 'Bongara', 'Corosha', 45.6700, -77.8400, -5.8294, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010305', 'Amazonas', 'Bongara', 'Cuispes', 110.7200, -77.9392, -5.9236, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010306', 'Amazonas', 'Bongara', 'Florida', 203.2200, -77.9714, -5.8336, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010307', 'Amazonas', 'Bongara', 'Jazan', 88.8300, -77.9806, -5.9419, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010308', 'Amazonas', 'Bongara', 'Recta', 24.5800, -77.7861, -5.9194, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010309', 'Amazonas', 'Bongara', 'San Carlos', 100.7600, -77.9447, -5.9636, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010310', 'Amazonas', 'Bongara', 'Shipasbamba', 127.2900, -78.0692, -5.8744, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010311', 'Amazonas', 'Bongara', 'Valera', 90.1400, -77.9139, -6.0425, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010312', 'Amazonas', 'Bongara', 'Yambrasbamba', 1715.9600, -77.9772, -5.6908, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010401', 'Amazonas', 'Condorcanqui', 'Nieva', 4481.6300, -77.8672, -4.5947, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010402', 'Amazonas', 'Condorcanqui', 'El Cenepa', 5458.4800, -78.1592, -4.4503, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010403', 'Amazonas', 'Condorcanqui', 'Rio Santiago', 8035.2800, -77.7658, -4.0106, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010501', 'Amazonas', 'Luya', 'Lamud', 69.4900, -77.9503, -6.1308, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010502', 'Amazonas', 'Luya', 'Camporredondo', 376.0100, -78.3186, -6.2136, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010503', 'Amazonas', 'Luya', 'Cocabamba', 355.8500, -78.0303, -6.6297, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010504', 'Amazonas', 'Luya', 'Colcamar', 106.6000, -78.0019, -6.3175, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010505', 'Amazonas', 'Luya', 'Conila', 256.1700, -78.1419, -6.1592, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010506', 'Amazonas', 'Luya', 'Inguilpata', 118.0400, -77.9561, -6.2428, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010507', 'Amazonas', 'Luya', 'Longuita', 57.9100, -77.9681, -6.4147, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010508', 'Amazonas', 'Luya', 'Lonya Chico', 83.8200, -77.9564, -6.2328, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010509', 'Amazonas', 'Luya', 'Luya', 91.2100, -77.9469, -6.1650, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010510', 'Amazonas', 'Luya', 'Luya Viejo', 73.8700, -78.0847, -6.1275, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010511', 'Amazonas', 'Luya', 'Maria', 80.2700, -77.9733, -6.4517, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010512', 'Amazonas', 'Luya', 'Ocalli', 177.3900, -78.2667, -6.2347, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010513', 'Amazonas', 'Luya', 'Ocumal', 235.8600, -78.2294, -6.3061, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010514', 'Amazonas', 'Luya', 'Pisuquia', 306.5000, -78.0747, -6.5114, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010515', 'Amazonas', 'Luya', 'Providencia', 71.2200, -78.2503, -6.3108, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010516', 'Amazonas', 'Luya', 'San Cristobal', 33.3600, -77.9525, -6.0997, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010517', 'Amazonas', 'Luya', 'San Francisco del Yeso', 113.9400, -77.8469, -6.5861, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010518', 'Amazonas', 'Luya', 'San Jeronimo', 214.6600, -77.9669, -6.0344, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010519', 'Amazonas', 'Luya', 'San Juan de Lopecancha', 88.0200, -77.8969, -6.4572, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010520', 'Amazonas', 'Luya', 'Santa Catalina', 126.2100, -78.0633, -6.1117, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010521', 'Amazonas', 'Luya', 'Santo Tomas', 84.9300, -77.8739, -6.5617, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010522', 'Amazonas', 'Luya', 'Tingo', 102.6700, -77.9056, -6.3761, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010523', 'Amazonas', 'Luya', 'Trita', 12.6800, -77.9806, -6.1519, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010601', 'Amazonas', 'Rodriguez de Mendoza', 'San Nicolas', 206.0100, -77.4831, -6.3956, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010602', 'Amazonas', 'Rodriguez de Mendoza', 'Chirimoto', 153.0000, -77.4869, -6.5283, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010603', 'Amazonas', 'Rodriguez de Mendoza', 'Cochamal', 199.4400, -77.5889, -6.3933, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010604', 'Amazonas', 'Rodriguez de Mendoza', 'Huambo', 99.5600, -77.5369, -6.4275, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010605', 'Amazonas', 'Rodriguez de Mendoza', 'Limabamba', 317.8800, -77.5097, -6.5025, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010606', 'Amazonas', 'Rodriguez de Mendoza', 'Longar', 66.2400, -77.5461, -6.3853, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010607', 'Amazonas', 'Rodriguez de Mendoza', 'Mariscal Benavides', 176.1800, -77.5003, -6.3697, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010608', 'Amazonas', 'Rodriguez de Mendoza', 'Milpuc', 26.8000, -77.4358, -6.4983, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010609', 'Amazonas', 'Rodriguez de Mendoza', 'Omia', 175.1300, -77.3947, -6.4686, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010610', 'Amazonas', 'Rodriguez de Mendoza', 'Santa Rosa', 34.1100, -77.4539, -6.4542, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010611', 'Amazonas', 'Rodriguez de Mendoza', 'Totora', 6.0200, -77.4711, -6.4914, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010612', 'Amazonas', 'Rodriguez de Mendoza', 'Vista Alegre', 899.0200, -77.3019, -6.1514, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010701', 'Amazonas', 'Utcubamba', 'Bagua Grande', 746.6400, -78.4428, -5.7558, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010702', 'Amazonas', 'Utcubamba', 'Cajaruro', 1746.2300, -78.4267, -5.7364, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010703', 'Amazonas', 'Utcubamba', 'Cumba', 292.6600, -78.6653, -5.9317, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010704', 'Amazonas', 'Utcubamba', 'El Milagro', 313.8900, -78.5578, -5.6367, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010705', 'Amazonas', 'Utcubamba', 'Jamalca', 357.9800, -78.2203, -5.9158, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010706', 'Amazonas', 'Utcubamba', 'Lonya Grande', 327.9200, -78.4219, -6.0956, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A010707', 'Amazonas', 'Utcubamba', 'Yamon', 57.6100, -78.5322, -6.0525, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020101', 'Ancash', 'Huaraz', 'Huaraz', 432.9900, -77.5333, -9.5272, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020102', 'Ancash', 'Huaraz', 'Cochabamba', 135.6500, -77.8619, -9.4939, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020103', 'Ancash', 'Huaraz', 'Colcabamba', 50.6500, -77.8108, -9.5956, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020104', 'Ancash', 'Huaraz', 'Huanchay', 209.3400, -77.8197, -9.7236, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020105', 'Ancash', 'Huaraz', 'Independencia', 342.9500, -77.5344, -9.5189, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020106', 'Ancash', 'Huaraz', 'Jangas', 59.8400, -77.5767, -9.4014, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020107', 'Ancash', 'Huaraz', 'La Libertad', 164.2600, -77.7442, -9.6333, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020108', 'Ancash', 'Huaraz', 'Olleros', 222.9100, -77.4661, -9.6664, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020109', 'Ancash', 'Huaraz', 'Pampas', 357.8100, -77.8272, -9.6556, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020110', 'Ancash', 'Huaraz', 'Pariacoto', 162.5000, -77.8931, -9.5622, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020111', 'Ancash', 'Huaraz', 'Pira', 243.7300, -77.7075, -9.5814, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020112', 'Ancash', 'Huaraz', 'Tarica', 110.2800, -77.5769, -9.3919, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020201', 'Ancash', 'Aija', 'Aija', 159.7400, -77.6114, -9.7819, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020202', 'Ancash', 'Aija', 'Coris', 267.1500, -77.7225, -9.8211, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020203', 'Ancash', 'Aija', 'Huacllan', 37.9100, -77.6747, -9.7975, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020204', 'Ancash', 'Aija', 'La Merced', 153.0800, -77.6189, -9.7361, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020205', 'Ancash', 'Aija', 'Succha', 78.8400, -77.6497, -9.8242, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020301', 'Ancash', 'Antonio Raymondi', 'Llamellin', 90.8200, -77.0183, -9.1006, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020302', 'Ancash', 'Antonio Raymondi', 'Aczo', 69.0300, -76.9903, -9.1525, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020303', 'Ancash', 'Antonio Raymondi', 'Chaccho', 73.9900, -77.0594, -9.0586, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020304', 'Ancash', 'Antonio Raymondi', 'Chingas', 48.9500, -76.9947, -9.1200, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020305', 'Ancash', 'Antonio Raymondi', 'Mirgas', 175.6900, -77.0933, -9.0792, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020306', 'Ancash', 'Antonio Raymondi', 'San Juan de Rontoy', 103.1300, -77.0044, -9.1803, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020401', 'Ancash', 'Asuncion', 'Chacas', 447.6900, -77.3694, -9.1622, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020402', 'Ancash', 'Asuncion', 'Acochaca', 80.9700, -77.3697, -9.1139, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020501', 'Ancash', 'Bolognesi', 'Chiquian', 184.1600, -77.1586, -10.1517, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020502', 'Ancash', 'Bolognesi', 'Abelardo Pardo Lezameta', 11.3100, -77.1508, -10.2992, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020503', 'Ancash', 'Bolognesi', 'Antonio Raymondi', 118.7000, -77.4703, -10.1575, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020504', 'Ancash', 'Bolognesi', 'Aquia', 434.6000, -77.1464, -10.0742, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020505', 'Ancash', 'Bolognesi', 'Cajacay', 193.0600, -77.4419, -10.1564, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020506', 'Ancash', 'Bolognesi', 'Canis', 19.4500, -77.1711, -10.3381, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020507', 'Ancash', 'Bolognesi', 'Colquioc', 274.6100, -77.6156, -10.3117, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020508', 'Ancash', 'Bolognesi', 'Huallanca', 873.3900, -76.9444, -9.8994, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020509', 'Ancash', 'Bolognesi', 'Huasta', 387.9100, -77.1458, -10.1225, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020510', 'Ancash', 'Bolognesi', 'Huayllacayan', 127.9900, -77.4342, -10.2436, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020511', 'Ancash', 'Bolognesi', 'La Primavera', 68.6100, -77.1253, -10.3344, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020512', 'Ancash', 'Bolognesi', 'Mangas', 115.8400, -77.1039, -10.3694, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020513', 'Ancash', 'Bolognesi', 'Pacllon', 211.9800, -77.0722, -10.2333, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020514', 'Ancash', 'Bolognesi', 'San Miguel de Corpanqui', 43.7800, -77.2000, -10.2850, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020515', 'Ancash', 'Bolognesi', 'Ticllos', 89.4100, -77.1911, -10.2522, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020601', 'Ancash', 'Carhuaz', 'Carhuaz', 194.6200, -77.6469, -9.2806, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020602', 'Ancash', 'Carhuaz', 'Acopampa', 14.1700, -77.6225, -9.2942, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020603', 'Ancash', 'Carhuaz', 'Amashca', 11.9900, -77.6464, -9.2392, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020604', 'Ancash', 'Carhuaz', 'Anta', 40.7700, -77.5978, -9.3569, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020605', 'Ancash', 'Carhuaz', 'Ataquero', 47.2200, -77.6914, -9.2625, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020606', 'Ancash', 'Carhuaz', 'Marcara', 157.4900, -77.6033, -9.3211, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020607', 'Ancash', 'Carhuaz', 'Pariahuanca', 11.7400, -77.5828, -9.3642, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020608', 'Ancash', 'Carhuaz', 'San Miguel de Aco', 133.8900, -77.5644, -9.3678, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020609', 'Ancash', 'Carhuaz', 'Shilla', 130.1900, -77.6256, -9.2306, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020610', 'Ancash', 'Carhuaz', 'Tinco', 15.4400, -77.6819, -9.2711, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020611', 'Ancash', 'Carhuaz', 'Yungar', 46.4300, -77.5931, -9.3778, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020701', 'Ancash', 'Carlos Fermin Fitzca', 'San Luis', 256.4500, -77.3331, -9.0933, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020702', 'Ancash', 'Carlos Fermin Fitzca', 'San Nicolas', 197.3900, -77.1842, -8.9767, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020703', 'Ancash', 'Carlos Fermin Fitzca', 'Yauya', 170.4100, -77.2894, -8.9875, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020801', 'Ancash', 'Casma', 'Casma', 1204.8500, -78.3036, -9.4750, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020802', 'Ancash', 'Casma', 'Buena Vista Alta', 476.6200, -78.2047, -9.4289, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020803', 'Ancash', 'Casma', 'Comandante Noel', 222.3600, -78.3831, -9.4622, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020804', 'Ancash', 'Casma', 'Yautan', 357.2000, -77.9956, -9.5097, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020901', 'Ancash', 'Corongo', 'Corongo', 143.1300, -77.8967, -8.5683, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020902', 'Ancash', 'Corongo', 'Aco', 56.5400, -77.8769, -8.5228, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020903', 'Ancash', 'Corongo', 'Bambas', 151.1300, -77.9925, -8.6022, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020904', 'Ancash', 'Corongo', 'Cusca', 411.5500, -77.8631, -8.5106, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020905', 'Ancash', 'Corongo', 'La Pampa', 93.9400, -77.9011, -8.6619, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020906', 'Ancash', 'Corongo', 'Yanac', 45.8500, -77.8636, -8.6178, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A020907', 'Ancash', 'Corongo', 'Yupan', 85.8700, -77.9661, -8.6150, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021001', 'Ancash', 'Huari', 'Huari', 398.9100, -77.1725, -9.3478, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021002', 'Ancash', 'Huari', 'Anra', 80.3100, -76.9253, -9.2347, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021003', 'Ancash', 'Huari', 'Cajay', 159.3500, -77.1569, -9.3253, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021004', 'Ancash', 'Huari', 'Chavin de Huantar', 434.1300, -77.1772, -9.5869, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021005', 'Ancash', 'Huari', 'Huacachi', 86.7000, -76.9356, -9.3164, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021006', 'Ancash', 'Huari', 'Huacchis', 72.1600, -76.7875, -9.2000, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021007', 'Ancash', 'Huari', 'Huachis', 153.8900, -77.1003, -9.4097, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021008', 'Ancash', 'Huari', 'Huantar', 156.1500, -77.1750, -9.4517, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021009', 'Ancash', 'Huari', 'Masin', 75.3300, -77.0958, -9.3653, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021010', 'Ancash', 'Huari', 'Paucas', 135.3100, -76.8983, -9.1522, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021011', 'Ancash', 'Huari', 'Ponto', 118.2900, -77.0047, -9.3250, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021012', 'Ancash', 'Huari', 'Rahuapampa', 9.0200, -77.0772, -9.3592, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021013', 'Ancash', 'Huari', 'Rapayan', 143.3400, -76.7611, -9.2053, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021014', 'Ancash', 'Huari', 'San Marcos', 556.7500, -77.1575, -9.5250, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021015', 'Ancash', 'Huari', 'San Pedro de Chana', 138.6500, -77.0117, -9.4025, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021016', 'Ancash', 'Huari', 'Uco', 53.6100, -76.9269, -9.1886, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021101', 'Ancash', 'Huarmey', 'Huarmey', 2894.3800, -78.1517, -10.0697, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021102', 'Ancash', 'Huarmey', 'Cochapeti', 100.0200, -77.6467, -9.9872, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021103', 'Ancash', 'Huarmey', 'Culebras', 630.2500, -78.2247, -9.9486, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021104', 'Ancash', 'Huarmey', 'Huayan', 58.9900, -77.7081, -9.8761, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021105', 'Ancash', 'Huarmey', 'Malvas', 219.5200, -77.6581, -9.9294, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021201', 'Ancash', 'Huaylas', 'Caraz', 246.5200, -77.8108, -9.0472, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021202', 'Ancash', 'Huaylas', 'Huallanca', 178.8000, -77.8653, -8.8194, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021203', 'Ancash', 'Huaylas', 'Huata', 70.6900, -77.8625, -9.0167, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021204', 'Ancash', 'Huaylas', 'Huaylas', 56.8900, -77.8925, -8.8694, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021205', 'Ancash', 'Huaylas', 'Mato', 107.1200, -77.8456, -8.9617, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021206', 'Ancash', 'Huaylas', 'Pamparomas', 496.3500, -77.9819, -9.0731, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021207', 'Ancash', 'Huaylas', 'Pueblo Libre', 130.9900, -77.8025, -9.1117, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021208', 'Ancash', 'Huaylas', 'Santa Cruz', 357.7000, -77.8150, -8.9486, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021209', 'Ancash', 'Huaylas', 'Santo Toribio', 82.0200, -77.9150, -8.8644, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021210', 'Ancash', 'Huaylas', 'Yuracmarca', 565.7000, -77.9036, -8.7364, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021301', 'Ancash', 'Mariscal Luzuriaga', 'Piscobamba', 45.9300, -77.3567, -8.8611, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021302', 'Ancash', 'Mariscal Luzuriaga', 'Casca', 77.3800, -77.3919, -8.8553, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021303', 'Ancash', 'Mariscal Luzuriaga', 'Eleazar Guzman Barron', 93.9600, -77.2419, -8.8997, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021304', 'Ancash', 'Mariscal Luzuriaga', 'Fidel Olivas Escudero', 204.8200, -77.2806, -8.8067, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021305', 'Ancash', 'Mariscal Luzuriaga', 'Llama', 48.1300, -77.2994, -8.9142, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021306', 'Ancash', 'Mariscal Luzuriaga', 'Llumpa', 143.2700, -77.3669, -8.9467, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021307', 'Ancash', 'Mariscal Luzuriaga', 'Lucma', 77.3700, -77.4097, -8.9194, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021308', 'Ancash', 'Mariscal Luzuriaga', 'Musga', 39.7200, -77.3372, -8.9061, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021401', 'Ancash', 'Ocros', 'Ocros', 230.5500, -77.3958, -10.4058, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021402', 'Ancash', 'Ocros', 'Acas', 252.4800, -77.3283, -10.4592, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021403', 'Ancash', 'Ocros', 'Cajamarquilla', 75.5200, -77.1997, -10.3550, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021404', 'Ancash', 'Ocros', 'Carhuapampa', 109.7800, -77.2428, -10.4969, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021405', 'Ancash', 'Ocros', 'Cochas', 408.6600, -77.4236, -10.5350, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021406', 'Ancash', 'Ocros', 'Congas', 130.0300, -77.4419, -10.3361, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021407', 'Ancash', 'Ocros', 'Llipa', 33.6900, -77.2067, -10.3808, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021408', 'Ancash', 'Ocros', 'San Cristobal de Rajan', 67.7500, -77.2192, -10.3858, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021409', 'Ancash', 'Ocros', 'San Pedro', 531.2100, -77.4875, -10.3706, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021410', 'Ancash', 'Ocros', 'Santiago de Chilcas', 85.7600, -77.3669, -10.4381, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021501', 'Ancash', 'Pallasca', 'Cabana', 150.2900, -78.0089, -8.3928, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021502', 'Ancash', 'Pallasca', 'Bolognesi', 86.8800, -78.0506, -8.3517, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021503', 'Ancash', 'Pallasca', 'Conchucos', 585.2400, -77.8483, -8.2658, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021504', 'Ancash', 'Pallasca', 'Huacaschuque', 63.5900, -78.0031, -8.3061, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021505', 'Ancash', 'Pallasca', 'Huandoval', 116.0000, -77.9728, -8.3272, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021506', 'Ancash', 'Pallasca', 'Lacabamba', 64.6800, -77.8958, -8.2583, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021507', 'Ancash', 'Pallasca', 'Llapo', 28.6900, -78.0397, -8.5111, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021508', 'Ancash', 'Pallasca', 'Pallasca', 59.7700, -77.9972, -8.2494, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021509', 'Ancash', 'Pallasca', 'Pampas', 438.1800, -77.8931, -8.1925, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021510', 'Ancash', 'Pallasca', 'Santa Rosa', 298.7700, -78.0650, -8.5239, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021511', 'Ancash', 'Pallasca', 'Tauca', 209.1200, -78.0347, -8.4717, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021601', 'Ancash', 'Pomabamba', 'Pomabamba', 347.9200, -77.4592, -8.8147, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021602', 'Ancash', 'Pomabamba', 'Huayllan', 88.9700, -77.4336, -8.8547, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021603', 'Ancash', 'Pomabamba', 'Parobamba', 331.1000, -77.4294, -8.6886, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021604', 'Ancash', 'Pomabamba', 'Quinuabamba', 146.0600, -77.3978, -8.6944, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021701', 'Ancash', 'Recuay', 'Recuay', 142.9600, -77.4550, -9.7214, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021702', 'Ancash', 'Recuay', 'Catac', 1018.2700, -77.4303, -9.8017, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021703', 'Ancash', 'Recuay', 'Cotaparaco', 172.8500, -77.5878, -9.9931, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021704', 'Ancash', 'Recuay', 'Huayllapampa', 105.2900, -77.5350, -10.0550, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021705', 'Ancash', 'Recuay', 'Llacllin', 101.1000, -77.6222, -10.0700, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021706', 'Ancash', 'Recuay', 'Marca', 184.8400, -77.4747, -10.0878, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021707', 'Ancash', 'Recuay', 'Pampas Chico', 100.5100, -77.3981, -10.1147, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021708', 'Ancash', 'Recuay', 'Pararin', 254.8500, -77.6533, -10.0497, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021709', 'Ancash', 'Recuay', 'Tapacocha', 81.2300, -77.5681, -10.0097, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021710', 'Ancash', 'Recuay', 'Ticapampa', 142.2900, -77.4444, -9.7578, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021801', 'Ancash', 'Santa', 'Chimbote', 1461.4400, -78.5842, -9.0758, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021802', 'Ancash', 'Santa', 'Caceres del Peru', 549.7800, -78.1403, -9.0131, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021803', 'Ancash', 'Santa', 'Coishco', 9.2100, -78.6181, -9.0239, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021804', 'Ancash', 'Santa', 'Macate', 584.6500, -78.0603, -8.7603, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021805', 'Ancash', 'Santa', 'Moro', 359.3500, -78.1844, -9.1378, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021806', 'Ancash', 'Santa', 'Nepeña', 458.2400, -78.3597, -9.1731, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021807', 'Ancash', 'Santa', 'Samanco', 153.9800, -78.6161, -8.9878, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021808', 'Ancash', 'Santa', 'Santa', 42.2300, -78.5314, -9.1156, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021809', 'Ancash', 'Santa', 'Nuevo Chimbote', 389.7300, -78.4994, -9.2606, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021901', 'Ancash', 'Sihuas', 'Sihuas', 43.8100, -77.6344, -8.5556, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021902', 'Ancash', 'Sihuas', 'Acobamba', 153.0400, -77.5850, -8.3264, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021903', 'Ancash', 'Sihuas', 'Alfonso Ugarte', 80.7100, -77.4292, -8.4550, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021904', 'Ancash', 'Sihuas', 'Cashapampa', 66.9600, -77.6558, -8.5617, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021905', 'Ancash', 'Sihuas', 'Chingalpo', 173.2000, -77.5992, -8.3394, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021906', 'Ancash', 'Sihuas', 'Huayllabamba', 287.5800, -77.5689, -8.5350, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021907', 'Ancash', 'Sihuas', 'Quiches', 146.9800, -77.4933, -8.3944, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021908', 'Ancash', 'Sihuas', 'Ragash', 208.4500, -77.6692, -8.5308, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021909', 'Ancash', 'Sihuas', 'San Juan', 209.2400, -77.5808, -8.6461, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A021910', 'Ancash', 'Sihuas', 'Sicsibamba', 86.0000, -77.5367, -8.6236, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A022001', 'Ancash', 'Yungay', 'Yungay', 276.6800, -77.7475, -9.1375, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A022002', 'Ancash', 'Yungay', 'Cascapara', 138.3200, -77.7197, -9.2261, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A022003', 'Ancash', 'Yungay', 'Mancos', 64.0500, -77.7164, -9.1911, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A022004', 'Ancash', 'Yungay', 'Matacoto', 43.6500, -77.7494, -9.1775, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A022005', 'Ancash', 'Yungay', 'Quillo', 373.8300, -78.0431, -9.3297, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A022006', 'Ancash', 'Yungay', 'Ranrahirca', 22.8900, -77.7250, -9.1725, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A022007', 'Ancash', 'Yungay', 'Shupluy', 162.2100, -77.6975, -9.2183, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A022008', 'Ancash', 'Yungay', 'Yanama', 279.8500, -77.4744, -9.0222, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030101', 'Apurimac', 'Abancay', 'Abancay', 313.0700, -72.8792, -13.6367, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030102', 'Apurimac', 'Abancay', 'Chacoche', 186.1000, -72.9897, -13.9417, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030103', 'Apurimac', 'Abancay', 'Circa', 641.6800, -72.8736, -13.8778, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030104', 'Apurimac', 'Abancay', 'Curahuasi', 817.9800, -72.6953, -13.5417, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030105', 'Apurimac', 'Abancay', 'Huanipaca', 432.6200, -72.9397, -13.4917, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030106', 'Apurimac', 'Abancay', 'Lambrama', 521.6200, -72.7728, -13.8706, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030107', 'Apurimac', 'Abancay', 'Pichirhua', 370.6900, -73.0736, -13.8606, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030108', 'Apurimac', 'Abancay', 'San Pedro de Cachora', 108.7700, -72.8161, -13.5144, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030109', 'Apurimac', 'Abancay', 'Tamburco', 54.6000, -72.8725, -13.6211, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030201', 'Apurimac', 'Andahuaylas', 'Andahuaylas', 174.1100, -73.3847, -13.6561, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030202', 'Apurimac', 'Andahuaylas', 'Andarapa', 172.0500, -73.3681, -13.5264, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030203', 'Apurimac', 'Andahuaylas', 'Chiara', 148.9200, -73.6681, -13.8681, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030204', 'Apurimac', 'Andahuaylas', 'Huancarama', 153.0400, -73.0856, -13.6467, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030205', 'Apurimac', 'Andahuaylas', 'Huancaray', 112.2000, -73.5275, -13.7578, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030206', 'Apurimac', 'Andahuaylas', 'Huayana', 96.8700, -73.6097, -14.0503, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030207', 'Apurimac', 'Andahuaylas', 'Kishuara', 309.9100, -73.1214, -13.6914, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030208', 'Apurimac', 'Andahuaylas', 'Pacobamba', 245.9000, -73.0872, -13.6167, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030209', 'Apurimac', 'Andahuaylas', 'Pacucha', 170.3900, -73.3442, -13.6089, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030210', 'Apurimac', 'Andahuaylas', 'Pampachiri', 602.5000, -73.5436, -14.1861, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030211', 'Apurimac', 'Andahuaylas', 'Pomacocha', 129.1900, -73.5911, -14.0850, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030212', 'Apurimac', 'Andahuaylas', 'San Antonio de Cachi', 178.7800, -73.6036, -13.7733, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030213', 'Apurimac', 'Andahuaylas', 'San Jeronimo', 237.4200, -73.3656, -13.6506, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030214', 'Apurimac', 'Andahuaylas', 'San Miguel de Chaccrampa', 83.3700, -73.6086, -13.9594, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030215', 'Apurimac', 'Andahuaylas', 'Santa Maria de Chicmo', 162.1400, -73.4931, -13.6578, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030216', 'Apurimac', 'Andahuaylas', 'Talavera', 148.1200, -73.4278, -13.6536, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030217', 'Apurimac', 'Andahuaylas', 'Tumay Huaraca', 446.7100, -73.5689, -14.0539, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030218', 'Apurimac', 'Andahuaylas', 'Turpo', 121.6700, -73.4728, -13.7856, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030219', 'Apurimac', 'Andahuaylas', 'Kaquiabamba', 97.7900, -73.2878, -13.5369, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030220', 'Apurimac', 'Andahuaylas', 'José María Arguedas', 195.9200, -73.3503, -13.7336, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030301', 'Apurimac', 'Antabamba', 'Antabamba', 603.7600, -72.8778, -14.3653, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030302', 'Apurimac', 'Antabamba', 'El Oro', 68.8100, -73.0583, -14.2092, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030303', 'Apurimac', 'Antabamba', 'Huaquirca', 337.6000, -72.8936, -14.3369, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030304', 'Apurimac', 'Antabamba', 'Juan Espinoza Medrano', 623.2200, -72.9147, -14.4286, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030305', 'Apurimac', 'Antabamba', 'Oropesa', 1180.1200, -72.5639, -14.2628, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030306', 'Apurimac', 'Antabamba', 'Pachaconas', 226.7300, -73.0147, -14.2244, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030307', 'Apurimac', 'Antabamba', 'Sabaino', 178.7700, -72.9442, -14.3122, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030401', 'Apurimac', 'Aymaraes', 'Chalhuanca', 322.3400, -73.2431, -14.2950, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030402', 'Apurimac', 'Aymaraes', 'Capaya', 77.7500, -73.3217, -14.1181, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030403', 'Apurimac', 'Aymaraes', 'Caraybamba', 234.9100, -73.1608, -14.3783, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030404', 'Apurimac', 'Aymaraes', 'Chapimarca', 213.0900, -73.0644, -13.9747, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030405', 'Apurimac', 'Aymaraes', 'Colcabamba', 95.7500, -73.2519, -14.0050, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030406', 'Apurimac', 'Aymaraes', 'Cotaruse', 1749.8300, -73.2053, -14.4164, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030407', 'Apurimac', 'Aymaraes', 'Huayllo', 72.8900, -73.2686, -14.1331, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030408', 'Apurimac', 'Aymaraes', 'Justo Apu Sahuaraura', 97.6400, -73.1758, -14.1489, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030409', 'Apurimac', 'Aymaraes', 'Lucre', 110.4800, -73.2253, -13.9506, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030410', 'Apurimac', 'Aymaraes', 'Pocohuanca', 82.5500, -73.0881, -14.2200, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030411', 'Apurimac', 'Aymaraes', 'San Juan de Chacña', 86.1300, -73.1828, -13.9239, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030412', 'Apurimac', 'Aymaraes', 'Sañayca', 448.9100, -73.3461, -14.2036, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030413', 'Apurimac', 'Aymaraes', 'Soraya', 43.5600, -73.3139, -14.1656, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030414', 'Apurimac', 'Aymaraes', 'Tapairihua', 163.7300, -73.1431, -14.1408, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030415', 'Apurimac', 'Aymaraes', 'Tintay', 136.5800, -73.1867, -13.9592, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030416', 'Apurimac', 'Aymaraes', 'Toraya', 173.0500, -73.2958, -14.0522, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030417', 'Apurimac', 'Aymaraes', 'Yanaca', 103.8800, -73.1589, -14.2250, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030501', 'Apurimac', 'Cotabambas', 'Tambobamba', 722.2300, -72.1769, -13.9450, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030502', 'Apurimac', 'Cotabambas', 'Cotabambas', 331.9600, -72.3567, -13.7458, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030503', 'Apurimac', 'Cotabambas', 'Coyllurqui', 418.9500, -72.4339, -13.8367, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030504', 'Apurimac', 'Cotabambas', 'Haquira', 475.4600, -72.1903, -14.2153, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030505', 'Apurimac', 'Cotabambas', 'Mara', 224.1700, -72.1025, -14.0864, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030506', 'Apurimac', 'Cotabambas', 'Challhuahuacho', 439.9600, -72.2486, -14.1192, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030601', 'Apurimac', 'Chincheros', 'Chincheros', 132.4000, -73.7222, -13.5175, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030602', 'Apurimac', 'Chincheros', 'Anco_Huallo', 38.9000, -73.6769, -13.5328, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030603', 'Apurimac', 'Chincheros', 'Cocharcas', 109.9000, -73.7408, -13.6100, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030604', 'Apurimac', 'Chincheros', 'Huaccana', 472.1200, -73.6900, -13.3872, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030605', 'Apurimac', 'Chincheros', 'Ocobamba', 58.2000, -73.5617, -13.4828, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030606', 'Apurimac', 'Chincheros', 'Ongoy', 118.6900, -73.6697, -13.4031, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030607', 'Apurimac', 'Chincheros', 'Uranmarca', 148.7300, -73.6686, -13.6728, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030608', 'Apurimac', 'Chincheros', 'Ranracancha', 44.5200, -73.6056, -13.5322, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030609', 'Apurimac', 'Chincheros', 'Rocchacc', 56.9600, -73.5997, -13.4400, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030610', 'Apurimac', 'Chincheros', 'El Porvenir', 61.8900, -73.5950, -13.3975, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030611', 'Apurimac', 'Chincheros', 'Los Chankas', 142.2200, -73.8219, -13.4353, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030701', 'Apurimac', 'Grau', 'Chuquibambilla', 432.5000, -72.7086, -14.1042, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030702', 'Apurimac', 'Grau', 'Curpahuasi', 293.4200, -72.6714, -14.0631, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030703', 'Apurimac', 'Grau', 'Gamarra', 370.4500, -72.5122, -13.8728, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030704', 'Apurimac', 'Grau', 'Huayllati', 110.7500, -72.4847, -13.9283, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030705', 'Apurimac', 'Grau', 'Mamara', 66.2100, -72.5906, -14.2275, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030706', 'Apurimac', 'Grau', 'Micaela Bastidas', 110.1400, -72.6136, -14.1150, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030707', 'Apurimac', 'Grau', 'Pataypampa', 158.9100, -72.6706, -14.1775, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030708', 'Apurimac', 'Grau', 'Progreso', 254.5900, -72.4744, -14.0742, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030709', 'Apurimac', 'Grau', 'San Antonio', 24.1200, -72.6233, -14.1689, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030710', 'Apurimac', 'Grau', 'Santa Rosa', 36.1600, -72.6586, -14.1408, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030711', 'Apurimac', 'Grau', 'Turpay', 52.3400, -72.6253, -14.2283, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030712', 'Apurimac', 'Grau', 'Vilcabamba', 7.9700, -72.6250, -14.0758, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030713', 'Apurimac', 'Grau', 'Virundo', 117.1900, -72.6811, -14.2506, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A030714', 'Apurimac', 'Grau', 'Curasco', 139.7700, -72.5672, -14.0606, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040101', 'Arequipa', 'Arequipa', 'Arequipa', 2.8000, -71.5378, -16.4008, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040102', 'Arequipa', 'Arequipa', 'Alto Selva Alegre', 6.9800, -71.5272, -16.3706, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040103', 'Arequipa', 'Arequipa', 'Cayma', 246.3100, -71.5492, -16.3881, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040104', 'Arequipa', 'Arequipa', 'Cerro Colorado', 174.9000, -71.5611, -16.3750, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040105', 'Arequipa', 'Arequipa', 'Characato', 86.0000, -71.4897, -16.4706, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040106', 'Arequipa', 'Arequipa', 'Chiguata', 460.8100, -71.3939, -16.4025, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040107', 'Arequipa', 'Arequipa', 'Jacobo Hunter', 20.3700, -71.5556, -16.4467, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040108', 'Arequipa', 'Arequipa', 'La Joya', 670.2200, -71.8206, -16.4239, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040109', 'Arequipa', 'Arequipa', 'Mariano Melgar', 29.8300, -71.5117, -16.4058, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040110', 'Arequipa', 'Arequipa', 'Miraflores', 28.6800, -71.5211, -16.3950, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040111', 'Arequipa', 'Arequipa', 'Mollebaya', 26.7000, -71.4686, -16.4883, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040112', 'Arequipa', 'Arequipa', 'Paucarpata', 31.0700, -71.5083, -16.4233, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040113', 'Arequipa', 'Arequipa', 'Pocsi', 172.4800, -71.3925, -16.5172, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040114', 'Arequipa', 'Arequipa', 'Polobaya', 441.6100, -71.3747, -16.5606, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040115', 'Arequipa', 'Arequipa', 'Quequeña', 34.9300, -71.4544, -16.5586, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040116', 'Arequipa', 'Arequipa', 'Sabandia', 36.6300, -71.4950, -16.4561, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040117', 'Arequipa', 'Arequipa', 'Sachaca', 26.6300, -71.5678, -16.4286, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040118', 'Arequipa', 'Arequipa', 'San Juan de Siguas', 93.3100, -72.1314, -16.3461, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040119', 'Arequipa', 'Arequipa', 'San Juan de Tarucani', 2264.5900, -71.0656, -16.1839, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040120', 'Arequipa', 'Arequipa', 'Santa Isabel de Siguas', 187.9800, -72.1028, -16.3197, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040121', 'Arequipa', 'Arequipa', 'Santa Rita de Siguas', 370.1600, -72.0944, -16.4928, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040122', 'Arequipa', 'Arequipa', 'Socabaya', 18.6400, -71.5308, -16.4522, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040123', 'Arequipa', 'Arequipa', 'Tiabaya', 31.6200, -71.5908, -16.4489, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040124', 'Arequipa', 'Arequipa', 'Uchumayo', 227.1400, -71.6722, -16.4250, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040125', 'Arequipa', 'Arequipa', 'Vitor', 1543.5000, -71.9389, -16.4658, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040126', 'Arequipa', 'Arequipa', 'Yanahuara', 2.2000, -71.5539, -16.3950, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040127', 'Arequipa', 'Arequipa', 'Yarabamba', 492.2000, -71.4775, -16.5481, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040128', 'Arequipa', 'Arequipa', 'Yura', 1942.9000, -71.6931, -16.2450, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040129', 'Arequipa', 'Arequipa', 'Jose Luis Bustamante y Rivero', 10.8300, -71.5175, -16.4344, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040201', 'Arequipa', 'Camana', 'Camana', 11.6700, -72.7114, -16.6236, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040202', 'Arequipa', 'Camana', 'Jose Maria Quimper', 16.7200, -72.7275, -16.6031, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040203', 'Arequipa', 'Camana', 'Mariano Nicolas Valcarcel', 557.7400, -73.1625, -16.0303, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040204', 'Arequipa', 'Camana', 'Mariscal Caceres', 579.3100, -72.7361, -16.6183, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040205', 'Arequipa', 'Camana', 'Nicolas de Pierola', 391.8400, -72.7147, -16.5717, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040206', 'Arequipa', 'Camana', 'Ocoña', 1414.8000, -73.1081, -16.4328, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040207', 'Arequipa', 'Camana', 'Quilca', 912.2500, -72.4275, -16.7164, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040208', 'Arequipa', 'Camana', 'Samuel Pastor', 113.4000, -72.6989, -16.6150, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040301', 'Arequipa', 'Caraveli', 'Caraveli', 727.6800, -73.3681, -15.7728, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040302', 'Arequipa', 'Caraveli', 'Acari', 799.2100, -74.6172, -15.4325, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040303', 'Arequipa', 'Caraveli', 'Atico', 3146.2400, -73.6258, -16.2089, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040304', 'Arequipa', 'Caraveli', 'Atiquipa', 423.5500, -74.3658, -15.7956, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040305', 'Arequipa', 'Caraveli', 'Bella Union', 1588.4100, -74.6622, -15.4519, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040306', 'Arequipa', 'Caraveli', 'Cahuacho', 1412.1000, -73.4817, -15.5042, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040307', 'Arequipa', 'Caraveli', 'Chala', 378.3800, -74.2472, -15.8667, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040308', 'Arequipa', 'Caraveli', 'Chaparra', 1473.1900, -73.9672, -15.8058, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040309', 'Arequipa', 'Caraveli', 'Huanuhuanu', 708.5200, -74.0936, -15.6592, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040310', 'Arequipa', 'Caraveli', 'Jaqui', 424.7300, -74.4414, -15.4753, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040311', 'Arequipa', 'Caraveli', 'Lomas', 452.7000, -74.8533, -15.5719, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040312', 'Arequipa', 'Caraveli', 'Quicacha', 1048.4200, -73.7978, -15.6253, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040313', 'Arequipa', 'Caraveli', 'Yauca', 556.3000, -74.5269, -15.6606, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040401', 'Arequipa', 'Castilla', 'Aplao', 640.0400, -72.4925, -16.0761, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040402', 'Arequipa', 'Castilla', 'Andagua', 480.7400, -72.3550, -15.4975, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040403', 'Arequipa', 'Castilla', 'Ayo', 327.9700, -72.2744, -15.6836, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040404', 'Arequipa', 'Castilla', 'Chachas', 1190.4900, -72.2719, -15.5017, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040405', 'Arequipa', 'Castilla', 'Chilcaymarca', 181.3700, -72.3794, -15.2867, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040406', 'Arequipa', 'Castilla', 'Choco', 904.3300, -72.1331, -15.5761, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040407', 'Arequipa', 'Castilla', 'Huancarqui', 803.6500, -72.4722, -16.0969, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040408', 'Arequipa', 'Castilla', 'Machaguay', 246.8900, -72.5056, -15.6486, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040409', 'Arequipa', 'Castilla', 'Orcopampa', 724.3700, -72.3431, -15.2661, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040410', 'Arequipa', 'Castilla', 'Pampacolca', 205.1900, -72.5728, -15.7131, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040411', 'Arequipa', 'Castilla', 'Tipan', 57.6800, -72.5053, -15.7272, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040412', 'Arequipa', 'Castilla', 'Uñon', 296.9300, -72.4317, -15.7275, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040413', 'Arequipa', 'Castilla', 'Uraca', 713.8300, -72.4733, -16.2231, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040414', 'Arequipa', 'Castilla', 'Viraco', 141.0000, -72.5247, -15.6547, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040501', 'Arequipa', 'Caylloma', 'Chivay', 240.6400, -71.6033, -15.6400, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040502', 'Arequipa', 'Caylloma', 'Achoma', 393.5400, -71.7017, -15.6611, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040503', 'Arequipa', 'Caylloma', 'Cabanaconde', 460.5500, -71.9797, -15.6214, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040504', 'Arequipa', 'Caylloma', 'Callalli', 1485.1000, -71.4483, -15.5067, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040505', 'Arequipa', 'Caylloma', 'Caylloma', 1499.0000, -71.7725, -15.1872, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040506', 'Arequipa', 'Caylloma', 'Coporaque', 111.9800, -71.6483, -15.6275, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040507', 'Arequipa', 'Caylloma', 'Huambo', 705.7900, -72.1072, -15.7297, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040508', 'Arequipa', 'Caylloma', 'Huanca', 391.1600, -71.8736, -16.0311, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040509', 'Arequipa', 'Caylloma', 'Ichupampa', 74.8900, -71.6892, -15.6503, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040510', 'Arequipa', 'Caylloma', 'Lari', 384.0200, -71.7692, -15.6217, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040511', 'Arequipa', 'Caylloma', 'Lluta', 1226.4600, -72.0161, -16.0156, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040512', 'Arequipa', 'Caylloma', 'Maca', 227.4800, -71.7711, -15.6417, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040513', 'Arequipa', 'Caylloma', 'Madrigal', 160.0900, -71.8103, -15.6086, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040514', 'Arequipa', 'Caylloma', 'San Antonio de Chuca', 1531.2700, -71.0903, -15.8403, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040515', 'Arequipa', 'Caylloma', 'Sibayo', 286.0300, -71.4586, -15.4858, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040516', 'Arequipa', 'Caylloma', 'Tapay', 420.1700, -71.9414, -15.5789, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040517', 'Arequipa', 'Caylloma', 'Tisco', 1445.0200, -71.4492, -15.3469, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040518', 'Arequipa', 'Caylloma', 'Tuti', 241.8900, -71.5511, -15.5325, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040519', 'Arequipa', 'Caylloma', 'Yanque', 1108.5800, -71.6614, -15.6500, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040520', 'Arequipa', 'Caylloma', 'Majes', 1625.8000, -72.1908, -16.3586, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040601', 'Arequipa', 'Condesuyos', 'Chuquibamba', 1255.0400, -72.6542, -15.8397, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040602', 'Arequipa', 'Condesuyos', 'Andaray', 847.5600, -72.8597, -15.7961, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040603', 'Arequipa', 'Condesuyos', 'Cayarani', 1395.6700, -72.0231, -14.6731, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040604', 'Arequipa', 'Condesuyos', 'Chichas', 392.1600, -72.9183, -15.5469, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040605', 'Arequipa', 'Condesuyos', 'Iray', 247.6200, -72.6250, -15.8564, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040606', 'Arequipa', 'Condesuyos', 'Rio Grande', 527.4800, -73.1308, -15.9411, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040607', 'Arequipa', 'Condesuyos', 'Salamanca', 1235.8000, -72.8333, -15.5042, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040608', 'Arequipa', 'Condesuyos', 'Yanaquihua', 1057.0700, -72.8758, -15.7747, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040701', 'Arequipa', 'Islay', 'Mollendo', 960.8300, -72.0181, -17.0250, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040702', 'Arequipa', 'Islay', 'Cocachacra', 1536.9600, -71.7711, -17.0942, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040703', 'Arequipa', 'Islay', 'Dean Valdivia', 134.0800, -71.8239, -17.1450, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040704', 'Arequipa', 'Islay', 'Islay', 383.7800, -72.1017, -17.0000, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040705', 'Arequipa', 'Islay', 'Mejia', 100.7800, -71.9086, -17.1028, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040706', 'Arequipa', 'Islay', 'Punta de Bombon', 769.6000, -71.7928, -17.1728, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040801', 'Arequipa', 'La Union', 'Cotahuasi', 166.5000, -72.8911, -15.2111, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040802', 'Arequipa', 'La Union', 'Alca', 193.4200, -72.7647, -15.1342, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040803', 'Arequipa', 'La Union', 'Charcana', 165.2700, -73.0697, -15.2411, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040804', 'Arequipa', 'La Union', 'Huaynacotas', 932.6400, -72.8514, -15.1744, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040805', 'Arequipa', 'La Union', 'Pampamarca', 782.1700, -72.9072, -15.1850, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040806', 'Arequipa', 'La Union', 'Puyca', 1501.2000, -72.6908, -15.0589, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040807', 'Arequipa', 'La Union', 'Quechualla', 138.3700, -73.0233, -15.2758, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040808', 'Arequipa', 'La Union', 'Sayla', 66.5500, -73.2214, -15.3211, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040809', 'Arequipa', 'La Union', 'Tauria', 314.6800, -73.2319, -15.3553, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040810', 'Arequipa', 'La Union', 'Tomepampa', 94.1600, -72.8297, -15.1728, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A040811', 'Arequipa', 'La Union', 'Toro', 391.4400, -72.9275, -15.2642, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050101', 'Ayacucho', 'Huamanga', 'Ayacucho', 83.1100, -74.2228, -13.1542, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050102', 'Ayacucho', 'Huamanga', 'Acocro', 436.6500, -74.0411, -13.2183, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050103', 'Ayacucho', 'Huamanga', 'Acos Vinchos', 156.8200, -74.1017, -13.1125, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050104', 'Ayacucho', 'Huamanga', 'Carmen Alto', 17.5200, -74.2242, -13.1722, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050105', 'Ayacucho', 'Huamanga', 'Chiara', 461.6100, -74.2053, -13.2733, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050106', 'Ayacucho', 'Huamanga', 'Ocros', 305.4100, -73.9164, -13.3917, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050107', 'Ayacucho', 'Huamanga', 'Pacaycasa', 53.5500, -74.2142, -13.0564, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050108', 'Ayacucho', 'Huamanga', 'Quinua', 116.6100, -74.1397, -13.0497, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050109', 'Ayacucho', 'Huamanga', 'San Jose de Ticllas', 82.3100, -74.3331, -13.1328, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050110', 'Ayacucho', 'Huamanga', 'San Juan Bautista', 15.1900, -74.2222, -13.1658, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050111', 'Ayacucho', 'Huamanga', 'Santiago de Pischa', 91.0900, -74.3911, -13.0850, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050112', 'Ayacucho', 'Huamanga', 'Socos', 172.3400, -74.2894, -13.2150, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050113', 'Ayacucho', 'Huamanga', 'Tambillo', 153.2300, -74.1097, -13.1922, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050114', 'Ayacucho', 'Huamanga', 'Vinchos', 928.6800, -74.3536, -13.2417, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050115', 'Ayacucho', 'Huamanga', 'Jesus Nazareno', 16.1200, -74.2114, -13.1531, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050116', 'Ayacucho', 'Huamanga', 'Andrés Avelino Cáceres Dorregaray', 9.2800, -74.2106, -13.1617, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050201', 'Ayacucho', 'Cangallo', 'Cangallo', 187.0500, -74.1442, -13.6281, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050202', 'Ayacucho', 'Cangallo', 'Chuschi', 418.0300, -74.3536, -13.5831, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050203', 'Ayacucho', 'Cangallo', 'Los Morochucos', 253.2200, -74.1947, -13.5572, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050204', 'Ayacucho', 'Cangallo', 'Maria Parado de Bellido', 129.1300, -74.2347, -13.6039, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050205', 'Ayacucho', 'Cangallo', 'Paras', 789.0900, -74.6272, -13.5517, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050206', 'Ayacucho', 'Cangallo', 'Totos', 112.9000, -74.5242, -13.5681, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050301', 'Ayacucho', 'Huanca Sancos', 'Sancos', 1289.7000, -74.3339, -13.9192, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050302', 'Ayacucho', 'Huanca Sancos', 'Carapo', 241.3400, -74.3147, -13.8375, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050303', 'Ayacucho', 'Huanca Sancos', 'Sacsamarca', 673.0300, -74.3150, -13.9464, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050304', 'Ayacucho', 'Huanca Sancos', 'Santiago de Lucanamarca', 658.2600, -74.3722, -13.8433, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050401', 'Ayacucho', 'Huanta', 'Huanta', 193.4800, -74.2486, -12.9386, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050402', 'Ayacucho', 'Huanta', 'Ayahuanco', 297.8900, -74.3231, -12.5981, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050403', 'Ayacucho', 'Huanta', 'Huamanguilla', 95.2700, -74.1731, -13.0108, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050404', 'Ayacucho', 'Huanta', 'Iguain', 61.4400, -74.2083, -12.9919, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050405', 'Ayacucho', 'Huanta', 'Luricocha', 130.0400, -74.2711, -12.8981, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050406', 'Ayacucho', 'Huanta', 'Santillana', 336.1700, -74.2528, -12.7656, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050407', 'Ayacucho', 'Huanta', 'Sivia', 1053.5200, -73.8578, -12.5119, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050408', 'Ayacucho', 'Huanta', 'Llochegua', 469.0200, -73.9097, -12.4114, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050409', 'Ayacucho', 'Huanta', 'Canayre', 244.6900, -74.0228, -12.2822, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050410', 'Ayacucho', 'Huanta', 'Uchuraccay', 300.2800, -74.1464, -12.7622, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050411', 'Ayacucho', 'Huanta', 'Pucacolpa', 562.0600, -73.4136, -15.2550, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050412', 'Ayacucho', 'Huanta', 'Chaca', 124.4600, -74.2069, -12.7836, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050501', 'Ayacucho', 'La Mar', 'San Miguel', 457.8800, -73.9789, -13.0117, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050502', 'Ayacucho', 'La Mar', 'Anco', 802.8600, -73.7072, -13.0592, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050503', 'Ayacucho', 'La Mar', 'Ayna', 290.5100, -73.7900, -12.6244, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050504', 'Ayacucho', 'La Mar', 'Chilcas', 156.5800, -73.9083, -13.1722, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050505', 'Ayacucho', 'La Mar', 'Chungui', 1093.0500, -73.6242, -13.2222, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050506', 'Ayacucho', 'La Mar', 'Luis Carranza', 135.8400, -73.8925, -13.2283, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050507', 'Ayacucho', 'La Mar', 'Santa Rosa', 396.5800, -73.7350, -12.6894, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050508', 'Ayacucho', 'La Mar', 'Tambo', 313.8200, -74.0233, -12.9506, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050509', 'Ayacucho', 'La Mar', 'Samugari', 387.4500, -73.6414, -12.7908, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050510', 'Ayacucho', 'La Mar', 'Anchihuay', 272.0700, -73.5817, -12.8633, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050511', 'Ayacucho', 'La Mar', 'Oronccoy', 553.7400, -73.4358, -13.3808, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050601', 'Ayacucho', 'Lucanas', 'Puquio', 866.4300, -74.1283, -14.6914, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050602', 'Ayacucho', 'Lucanas', 'Aucara', 903.5100, -73.9703, -14.2681, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050603', 'Ayacucho', 'Lucanas', 'Cabana', 402.6200, -73.9667, -14.2897, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050604', 'Ayacucho', 'Lucanas', 'Carmen Salcedo', 473.6600, -73.9625, -14.3875, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050605', 'Ayacucho', 'Lucanas', 'Chaviña', 399.0900, -73.8364, -14.9778, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050606', 'Ayacucho', 'Lucanas', 'Chipao', 1166.9100, -73.8786, -14.3661, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050607', 'Ayacucho', 'Lucanas', 'Huac-Huas', 309.4800, -74.9419, -14.1308, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050608', 'Ayacucho', 'Lucanas', 'Laramate', 785.8900, -74.8425, -14.2858, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050609', 'Ayacucho', 'Lucanas', 'Leoncio Prado', 1053.6000, -74.6700, -14.7278, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050610', 'Ayacucho', 'Lucanas', 'Llauta', 482.0700, -74.9192, -14.2439, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050611', 'Ayacucho', 'Lucanas', 'Lucanas', 1205.7800, -74.2328, -14.6222, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050612', 'Ayacucho', 'Lucanas', 'Ocaña', 848.3600, -74.8219, -14.3983, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050613', 'Ayacucho', 'Lucanas', 'Otoca', 720.2000, -74.6892, -14.4894, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050614', 'Ayacucho', 'Lucanas', 'Saisa', 585.4000, -74.4183, -14.9383, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050615', 'Ayacucho', 'Lucanas', 'San Cristobal', 391.8300, -74.2217, -14.7425, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050616', 'Ayacucho', 'Lucanas', 'San Juan', 44.5900, -74.2011, -14.6600, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050617', 'Ayacucho', 'Lucanas', 'San Pedro', 733.0300, -74.0972, -14.7708, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050618', 'Ayacucho', 'Lucanas', 'San Pedro de Palco', 531.5500, -74.6500, -14.4139, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050619', 'Ayacucho', 'Lucanas', 'Sancos', 1520.8700, -73.9511, -15.0619, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050620', 'Ayacucho', 'Lucanas', 'Santa Ana de Huaycahuacho', 50.6300, -73.9550, -14.2281, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050621', 'Ayacucho', 'Lucanas', 'Santa Lucia', 1019.1400, -74.5233, -14.9786, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050701', 'Ayacucho', 'Parinacochas', 'Coracora', 1399.4100, -73.7819, -15.0161, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050702', 'Ayacucho', 'Parinacochas', 'Chumpi', 366.3000, -73.7478, -15.0944, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050703', 'Ayacucho', 'Parinacochas', 'Coronel Castañeda', 1108.0400, -73.2886, -14.8100, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050704', 'Ayacucho', 'Parinacochas', 'Pacapausa', 144.3000, -73.3678, -14.9492, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050705', 'Ayacucho', 'Parinacochas', 'Pullo', 1562.3400, -73.8294, -15.2092, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050706', 'Ayacucho', 'Parinacochas', 'Puyusca', 700.7500, -73.5703, -15.2492, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050707', 'Ayacucho', 'Parinacochas', 'San Francisco de Ravacayco', 99.8300, -73.3556, -14.9975, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050708', 'Ayacucho', 'Parinacochas', 'Upahuacho', 587.3500, -73.3972, -14.9075, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050801', 'Ayacucho', 'Paucar del Sara Sara', 'Pausa', 242.7800, -73.3433, -15.2806, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050802', 'Ayacucho', 'Paucar del Sara Sara', 'Colta', 277.2900, -73.2939, -15.1631, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050803', 'Ayacucho', 'Paucar del Sara Sara', 'Corculla', 97.0500, -73.2000, -15.2617, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050804', 'Ayacucho', 'Paucar del Sara Sara', 'Lampa', 289.4500, -73.3472, -15.1847, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050805', 'Ayacucho', 'Paucar del Sara Sara', 'Marcabamba', 122.5300, -73.3436, -15.1492, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050806', 'Ayacucho', 'Paucar del Sara Sara', 'Oyolo', 820.1300, -73.1881, -15.1797, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050807', 'Ayacucho', 'Paucar del Sara Sara', 'Pararca', 57.9100, -73.4653, -15.2169, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050808', 'Ayacucho', 'Paucar del Sara Sara', 'San Javier de Alpabamba', 92.8700, -73.3103, -15.0539, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050809', 'Ayacucho', 'Paucar del Sara Sara', 'San Jose de Ushua', 17.3300, -73.2258, -15.2242, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050810', 'Ayacucho', 'Paucar del Sara Sara', 'Sara Sara', 79.5800, -73.4514, -15.2458, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050901', 'Ayacucho', 'Sucre', 'Querobamba', 275.6500, -73.8408, -14.0136, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050902', 'Ayacucho', 'Sucre', 'Belen', 41.4600, -73.7578, -13.8094, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050903', 'Ayacucho', 'Sucre', 'Chalcos', 58.4300, -73.7533, -13.8478, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050904', 'Ayacucho', 'Sucre', 'Chilcayoc', 33.0600, -73.7275, -13.8825, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050905', 'Ayacucho', 'Sucre', 'Huacaña', 132.7300, -73.8864, -14.1728, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050906', 'Ayacucho', 'Sucre', 'Morcolla', 289.3400, -73.8736, -14.1097, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050907', 'Ayacucho', 'Sucre', 'Paico', 79.6500, -73.6433, -14.0386, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050908', 'Ayacucho', 'Sucre', 'San Pedro de Larcay', 310.0700, -73.5758, -14.1697, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050909', 'Ayacucho', 'Sucre', 'San Salvador de Quije', 144.6300, -73.7314, -13.9703, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050910', 'Ayacucho', 'Sucre', 'Santiago de Paucaray', 62.6500, -73.6372, -14.0444, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A050911', 'Ayacucho', 'Sucre', 'Soras', 357.9700, -73.6056, -14.1153, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051001', 'Ayacucho', 'Victor Fajardo', 'Huancapi', 223.3500, -74.0669, -13.7528, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051002', 'Ayacucho', 'Victor Fajardo', 'Alcamenca', 125.1100, -74.1467, -13.6578, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051003', 'Ayacucho', 'Victor Fajardo', 'Apongo', 171.5800, -73.9342, -14.0147, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051004', 'Ayacucho', 'Victor Fajardo', 'Asquipata', 70.7200, -73.9094, -14.0536, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051005', 'Ayacucho', 'Victor Fajardo', 'Canaria', 263.8800, -73.9053, -13.9231, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051006', 'Ayacucho', 'Victor Fajardo', 'Cayara', 69.2500, -73.9906, -13.7953, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051007', 'Ayacucho', 'Victor Fajardo', 'Colca', 69.5700, -74.0342, -13.7125, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051008', 'Ayacucho', 'Victor Fajardo', 'Huamanquiquia', 67.3300, -74.2731, -13.7283, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051009', 'Ayacucho', 'Victor Fajardo', 'Huancaraylla', 165.4900, -74.1028, -13.7175, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051010', 'Ayacucho', 'Victor Fajardo', 'Huaya', 162.2300, -73.9536, -13.8492, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051011', 'Ayacucho', 'Victor Fajardo', 'Sarhua', 373.1400, -74.3208, -13.6714, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051012', 'Ayacucho', 'Victor Fajardo', 'Vilcanchos', 498.5400, -74.5339, -13.6122, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051101', 'Ayacucho', 'Vilcas Huaman', 'Vilcas Huaman', 216.8900, -73.9528, -13.6533, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051102', 'Ayacucho', 'Vilcas Huaman', 'Accomarca', 82.4300, -73.9033, -13.8003, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051103', 'Ayacucho', 'Vilcas Huaman', 'Carhuanca', 56.9100, -73.7892, -13.7425, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051104', 'Ayacucho', 'Vilcas Huaman', 'Concepcion', 215.0300, -73.8750, -13.5322, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051105', 'Ayacucho', 'Vilcas Huaman', 'Huambalpa', 150.7600, -73.9339, -13.7494, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051106', 'Ayacucho', 'Vilcas Huaman', 'Independencia', 85.2800, -73.8878, -13.8581, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051107', 'Ayacucho', 'Vilcas Huaman', 'Saurama', 95.1500, -73.7622, -13.6950, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A051108', 'Ayacucho', 'Vilcas Huaman', 'Vischongo', 268.8700, -73.9983, -13.5881, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060101', 'Cajamarca', 'Cajamarca', 'Cajamarca', 382.7400, -78.5153, -7.1564, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060102', 'Cajamarca', 'Cajamarca', 'Asuncion', 210.1800, -78.5203, -7.3233, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060103', 'Cajamarca', 'Cajamarca', 'Chetilla', 73.9400, -78.6714, -7.1461, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060104', 'Cajamarca', 'Cajamarca', 'Cospan', 558.7900, -78.5433, -7.4264, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060105', 'Cajamarca', 'Cajamarca', 'Encañada', 635.0600, -78.3447, -7.0864, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060106', 'Cajamarca', 'Cajamarca', 'Jesus', 267.7800, -78.3778, -7.2456, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060107', 'Cajamarca', 'Cajamarca', 'Llacanora', 49.4200, -78.4269, -7.1928, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060108', 'Cajamarca', 'Cajamarca', 'Los Baños del Inca', 276.4000, -78.4633, -7.1617, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060109', 'Cajamarca', 'Cajamarca', 'Magdalena', 215.3800, -78.6564, -7.2508, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060110', 'Cajamarca', 'Cajamarca', 'Matara', 59.7400, -78.2636, -7.2564, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060111', 'Cajamarca', 'Cajamarca', 'Namora', 180.6900, -78.3247, -7.2017, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060112', 'Cajamarca', 'Cajamarca', 'San Juan', 69.6600, -78.4992, -7.2903, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060201', 'Cajamarca', 'Cajabamba', 'Cajabamba', 192.2900, -78.0472, -7.6222, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060202', 'Cajamarca', 'Cajabamba', 'Cachachi', 820.8100, -78.2703, -7.4494, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060203', 'Cajamarca', 'Cajabamba', 'Condebamba', 204.6000, -78.0700, -7.5736, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060204', 'Cajamarca', 'Cajabamba', 'Sitacocha', 589.9400, -77.9714, -7.5211, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060301', 'Cajamarca', 'Celendin', 'Celendin', 409.0000, -78.1489, -6.8681, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060302', 'Cajamarca', 'Celendin', 'Chumuch', 196.3000, -78.2033, -6.6033, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060303', 'Cajamarca', 'Celendin', 'Cortegana', 233.3100, -78.3036, -6.4906, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060304', 'Cajamarca', 'Celendin', 'Huasmin', 437.5000, -78.2431, -6.8386, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060305', 'Cajamarca', 'Celendin', 'Jorge Chavez', 53.3400, -78.0914, -6.9414, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060306', 'Cajamarca', 'Celendin', 'Jose Galvez', 58.0100, -78.1328, -6.9253, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060307', 'Cajamarca', 'Celendin', 'Miguel Iglesias', 235.7300, -78.2381, -6.6439, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060308', 'Cajamarca', 'Celendin', 'Oxamarca', 292.5200, -78.0725, -7.0397, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060309', 'Cajamarca', 'Celendin', 'Sorochuco', 170.0200, -78.2553, -6.9103, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060310', 'Cajamarca', 'Celendin', 'Sucre', 270.9800, -78.1369, -6.9408, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060311', 'Cajamarca', 'Celendin', 'Utco', 100.7900, -78.0639, -6.8964, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060312', 'Cajamarca', 'Celendin', 'La Libertad de Pallan', 184.0900, -78.2908, -6.7269, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060401', 'Cajamarca', 'Chota', 'Chota', 261.7500, -78.6508, -6.5631, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060402', 'Cajamarca', 'Chota', 'Anguia', 123.0100, -78.6050, -6.3422, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060403', 'Cajamarca', 'Chota', 'Chadin', 66.5300, -78.4197, -6.4731, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060404', 'Cajamarca', 'Chota', 'Chiguirip', 51.4400, -78.7192, -6.4286, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060405', 'Cajamarca', 'Chota', 'Chimban', 198.9900, -78.4786, -6.2567, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060406', 'Cajamarca', 'Chota', 'Choropampa', 171.5900, -78.3503, -6.4372, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060407', 'Cajamarca', 'Chota', 'Cochabamba', 130.0100, -78.8878, -6.4731, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060408', 'Cajamarca', 'Chota', 'Conchan', 180.2300, -78.6572, -6.4444, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060409', 'Cajamarca', 'Chota', 'Huambos', 240.7200, -78.9639, -6.4522, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060410', 'Cajamarca', 'Chota', 'Lajas', 120.7300, -78.7389, -6.5617, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060411', 'Cajamarca', 'Chota', 'Llama', 494.9400, -79.1197, -6.5144, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060412', 'Cajamarca', 'Chota', 'Miracosta', 415.6900, -79.2831, -6.4053, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060413', 'Cajamarca', 'Chota', 'Paccha', 93.9700, -78.4211, -6.5022, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060414', 'Cajamarca', 'Chota', 'Pion', 141.0500, -78.4817, -6.1783, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060415', 'Cajamarca', 'Chota', 'Querocoto', 301.0700, -79.0356, -6.3586, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060416', 'Cajamarca', 'Chota', 'San Juan de Licupis', 205.0100, -79.2414, -6.4244, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060417', 'Cajamarca', 'Chota', 'Tacabamba', 196.2500, -78.6125, -6.3931, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060418', 'Cajamarca', 'Chota', 'Tocmoche', 222.3800, -79.3606, -6.4125, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060419', 'Cajamarca', 'Chota', 'Chalamarca', 179.7400, -78.4689, -6.4889, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060501', 'Cajamarca', 'Contumaza', 'Contumaza', 358.2800, -78.8064, -7.3653, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060502', 'Cajamarca', 'Contumaza', 'Chilete', 133.9400, -78.8406, -7.2222, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060503', 'Cajamarca', 'Contumaza', 'Cupisnique', 280.2000, -79.0297, -7.3492, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060504', 'Cajamarca', 'Contumaza', 'Guzmango', 49.8800, -78.8981, -7.3842, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060505', 'Cajamarca', 'Contumaza', 'San Benito', 486.5500, -78.9292, -7.4247, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060506', 'Cajamarca', 'Contumaza', 'Santa Cruz de Toled', 64.5300, -78.8403, -7.3436, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060507', 'Cajamarca', 'Contumaza', 'Tantarica', 149.7000, -78.9353, -7.3006, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060508', 'Cajamarca', 'Contumaza', 'Yonan', 547.2500, -79.1300, -7.2536, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060601', 'Cajamarca', 'Cutervo', 'Cutervo', 422.2700, -78.8206, -6.3794, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060602', 'Cajamarca', 'Cutervo', 'Callayuc', 316.0500, -78.9047, -6.1764, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060603', 'Cajamarca', 'Cutervo', 'Choros', 276.9600, -78.6967, -5.9008, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060604', 'Cajamarca', 'Cutervo', 'Cujillo', 108.9300, -78.5725, -6.1072, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060605', 'Cajamarca', 'Cutervo', 'La Ramada', 30.2700, -78.5547, -6.2172, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060606', 'Cajamarca', 'Cutervo', 'Pimpingos', 186.0400, -78.7575, -6.0622, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060607', 'Cajamarca', 'Cutervo', 'Querocotillo', 697.1000, -79.0369, -6.2747, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060608', 'Cajamarca', 'Cutervo', 'San Andres de Cutervo', 133.4000, -78.7111, -6.2364, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060609', 'Cajamarca', 'Cutervo', 'San Juan de Cutervo', 60.8700, -78.6011, -6.1747, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060610', 'Cajamarca', 'Cutervo', 'San Luis de Lucma', 109.7400, -78.6056, -6.2956, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060611', 'Cajamarca', 'Cutervo', 'Santa Cruz', 128.0000, -78.8547, -6.0964, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060612', 'Cajamarca', 'Cutervo', 'Santo Domingo de La Capilla', 103.7400, -78.8578, -6.2450, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060613', 'Cajamarca', 'Cutervo', 'Santo Tomas', 279.6100, -78.6908, -6.1544, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060614', 'Cajamarca', 'Cutervo', 'Socota', 134.8300, -78.7014, -6.3158, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060615', 'Cajamarca', 'Cutervo', 'Toribio Casanova', 40.6500, -78.6997, -6.0069, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060701', 'Cajamarca', 'Hualgayoc', 'Bambamarca', 451.3800, -78.5242, -6.6786, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060702', 'Cajamarca', 'Hualgayoc', 'Chugur', 99.6000, -78.7397, -6.6711, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060703', 'Cajamarca', 'Hualgayoc', 'Hualgayoc', 226.1700, -78.6119, -6.7656, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060801', 'Cajamarca', 'Jaen', 'Jaen', 537.2500, -78.8117, -5.7106, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060802', 'Cajamarca', 'Jaen', 'Bellavista', 870.5500, -78.6786, -5.6664, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060803', 'Cajamarca', 'Jaen', 'Chontali', 428.5500, -79.0878, -5.6458, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060804', 'Cajamarca', 'Jaen', 'Colasay', 735.7300, -79.0689, -5.9786, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060805', 'Cajamarca', 'Jaen', 'Huabal', 80.6900, -78.9122, -5.6133, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060806', 'Cajamarca', 'Jaen', 'Las Pirias', 60.4100, -78.8533, -5.6269, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060807', 'Cajamarca', 'Jaen', 'Pomahuaca', 732.8000, -79.2289, -5.9322, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060808', 'Cajamarca', 'Jaen', 'Pucara', 240.3000, -79.1283, -6.0414, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060809', 'Cajamarca', 'Jaen', 'Sallique', 373.8900, -79.3150, -5.6569, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060810', 'Cajamarca', 'Jaen', 'San Felipe', 255.4900, -79.3136, -5.7697, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060811', 'Cajamarca', 'Jaen', 'San Jose del Alto', 634.1100, -79.0539, -5.3908, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060812', 'Cajamarca', 'Jaen', 'Santa Rosa', 282.8000, -78.5644, -5.4358, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060901', 'Cajamarca', 'San Ignacio', 'San Ignacio', 381.8800, -79.0003, -5.1403, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060902', 'Cajamarca', 'San Ignacio', 'Chirinos', 351.9100, -78.8983, -5.3028, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060903', 'Cajamarca', 'San Ignacio', 'Huarango', 922.3500, -78.7753, -5.2706, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060904', 'Cajamarca', 'San Ignacio', 'La Coipa', 376.0900, -78.9044, -5.3933, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060905', 'Cajamarca', 'San Ignacio', 'Namballe', 663.5100, -79.0856, -5.0089, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060906', 'Cajamarca', 'San Ignacio', 'San Jose de Lourdes', 1482.7500, -78.9139, -5.1025, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A060907', 'Cajamarca', 'San Ignacio', 'Tabaconas', 798.5900, -79.2833, -5.3164, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061001', 'Cajamarca', 'San Marcos', 'Pedro Galvez', 238.7400, -78.1728, -7.3361, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061002', 'Cajamarca', 'San Marcos', 'Chancay', 61.8000, -78.1264, -7.3858, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061003', 'Cajamarca', 'San Marcos', 'Eduardo Villanueva', 63.1300, -78.1297, -7.4636, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061004', 'Cajamarca', 'San Marcos', 'Gregorio Pita', 212.8100, -78.1594, -7.2725, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061005', 'Cajamarca', 'San Marcos', 'Ichocan', 76.1100, -78.1283, -7.3669, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061006', 'Cajamarca', 'San Marcos', 'Jose Manuel Quiroz', 115.4200, -78.0467, -7.3472, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061007', 'Cajamarca', 'San Marcos', 'Jose Sabogal', 594.3100, -78.0167, -7.2833, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061101', 'Cajamarca', 'San Miguel', 'San Miguel', 368.2600, -78.8536, -6.9997, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061102', 'Cajamarca', 'San Miguel', 'Bolivar', 78.9700, -79.1789, -6.9772, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061103', 'Cajamarca', 'San Miguel', 'Calquis', 339.0000, -78.8522, -6.9797, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061104', 'Cajamarca', 'San Miguel', 'Catilluc', 197.3100, -78.7906, -6.7994, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061105', 'Cajamarca', 'San Miguel', 'El Prado', 71.4400, -79.0111, -7.0339, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061106', 'Cajamarca', 'San Miguel', 'La Florida', 61.3300, -79.1231, -6.8683, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061107', 'Cajamarca', 'San Miguel', 'Llapa', 132.6800, -78.8072, -6.9786, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061108', 'Cajamarca', 'San Miguel', 'Nanchoc', 358.9400, -79.2419, -6.9583, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061109', 'Cajamarca', 'San Miguel', 'Niepos', 158.8800, -79.1283, -6.9272, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061110', 'Cajamarca', 'San Miguel', 'San Gregorio', 308.0500, -79.0956, -7.0575, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061111', 'Cajamarca', 'San Miguel', 'San Silvestre de Cochan', 131.6200, -78.7750, -6.9778, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061112', 'Cajamarca', 'San Miguel', 'Tongod', 163.8900, -78.8236, -6.7631, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061113', 'Cajamarca', 'San Miguel', 'Union Agua Blanca', 171.7100, -79.0600, -7.0447, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061201', 'Cajamarca', 'San Pablo', 'San Pablo', 197.9200, -78.8231, -7.1181, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061202', 'Cajamarca', 'San Pablo', 'San Bernardino', 167.1200, -78.8311, -7.1681, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061203', 'Cajamarca', 'San Pablo', 'San Luis', 42.8800, -78.8700, -7.1583, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061204', 'Cajamarca', 'San Pablo', 'Tumbaden', 264.3700, -78.7403, -7.0203, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061301', 'Cajamarca', 'Santa Cruz', 'Santa Cruz', 102.5100, -78.9464, -6.6267, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061302', 'Cajamarca', 'Santa Cruz', 'Andabamba', 7.6100, -78.8194, -6.6628, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061303', 'Cajamarca', 'Santa Cruz', 'Catache', 609.1600, -79.0325, -6.6753, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061304', 'Cajamarca', 'Santa Cruz', 'Chancaybaños', 120.0400, -78.8681, -6.5764, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061305', 'Cajamarca', 'Santa Cruz', 'La Esperanza', 59.7000, -78.8950, -6.5931, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061306', 'Cajamarca', 'Santa Cruz', 'Ninabamba', 60.0400, -78.7894, -6.6497, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061307', 'Cajamarca', 'Santa Cruz', 'Pulan', 155.6700, -78.9231, -6.7397, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061308', 'Cajamarca', 'Santa Cruz', 'Saucepampa', 31.5800, -78.9183, -6.6928, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061309', 'Cajamarca', 'Santa Cruz', 'Sexi', 192.8700, -79.0514, -6.5636, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061310', 'Cajamarca', 'Santa Cruz', 'Uticyacu', 43.3800, -78.7972, -6.6064, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A061311', 'Cajamarca', 'Santa Cruz', 'Yauyucan', 35.3700, -78.8200, -6.6783, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A070101', 'Callao', 'Callao', 'Callao', 45.6500, -77.1492, -12.0603, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A070102', 'Callao', 'Callao', 'Bellavista', 4.5600, -77.1317, -12.0625, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A070103', 'Callao', 'Callao', 'Carmen de La Legua', 2.1200, -77.0969, -12.0461, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A070104', 'Callao', 'Callao', 'La Perla', 2.7500, -77.1211, -12.0711, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A070105', 'Callao', 'Callao', 'La Punta', 18.3800, -77.1692, -12.0717, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A070106', 'Callao', 'Callao', 'Ventanilla', 69.9300, -77.1422, -11.8989, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A070107', 'Callao', 'Callao', 'Mi Peru', 2.5200, -77.1250, -11.8550, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080101', 'Cusco', 'Cusco', 'Cusco', 116.2200, -71.9800, -13.5153, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080102', 'Cusco', 'Cusco', 'Ccorca', 188.5600, -72.0594, -13.5842, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080103', 'Cusco', 'Cusco', 'Poroy', 14.9600, -72.0425, -13.4969, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080104', 'Cusco', 'Cusco', 'San Jeronimo', 103.3400, -71.8872, -13.5439, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080105', 'Cusco', 'Cusco', 'San Sebastian', 89.4400, -71.9333, -13.5311, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080106', 'Cusco', 'Cusco', 'Santiago', 69.7200, -71.9842, -13.5272, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080107', 'Cusco', 'Cusco', 'Saylla', 28.3800, -71.8264, -13.5703, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080108', 'Cusco', 'Cusco', 'Wanchaq', 6.3800, -71.9656, -13.5253, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080201', 'Cusco', 'Acomayo', 'Acomayo', 141.2700, -71.6850, -13.9189, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080202', 'Cusco', 'Acomayo', 'Acopia', 91.7200, -71.4931, -14.0581, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080203', 'Cusco', 'Acomayo', 'Acos', 137.5500, -71.7383, -13.9506, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080204', 'Cusco', 'Acomayo', 'Mosoc Llacta', 43.6100, -71.4733, -14.1203, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080205', 'Cusco', 'Acomayo', 'Pomacanchi', 275.5600, -71.5714, -14.0350, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080206', 'Cusco', 'Acomayo', 'Rondocan', 180.2200, -71.7822, -13.7786, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080207', 'Cusco', 'Acomayo', 'Sangarara', 78.2900, -71.6031, -13.9475, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080301', 'Cusco', 'Anta', 'Anta', 202.5800, -72.1469, -13.4636, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080302', 'Cusco', 'Anta', 'Ancahuasi', 123.5800, -72.2944, -13.4575, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080303', 'Cusco', 'Anta', 'Cachimayo', 43.2800, -72.0728, -13.4775, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080304', 'Cusco', 'Anta', 'Chinchaypujio', 390.5800, -72.2339, -13.6294, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080305', 'Cusco', 'Anta', 'Huarocondo', 228.6200, -72.2086, -13.4131, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080306', 'Cusco', 'Anta', 'Limatambo', 512.9200, -72.4458, -13.4808, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080307', 'Cusco', 'Anta', 'Mollepata', 284.4800, -72.5353, -13.5078, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080308', 'Cusco', 'Anta', 'Pucyura', 37.7500, -72.1119, -13.4803, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080309', 'Cusco', 'Anta', 'Zurite', 52.3300, -72.2558, -13.4556, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080401', 'Cusco', 'Calca', 'Calca', 311.0100, -71.9578, -13.3231, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080402', 'Cusco', 'Calca', 'Coya', 71.4300, -71.9011, -13.3867, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080403', 'Cusco', 'Calca', 'Lamay', 94.2200, -71.9228, -13.3642, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080404', 'Cusco', 'Calca', 'Lares', 527.2600, -72.0472, -13.1058, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080405', 'Cusco', 'Calca', 'Pisac', 148.2500, -71.8500, -13.4217, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080406', 'Cusco', 'Calca', 'San Salvador', 128.0700, -71.7800, -13.4936, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080407', 'Cusco', 'Calca', 'Taray', 53.7800, -71.8689, -13.4278, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080408', 'Cusco', 'Calca', 'Yanatile', 3080.4700, -72.2322, -12.7008, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080501', 'Cusco', 'Canas', 'Yanaoca', 292.9700, -71.4317, -14.2200, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080502', 'Cusco', 'Canas', 'Checca', 503.7600, -71.3964, -14.4733, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080503', 'Cusco', 'Canas', 'Kunturkanki', 376.1900, -71.3064, -14.5331, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080504', 'Cusco', 'Canas', 'Langui', 187.1000, -71.2744, -14.4317, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080505', 'Cusco', 'Canas', 'Layo', 452.5600, -71.1556, -14.4942, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080506', 'Cusco', 'Canas', 'Pampamarca', 29.9100, -71.4603, -14.1453, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080507', 'Cusco', 'Canas', 'Quehue', 143.4600, -71.4550, -14.3800, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080508', 'Cusco', 'Canas', 'Tupac Amaru', 117.8100, -71.4794, -14.1650, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080601', 'Cusco', 'Canchis', 'Sicuani', 645.8800, -71.2289, -14.2711, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080602', 'Cusco', 'Canchis', 'Checacupe', 962.3400, -71.4533, -14.0267, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080603', 'Cusco', 'Canchis', 'Combapata', 182.5000, -71.4308, -14.1008, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080604', 'Cusco', 'Canchis', 'Marangani', 432.6500, -71.1683, -14.3564, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080605', 'Cusco', 'Canchis', 'Pitumarca', 1117.5400, -71.4147, -13.9778, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080606', 'Cusco', 'Canchis', 'San Pablo', 524.0600, -71.3178, -14.2033, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080607', 'Cusco', 'Canchis', 'San Pedro', 54.9100, -71.3422, -14.1867, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080608', 'Cusco', 'Canchis', 'Tinta', 79.3900, -71.4067, -14.1447, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080701', 'Cusco', 'Chumbivilcas', 'Santo Tomas', 1924.0800, -72.0833, -14.4503, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080702', 'Cusco', 'Chumbivilcas', 'Capacmarca', 271.8100, -72.0008, -14.0078, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080703', 'Cusco', 'Chumbivilcas', 'Chamaca', 674.1900, -71.8550, -14.3028, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080704', 'Cusco', 'Chumbivilcas', 'Colquemarca', 449.4900, -72.0411, -14.2839, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080705', 'Cusco', 'Chumbivilcas', 'Livitaca', 758.2000, -71.6892, -14.3131, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080706', 'Cusco', 'Chumbivilcas', 'Llusco', 315.4200, -72.1144, -14.3383, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080707', 'Cusco', 'Chumbivilcas', 'Quiñota', 221.0500, -72.1389, -14.3114, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080708', 'Cusco', 'Chumbivilcas', 'Velille', 756.8400, -71.8864, -14.5106, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080801', 'Cusco', 'Espinar', 'Espinar', 747.7800, -71.4133, -14.7931, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080802', 'Cusco', 'Espinar', 'Condoroma', 513.3600, -71.1319, -15.3075, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080803', 'Cusco', 'Espinar', 'Coporaque', 1564.4600, -71.5311, -14.7972, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080804', 'Cusco', 'Espinar', 'Ocoruro', 353.1500, -71.1292, -15.0522, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080805', 'Cusco', 'Espinar', 'Pallpata', 815.5600, -71.2103, -14.8894, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080806', 'Cusco', 'Espinar', 'Pichigua', 288.7600, -71.4100, -14.6786, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080807', 'Cusco', 'Espinar', 'Suyckutambo', 652.1300, -71.6397, -15.0025, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080808', 'Cusco', 'Espinar', 'Alto Pichigua', 375.8900, -71.2542, -14.7789, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080901', 'Cusco', 'La Convencion', 'Santa Ana', 359.4000, -72.6936, -12.8650, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080902', 'Cusco', 'La Convencion', 'Echarate', 19135.5000, -72.5936, -12.7675, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080903', 'Cusco', 'La Convencion', 'Huayopata', 524.0200, -72.5569, -13.0075, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080904', 'Cusco', 'La Convencion', 'Maranura', 150.3000, -72.6653, -12.9619, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080905', 'Cusco', 'La Convencion', 'Ocobamba', 840.9300, -72.4489, -12.8706, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080906', 'Cusco', 'La Convencion', 'Quellouno', 799.6800, -72.5517, -12.6325, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080907', 'Cusco', 'La Convencion', 'Kimbiri', 905.6900, -73.7811, -12.6097, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080908', 'Cusco', 'La Convencion', 'Santa Teresa', 1340.3800, -72.5986, -13.1297, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080909', 'Cusco', 'La Convencion', 'Vilcabamba', 3318.8600, -72.9436, -13.0514, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080910', 'Cusco', 'La Convencion', 'Pichari', 730.4500, -73.8269, -12.5158, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080911', 'Cusco', 'La Convencion', 'Inkawasi', 1101.6500, -72.5182, -13.0035, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080912', 'Cusco', 'La Convencion', 'Villa Virgen', 625.9600, -73.5167, -13.0031, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080913', 'Cusco', 'La Convencion', 'Villa Kintiarina', 229.0000, -73.5306, -12.9186, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A080914', 'Cusco', 'La Convencion', 'Megantoni', 10708.1600, -72.8594, -11.8047, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081001', 'Cusco', 'Paruro', 'Paruro', 153.4200, -71.8478, -13.7617, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081002', 'Cusco', 'Paruro', 'Accha', 244.7500, -71.8322, -13.9681, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081003', 'Cusco', 'Paruro', 'Ccapi', 334.8500, -72.0803, -13.8533, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081004', 'Cusco', 'Paruro', 'Colcha', 139.9800, -71.8028, -13.8511, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081005', 'Cusco', 'Paruro', 'Huanoquite', 362.6700, -72.0147, -13.6828, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081006', 'Cusco', 'Paruro', 'Omacha', 436.2100, -71.7386, -14.0706, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081007', 'Cusco', 'Paruro', 'Paccaritambo', 142.6100, -71.9564, -13.7558, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081008', 'Cusco', 'Paruro', 'Pillpinto', 79.1300, -71.7619, -13.9531, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081009', 'Cusco', 'Paruro', 'Yaurisque', 90.8000, -71.9214, -13.6639, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081101', 'Cusco', 'Paucartambo', 'Paucartambo', 1079.2300, -71.5997, -13.3189, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081102', 'Cusco', 'Paucartambo', 'Caicay', 110.7200, -71.6961, -13.5969, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081103', 'Cusco', 'Paucartambo', 'Challabamba', 746.5600, -71.6531, -13.2114, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081104', 'Cusco', 'Paucartambo', 'Colquepata', 467.6800, -71.6731, -13.3594, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081105', 'Cusco', 'Paucartambo', 'Huancarani', 145.1400, -71.6539, -13.5033, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081106', 'Cusco', 'Paucartambo', 'Kosñipata', 3745.6800, -71.4225, -13.0025, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081201', 'Cusco', 'Quispicanchi', 'Urcos', 134.6500, -71.6258, -13.6883, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081202', 'Cusco', 'Quispicanchi', 'Andahuaylillas', 84.6000, -71.6767, -13.6733, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081203', 'Cusco', 'Quispicanchi', 'Camanti', 3174.9300, -70.7478, -13.1936, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081204', 'Cusco', 'Quispicanchi', 'Ccarhuayo', 313.8900, -71.3994, -13.5947, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081205', 'Cusco', 'Quispicanchi', 'Ccatca', 307.7200, -71.5619, -13.6053, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081206', 'Cusco', 'Quispicanchi', 'Cusipata', 248.0300, -71.5000, -13.9083, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081207', 'Cusco', 'Quispicanchi', 'Huaro', 106.2800, -71.6406, -13.6903, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081208', 'Cusco', 'Quispicanchi', 'Lucre', 118.7800, -71.7378, -13.6356, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081209', 'Cusco', 'Quispicanchi', 'Marcapata', 1687.9100, -70.9458, -13.5150, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081210', 'Cusco', 'Quispicanchi', 'Ocongate', 952.6600, -71.3864, -13.6286, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081211', 'Cusco', 'Quispicanchi', 'Oropesa', 74.4400, -71.7642, -13.5958, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081212', 'Cusco', 'Quispicanchi', 'Quiquijana', 360.9000, -71.5317, -13.8222, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081301', 'Cusco', 'Urubamba', 'Urubamba', 128.2800, -72.1161, -13.3061, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081302', 'Cusco', 'Urubamba', 'Chinchero', 94.5700, -72.0472, -13.3933, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081303', 'Cusco', 'Urubamba', 'Huayllabamba', 102.4700, -72.0644, -13.3386, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081304', 'Cusco', 'Urubamba', 'Machupicchu', 271.4400, -72.5242, -13.1533, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081305', 'Cusco', 'Urubamba', 'Maras', 131.8500, -72.1572, -13.3367, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081306', 'Cusco', 'Urubamba', 'Ollantaytambo', 640.2500, -72.2631, -13.2581, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A081307', 'Cusco', 'Urubamba', 'Yucay', 70.5700, -72.0861, -13.3194, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090101', 'Huancavelica', 'Huancavelica', 'Huancavelica', 514.1000, -74.9756, -12.7869, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090102', 'Huancavelica', 'Huancavelica', 'Acobambilla', 758.3200, -75.3239, -12.6675, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090103', 'Huancavelica', 'Huancavelica', 'Acoria', 535.1000, -74.8664, -12.6433, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090104', 'Huancavelica', 'Huancavelica', 'Conayca', 37.7900, -75.0078, -12.5194, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090105', 'Huancavelica', 'Huancavelica', 'Cuenca', 50.2500, -75.0394, -12.4344, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090106', 'Huancavelica', 'Huancavelica', 'Huachocolpa', 336.2800, -74.9497, -13.0319, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090107', 'Huancavelica', 'Huancavelica', 'Huayllahuara', 38.8000, -75.1797, -12.4072, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090108', 'Huancavelica', 'Huancavelica', 'Izcuchaca', 12.1900, -74.9961, -12.5011, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090109', 'Huancavelica', 'Huancavelica', 'Laria', 78.4500, -75.0372, -12.5611, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090110', 'Huancavelica', 'Huancavelica', 'Manta', 154.1400, -75.2122, -12.6217, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090111', 'Huancavelica', 'Huancavelica', 'Mariscal Caceres', 5.6300, -74.9336, -12.5356, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090112', 'Huancavelica', 'Huancavelica', 'Moya', 94.0800, -75.1539, -12.4231, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090113', 'Huancavelica', 'Huancavelica', 'Nuevo Occoro', 211.5600, -75.0200, -12.5950, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090114', 'Huancavelica', 'Huancavelica', 'Palca', 82.0800, -74.9833, -12.6589, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090115', 'Huancavelica', 'Huancavelica', 'Pilchaca', 42.9700, -75.0839, -12.4019, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090116', 'Huancavelica', 'Huancavelica', 'Vilca', 317.7600, -75.1867, -12.4786, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090117', 'Huancavelica', 'Huancavelica', 'Yauli', 319.9200, -74.8506, -12.7731, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090118', 'Huancavelica', 'Huancavelica', 'Ascension', 432.2400, -74.9806, -12.7842, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090119', 'Huancavelica', 'Huancavelica', 'Huando', 193.9000, -74.9469, -12.5653, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090201', 'Huancavelica', 'Acobamba', 'Acobamba', 123.0200, -74.5692, -12.8406, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090202', 'Huancavelica', 'Acobamba', 'Andabamba', 81.8500, -74.6242, -12.6953, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090203', 'Huancavelica', 'Acobamba', 'Anta', 91.3600, -74.6364, -12.8139, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090204', 'Huancavelica', 'Acobamba', 'Caja', 82.3900, -74.4650, -12.9183, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090205', 'Huancavelica', 'Acobamba', 'Marcas', 155.8700, -74.3994, -12.8894, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090206', 'Huancavelica', 'Acobamba', 'Paucara', 225.6000, -74.6694, -12.7303, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090207', 'Huancavelica', 'Acobamba', 'Pomacocha', 53.6600, -74.5306, -12.8733, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090208', 'Huancavelica', 'Acobamba', 'Rosario', 97.0700, -74.5811, -12.7214, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090301', 'Huancavelica', 'Angaraes', 'Lircay', 818.8400, -74.7203, -12.9842, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090302', 'Huancavelica', 'Angaraes', 'Anchonga', 72.4000, -74.6922, -12.9122, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090303', 'Huancavelica', 'Angaraes', 'Callanmarca', 26.0200, -74.6228, -12.8678, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090304', 'Huancavelica', 'Angaraes', 'Ccochaccasa', 116.6000, -74.7697, -12.9311, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090305', 'Huancavelica', 'Angaraes', 'Chincho', 182.7000, -74.3689, -12.9783, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090306', 'Huancavelica', 'Angaraes', 'Congalla', 215.6400, -74.4928, -12.9564, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090307', 'Huancavelica', 'Angaraes', 'Huanca-Huanca', 109.9600, -74.6106, -12.9172, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090308', 'Huancavelica', 'Angaraes', 'Huayllay Grande', 33.2800, -74.7011, -12.9417, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090309', 'Huancavelica', 'Angaraes', 'Julcamarca', 48.6100, -74.4453, -13.0150, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090310', 'Huancavelica', 'Angaraes', 'San Antonio de Antaparco', 33.4200, -74.4119, -13.0775, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090311', 'Huancavelica', 'Angaraes', 'Santo Tomas de Pata', 133.5700, -74.4233, -13.1136, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090312', 'Huancavelica', 'Angaraes', 'Secclla', 167.9900, -74.4833, -13.0533, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090401', 'Huancavelica', 'Castrovirreyna', 'Castrovirreyna', 937.9400, -75.3175, -13.2825, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090402', 'Huancavelica', 'Castrovirreyna', 'Arma', 304.8500, -75.5419, -13.1256, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090403', 'Huancavelica', 'Castrovirreyna', 'Aurahua', 360.9700, -75.5708, -13.0350, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090404', 'Huancavelica', 'Castrovirreyna', 'Capillas', 397.9500, -75.5425, -13.2931, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090405', 'Huancavelica', 'Castrovirreyna', 'Chupamarca', 373.7800, -75.6097, -13.0383, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090406', 'Huancavelica', 'Castrovirreyna', 'Cocas', 87.9500, -75.3733, -13.2758, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090407', 'Huancavelica', 'Castrovirreyna', 'Huachos', 172.0100, -75.5328, -13.2200, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090408', 'Huancavelica', 'Castrovirreyna', 'Huamatambo', 54.1600, -75.6806, -13.0961, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090409', 'Huancavelica', 'Castrovirreyna', 'Mollepampa', 165.6500, -75.4092, -13.3100, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090410', 'Huancavelica', 'Castrovirreyna', 'San Juan', 207.2500, -75.6342, -13.2039, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090411', 'Huancavelica', 'Castrovirreyna', 'Santa Ana', 622.1000, -75.1403, -13.0719, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090412', 'Huancavelica', 'Castrovirreyna', 'Tantara', 113.0100, -75.6475, -13.0756, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090413', 'Huancavelica', 'Castrovirreyna', 'Ticrapo', 187.0000, -75.4319, -13.3844, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090501', 'Huancavelica', 'Churcampa', 'Churcampa', 135.4800, -74.3869, -12.7403, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090502', 'Huancavelica', 'Churcampa', 'Anco', 150.1800, -74.5872, -12.6864, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090503', 'Huancavelica', 'Churcampa', 'Chinchihuasi', 162.2100, -74.5458, -12.5172, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090504', 'Huancavelica', 'Churcampa', 'El Carmen', 77.0700, -74.4792, -12.7347, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090505', 'Huancavelica', 'Churcampa', 'La Merced', 73.3200, -74.3633, -12.7900, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090506', 'Huancavelica', 'Churcampa', 'Locroja', 92.4800, -74.4419, -12.7389, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090507', 'Huancavelica', 'Churcampa', 'Paucarbamba', 97.7200, -74.5314, -12.5542, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090508', 'Huancavelica', 'Churcampa', 'San Miguel de Mayocc', 38.4300, -74.3922, -12.8050, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090509', 'Huancavelica', 'Churcampa', 'San Pedro de Coris', 128.9000, -74.4103, -12.5786, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090510', 'Huancavelica', 'Churcampa', 'Pachamarca', 156.2900, -74.5261, -12.5161, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090511', 'Huancavelica', 'Churcampa', 'Cosme', 106.3400, -74.6581, -12.5731, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090601', 'Huancavelica', 'Huaytara', 'Huaytara', 401.2500, -75.3525, -13.6050, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090602', 'Huancavelica', 'Huaytara', 'Ayavi', 201.2600, -75.3539, -13.7031, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090603', 'Huancavelica', 'Huaytara', 'Cordova', 104.5900, -75.1833, -14.0400, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090604', 'Huancavelica', 'Huaytara', 'Huayacundo Arma', 12.8100, -75.3111, -13.5339, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090605', 'Huancavelica', 'Huaytara', 'Laramarca', 205.0500, -75.0375, -13.9494, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090606', 'Huancavelica', 'Huaytara', 'Ocoyo', 154.7100, -75.0225, -14.0086, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090607', 'Huancavelica', 'Huaytara', 'Pilpichaca', 2162.9200, -75.0017, -13.3278, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090608', 'Huancavelica', 'Huaytara', 'Querco', 697.3100, -74.9764, -13.9803, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090609', 'Huancavelica', 'Huaytara', 'Quito-Arma', 222.3200, -75.3294, -13.5289, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090610', 'Huancavelica', 'Huaytara', 'San Antonio de Cusicancha', 255.8600, -75.2944, -13.5003, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090611', 'Huancavelica', 'Huaytara', 'San Francisco de Sangayaico', 70.7000, -75.2500, -13.7956, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090612', 'Huancavelica', 'Huaytara', 'San Isidro', 174.9500, -75.2400, -13.9569, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090613', 'Huancavelica', 'Huaytara', 'Santiago de Chocorvos', 1150.2000, -75.2578, -13.8272, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090614', 'Huancavelica', 'Huaytara', 'Santiago de Quirahuara', 169.3200, -74.9783, -14.0547, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090615', 'Huancavelica', 'Huaytara', 'Santo Domingo de Capillas', 248.5600, -75.2450, -13.7356, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090616', 'Huancavelica', 'Huaytara', 'Tambo', 226.5800, -75.2758, -13.6894, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090701', 'Huancavelica', 'Tayacaja', 'Pampas', 109.0700, -74.8672, -12.3956, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090702', 'Huancavelica', 'Tayacaja', 'Acostambo', 168.0600, -75.0572, -12.3653, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090703', 'Huancavelica', 'Tayacaja', 'Acraquia', 110.2700, -74.9031, -12.4097, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090704', 'Huancavelica', 'Tayacaja', 'Ahuaycha', 90.9600, -74.8919, -12.4081, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090705', 'Huancavelica', 'Tayacaja', 'Colcabamba', 312.1800, -74.6814, -12.4114, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090706', 'Huancavelica', 'Tayacaja', 'Daniel Hernandez', 106.9200, -74.8625, -12.3936, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090707', 'Huancavelica', 'Tayacaja', 'Huachocolpa', 292.0000, -74.5953, -12.0486, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090709', 'Huancavelica', 'Tayacaja', 'Huaribamba', 150.6900, -74.9406, -12.2794, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090710', 'Huancavelica', 'Tayacaja', 'Ñahuimpuquio', 67.3900, -75.0708, -12.3322, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090711', 'Huancavelica', 'Tayacaja', 'Pazos', 227.8600, -75.0700, -12.2589, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090713', 'Huancavelica', 'Tayacaja', 'Quishuar', 31.5400, -74.7792, -12.2408, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090714', 'Huancavelica', 'Tayacaja', 'Salcabamba', 192.5200, -74.7825, -12.2011, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090715', 'Huancavelica', 'Tayacaja', 'Salcahuasi', 117.9800, -74.7508, -12.1031, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090716', 'Huancavelica', 'Tayacaja', 'San Marcos de Rocchac', 281.7100, -74.8656, -12.0939, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090717', 'Huancavelica', 'Tayacaja', 'Surcubamba', 271.7500, -74.6300, -12.1169, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090718', 'Huancavelica', 'Tayacaja', 'Tintay Puncu', 257.7300, -74.5456, -12.1531, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090719', 'Huancavelica', 'Tayacaja', 'Quichuas', 114.1600, -74.7847, -12.4681, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090720', 'Huancavelica', 'Tayacaja', 'Andaymarca', 144.9400, -74.6364, -12.3147, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090721', 'Huancavelica', 'Tayacaja', 'Roble', 186.0300, -74.4900, -12.2169, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090722', 'Huancavelica', 'Tayacaja', 'Pichos', 144.6000, -74.9444, -12.2347, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A090723', 'Huancavelica', 'Tayacaja', 'Santiago de Túcuma', 34.0200, -74.9169, -12.3122, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100101', 'Huanuco', 'Huanuco', 'Huanuco', 126.2300, -76.2403, -9.9269, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100102', 'Huanuco', 'Huanuco', 'Amarilis', 131.6800, -76.2417, -9.9456, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100103', 'Huanuco', 'Huanuco', 'Chinchao', 795.7800, -76.0689, -9.8019, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100104', 'Huanuco', 'Huanuco', 'Churubamba', 507.3100, -76.1375, -9.8258, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100105', 'Huanuco', 'Huanuco', 'Margos', 206.5700, -76.5214, -10.0061, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100106', 'Huanuco', 'Huanuco', 'Quisqui', 172.7400, -76.3561, -9.9231, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100107', 'Huanuco', 'Huanuco', 'San Francisco de Cayran', 146.2400, -76.2847, -9.9822, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100108', 'Huanuco', 'Huanuco', 'San Pedro de Chaulan', 266.3600, -76.4822, -10.0581, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100109', 'Huanuco', 'Huanuco', 'Santa Maria del Valle', 446.6300, -76.1703, -9.8628, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100110', 'Huanuco', 'Huanuco', 'Yarumayo', 60.9400, -76.4683, -10.0022, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100111', 'Huanuco', 'Huanuco', 'Pillco Marca', 76.6100, -76.2492, -9.9578, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100112', 'Huanuco', 'Huanuco', 'Yacus', 69.9000, -76.5044, -9.9858, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100113', 'Huanuco', 'Huanuco', 'San Pablo de Pillao', 584.6000, -75.9986, -9.7894, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100201', 'Huanuco', 'Ambo', 'Ambo', 288.8000, -76.2047, -10.1294, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100202', 'Huanuco', 'Ambo', 'Cayna', 166.0500, -76.3872, -10.2717, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100203', 'Huanuco', 'Ambo', 'Colpas', 174.3400, -76.4144, -10.2672, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100204', 'Huanuco', 'Ambo', 'Conchamarca', 104.8100, -76.2156, -10.0367, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100205', 'Huanuco', 'Ambo', 'Huacar', 234.2300, -76.2356, -10.1614, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100206', 'Huanuco', 'Ambo', 'San Francisco', 121.2100, -76.2914, -10.3419, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100207', 'Huanuco', 'Ambo', 'San Rafael', 443.6300, -76.1828, -10.3403, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100208', 'Huanuco', 'Ambo', 'Tomay Kichwa', 42.1100, -76.2131, -10.0789, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100301', 'Huanuco', 'Dos de Mayo', 'La Union', 167.1000, -76.8003, -9.8278, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100307', 'Huanuco', 'Dos de Mayo', 'Chuquis', 151.2500, -76.7033, -9.6775, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100311', 'Huanuco', 'Dos de Mayo', 'Marias', 637.2400, -76.7050, -9.6061, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100313', 'Huanuco', 'Dos de Mayo', 'Pachas', 264.7400, -76.7722, -9.7061, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100316', 'Huanuco', 'Dos de Mayo', 'Quivilla', 33.6000, -76.7253, -9.5967, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100317', 'Huanuco', 'Dos de Mayo', 'Ripan', 75.0400, -76.8033, -9.8261, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100321', 'Huanuco', 'Dos de Mayo', 'Shunqui', 32.2600, -76.7833, -9.7311, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100322', 'Huanuco', 'Dos de Mayo', 'Sillapata', 70.5300, -76.7742, -9.7581, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100323', 'Huanuco', 'Dos de Mayo', 'Yanas', 36.3100, -76.7489, -9.7144, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100401', 'Huanuco', 'Huacaybamba', 'Huacaybamba', 586.2100, -76.9519, -9.0372, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100402', 'Huanuco', 'Huacaybamba', 'Canchabamba', 186.8300, -77.1228, -8.8836, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100403', 'Huanuco', 'Huacaybamba', 'Cochabamba', 684.8700, -76.8350, -9.0922, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100404', 'Huanuco', 'Huacaybamba', 'Pinra', 283.7100, -77.0125, -8.9239, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100501', 'Huanuco', 'Huamalies', 'Llata', 411.3500, -76.8156, -9.5506, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100502', 'Huanuco', 'Huamalies', 'Arancay', 158.3300, -76.7483, -9.1708, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100503', 'Huanuco', 'Huamalies', 'Chavin de Pariarca', 89.2500, -76.7692, -9.4231, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100504', 'Huanuco', 'Huamalies', 'Jacas Grande', 236.9900, -76.7358, -9.5397, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100505', 'Huanuco', 'Huamalies', 'Jircan', 84.8100, -76.7161, -9.2472, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100506', 'Huanuco', 'Huamalies', 'Miraflores', 96.7400, -76.8189, -9.4928, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100507', 'Huanuco', 'Huamalies', 'Monzon', 1521.3900, -76.3978, -9.2842, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100508', 'Huanuco', 'Huamalies', 'Punchao', 42.2400, -76.8192, -9.4614, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100509', 'Huanuco', 'Huamalies', 'Puños', 101.7500, -76.8850, -9.5000, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100510', 'Huanuco', 'Huamalies', 'Singa', 151.7000, -76.8125, -9.3881, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100511', 'Huanuco', 'Huamalies', 'Tantamayo', 249.9500, -76.7183, -9.3928, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100601', 'Huanuco', 'Leoncio Prado', 'Rupa-Rupa', 266.5200, -75.9969, -9.2944, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100602', 'Huanuco', 'Leoncio Prado', 'Daniel Alomias Robles', 702.4600, -75.9406, -9.1839, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100603', 'Huanuco', 'Leoncio Prado', 'Hermilio Valdizan', 112.2000, -75.8261, -9.1525, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100604', 'Huanuco', 'Leoncio Prado', 'Jose Crespo y Castillo', 2120.6600, -76.1147, -8.9319, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100605', 'Huanuco', 'Leoncio Prado', 'Luyando', 100.3200, -75.9919, -9.2469, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100606', 'Huanuco', 'Leoncio Prado', 'Mariano Damaso Beraun', 766.2700, -75.9661, -9.4164, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100607', 'Huanuco', 'Leoncio Prado', 'Pucayacu', 768.3500, -76.1253, -8.7492, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100608', 'Huanuco', 'Leoncio Prado', 'Castillo Grande', 106.1100, -76.0117, -9.2792, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100609', 'Huanuco', 'Leoncio Prado', 'Pueblo Nuevo', 320.3800, -76.0714, -9.0089, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100610', 'Huanuco', 'Leoncio Prado', 'Santo Domingo de Anda', 283.5400, -76.0714, -9.0089, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100701', 'Huanuco', 'Marañon', 'Huacrachuco', 704.6300, -77.1489, -8.6044, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100702', 'Huanuco', 'Marañon', 'Cholon', 2125.1900, -76.8481, -8.6594, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100703', 'Huanuco', 'Marañon', 'San Buenaventura', 86.5400, -77.1867, -8.7681, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100704', 'Huanuco', 'Marañon', 'La Morada', 878.9400, -76.2497, -8.7933, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100705', 'Huanuco', 'Marañon', 'Santa Rosa de Alto Yanajanca', 1005.9600, -76.3439, -8.6364, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100801', 'Huanuco', 'Pachitea', 'Panao', 1580.8600, -75.9769, -9.8956, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100802', 'Huanuco', 'Pachitea', 'Chaglla', 1103.5800, -75.9064, -9.8281, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100803', 'Huanuco', 'Pachitea', 'Molino', 235.5000, -76.0175, -9.9119, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100804', 'Huanuco', 'Pachitea', 'Umari', 149.0800, -76.0422, -9.8614, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100901', 'Huanuco', 'Puerto Inca', 'Puerto Inca', 2147.1800, -74.9733, -9.3775, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100902', 'Huanuco', 'Puerto Inca', 'Codo del Pozuzo', 3322.0400, -75.4533, -9.6758, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100903', 'Huanuco', 'Puerto Inca', 'Honoria', 798.0500, -74.7089, -8.7694, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100904', 'Huanuco', 'Puerto Inca', 'Tournavista', 2228.4600, -74.7053, -8.9289, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A100905', 'Huanuco', 'Puerto Inca', 'Yuyapichis', 1845.6200, -74.9744, -9.6297, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101001', 'Huanuco', 'Lauricocha', 'Jesus', 449.9000, -76.6303, -10.0803, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101002', 'Huanuco', 'Lauricocha', 'Baños', 152.6600, -76.7356, -10.0769, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101003', 'Huanuco', 'Lauricocha', 'Jivia', 61.3100, -76.6811, -10.0236, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101004', 'Huanuco', 'Lauricocha', 'Queropalca', 131.1500, -76.8042, -10.1811, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101005', 'Huanuco', 'Lauricocha', 'Rondos', 169.4200, -76.6889, -9.9836, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101006', 'Huanuco', 'Lauricocha', 'San Francisco de Asis', 84.3000, -76.6758, -9.9772, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101007', 'Huanuco', 'Lauricocha', 'San Miguel de Cauri', 811.7500, -76.6250, -10.1431, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101101', 'Huanuco', 'Yarowilca', 'Chavinillo', 205.1600, -76.6236, -9.8447, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101102', 'Huanuco', 'Yarowilca', 'Cahuac', 29.5000, -76.6319, -9.8494, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101103', 'Huanuco', 'Yarowilca', 'Chacabamba', 16.5300, -76.6097, -9.9014, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101104', 'Huanuco', 'Yarowilca', 'Aparicio Pomares', 183.1400, -76.6478, -9.7486, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101105', 'Huanuco', 'Yarowilca', 'Jacas Chico', 36.1600, -76.5017, -9.8872, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101106', 'Huanuco', 'Yarowilca', 'Obas', 123.1600, -76.6658, -9.7953, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101107', 'Huanuco', 'Yarowilca', 'Pampamarca', 72.6800, -76.7028, -9.7061, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A101108', 'Huanuco', 'Yarowilca', 'Choras', 61.1400, -76.6036, -9.9108, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110101', 'Ica', 'Ica', 'Ica', 887.5100, -75.7319, -14.0678, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110102', 'Ica', 'Ica', 'La Tinguiña', 98.3400, -75.7092, -14.0350, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110103', 'Ica', 'Ica', 'Los Aquijes', 90.9200, -75.6911, -14.0978, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110104', 'Ica', 'Ica', 'Ocucaje', 1417.1200, -75.6608, -14.3433, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110105', 'Ica', 'Ica', 'Pachacutec', 34.4700, -75.6925, -14.1528, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110106', 'Ica', 'Ica', 'Parcona', 17.3900, -75.7058, -14.0453, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110107', 'Ica', 'Ica', 'Pueblo Nuevo', 33.1200, -75.7031, -14.1275, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110108', 'Ica', 'Ica', 'Salas', 651.7200, -75.7733, -13.9861, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110109', 'Ica', 'Ica', 'San Jose de los Molinos', 363.2000, -75.6669, -13.9283, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110110', 'Ica', 'Ica', 'San Juan Bautista', 26.3900, -75.7372, -14.0114, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110111', 'Ica', 'Ica', 'Santiago', 2783.7300, -75.7142, -14.1922, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110112', 'Ica', 'Ica', 'Subtanjalla', 193.9700, -75.7597, -14.0194, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110113', 'Ica', 'Ica', 'Tate', 7.0700, -75.7092, -14.1528, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110114', 'Ica', 'Ica', 'Yauca del Rosario', 1289.1000, -75.4783, -14.1014, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110201', 'Ica', 'Chincha', 'Chincha Alta', 238.3400, -76.1356, -13.4200, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110202', 'Ica', 'Chincha', 'Alto Laran', 298.8300, -76.1067, -13.4444, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110203', 'Ica', 'Chincha', 'Chavin', 426.1700, -75.9119, -13.0789, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110204', 'Ica', 'Chincha', 'Chincha Baja', 72.5200, -76.1647, -13.4597, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110205', 'Ica', 'Chincha', 'El Carmen', 789.9000, -76.0536, -13.5019, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110206', 'Ica', 'Chincha', 'Grocio Prado', 190.5300, -76.1592, -13.3986, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110207', 'Ica', 'Chincha', 'Pueblo Nuevo', 209.4500, -76.1269, -13.4019, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110208', 'Ica', 'Chincha', 'San Juan de Yanac', 500.4000, -75.7861, -13.2108, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110209', 'Ica', 'Chincha', 'San Pedro de Huacarpana', 222.4500, -75.6483, -13.0492, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110210', 'Ica', 'Chincha', 'Sunampe', 16.7600, -76.1647, -13.4269, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110211', 'Ica', 'Chincha', 'Tambo de Mora', 22.0000, -76.1839, -13.4592, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110301', 'Ica', 'Nazca', 'Nazca', 1252.2500, -74.9361, -14.8328, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110302', 'Ica', 'Nazca', 'Changuillo', 946.9400, -75.2253, -14.6653, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110303', 'Ica', 'Nazca', 'El Ingenio', 552.3900, -75.0600, -14.6464, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110304', 'Ica', 'Nazca', 'Marcona', 1955.2000, -75.1681, -15.3619, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110305', 'Ica', 'Nazca', 'Vista Alegre', 527.3000, -74.9469, -14.8453, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110401', 'Ica', 'Palpa', 'Palpa', 147.4400, -75.1839, -14.5339, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110402', 'Ica', 'Palpa', 'Llipata', 186.1800, -75.2078, -14.5636, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110403', 'Ica', 'Palpa', 'Rio Grande', 315.5200, -75.2006, -14.5194, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110404', 'Ica', 'Palpa', 'Santa Cruz', 255.7000, -75.2639, -14.4914, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110405', 'Ica', 'Palpa', 'Tibillo', 328.0400, -75.1728, -14.0931, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110501', 'Ica', 'Pisco', 'Pisco', 24.5600, -76.2075, -13.7086, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110502', 'Ica', 'Pisco', 'Huancano', 905.1400, -75.6203, -13.5992, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110503', 'Ica', 'Pisco', 'Humay', 1112.9600, -75.8850, -13.7222, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110504', 'Ica', 'Pisco', 'Independencia', 272.3400, -76.0256, -13.6939, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110505', 'Ica', 'Pisco', 'Paracas', 1420.0000, -76.2503, -13.8428, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110506', 'Ica', 'Pisco', 'San Andres', 39.4500, -76.2211, -13.7311, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110507', 'Ica', 'Pisco', 'San Clemente', 127.2200, -76.1592, -13.6839, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A110508', 'Ica', 'Pisco', 'Tupac Amaru Inca', 55.4800, -76.1492, -13.7119, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120101', 'Junin', 'Huancayo', 'Huancayo', 237.5500, -75.2139, -12.0703, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120104', 'Junin', 'Huancayo', 'Carhuacallanga', 13.7800, -75.2033, -12.3544, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120105', 'Junin', 'Huancayo', 'Chacapampa', 120.7200, -75.2472, -12.3444, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120106', 'Junin', 'Huancayo', 'Chicche', 45.9200, -75.2964, -12.2961, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120107', 'Junin', 'Huancayo', 'Chilca', 8.3000, -75.2028, -12.0817, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120108', 'Junin', 'Huancayo', 'Chongos Alto', 701.7500, -75.2925, -12.3128, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120111', 'Junin', 'Huancayo', 'Chupuro', 13.5600, -75.2450, -12.1561, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120112', 'Junin', 'Huancayo', 'Colca', 113.2500, -75.2258, -12.3169, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120113', 'Junin', 'Huancayo', 'Cullhuas', 108.0100, -75.1747, -12.2233, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120114', 'Junin', 'Huancayo', 'El Tambo', 73.5600, -75.2206, -12.0550, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120116', 'Junin', 'Huancayo', 'Huacrapuquio', 24.1000, -75.2236, -12.1725, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120117', 'Junin', 'Huancayo', 'Hualhuas', 24.8200, -75.2536, -11.9692, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120119', 'Junin', 'Huancayo', 'Huancan', 12.0000, -75.2186, -12.1064, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120120', 'Junin', 'Huancayo', 'Huasicancha', 47.6100, -75.2844, -12.3331, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120121', 'Junin', 'Huancayo', 'Huayucachi', 13.1300, -75.2247, -12.1367, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120122', 'Junin', 'Huancayo', 'Ingenio', 53.2900, -75.2686, -11.8903, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120124', 'Junin', 'Huancayo', 'Pariahuanca', 617.5000, -74.8967, -11.9792, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120125', 'Junin', 'Huancayo', 'Pilcomayo', 20.1800, -75.2528, -12.0497, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120126', 'Junin', 'Huancayo', 'Pucara', 110.4900, -75.1475, -12.1719, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120127', 'Junin', 'Huancayo', 'Quichuay', 34.7900, -75.2872, -11.8875, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120128', 'Junin', 'Huancayo', 'Quilcas', 167.9800, -75.2611, -11.9383, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120129', 'Junin', 'Huancayo', 'San Agustin', 23.0900, -75.2481, -11.9914, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120130', 'Junin', 'Huancayo', 'San Jeronimo de Tunan', 20.9900, -75.2856, -11.9483, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120132', 'Junin', 'Huancayo', 'Saño', 11.5900, -75.2606, -11.9550, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120133', 'Junin', 'Huancayo', 'Sapallanga', 119.0200, -75.1597, -12.1403, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120134', 'Junin', 'Huancayo', 'Sicaya', 42.7300, -75.2833, -12.0125, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120135', 'Junin', 'Huancayo', 'Santo Domingo de Acobamba', 778.0200, -74.7953, -11.7689, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120136', 'Junin', 'Huancayo', 'Viques', 3.5700, -75.2342, -12.1603, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120201', 'Junin', 'Concepcion', 'Concepcion', 18.2900, -75.3161, -11.9181, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120202', 'Junin', 'Concepcion', 'Aco', 37.8000, -75.3636, -11.9594, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120203', 'Junin', 'Concepcion', 'Andamarca', 694.9000, -74.8058, -11.7319, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120204', 'Junin', 'Concepcion', 'Chambara', 113.2100, -75.3783, -12.0286, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120205', 'Junin', 'Concepcion', 'Cochas', 165.0500, -75.1033, -11.6597, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120206', 'Junin', 'Concepcion', 'Comas', 825.2900, -75.0839, -11.7183, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120207', 'Junin', 'Concepcion', 'Heroinas Toledo', 25.8300, -75.2911, -11.8353, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120208', 'Junin', 'Concepcion', 'Manzanares', 20.5800, -75.3489, -12.0217, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120209', 'Junin', 'Concepcion', 'Mariscal Castilla', 743.8400, -75.0942, -11.6158, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120210', 'Junin', 'Concepcion', 'Matahuasi', 24.7400, -75.3539, -11.8917, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120211', 'Junin', 'Concepcion', 'Mito', 25.2100, -75.3417, -11.9375, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120212', 'Junin', 'Concepcion', 'Nueve de Julio', 7.2800, -75.3217, -11.9019, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120213', 'Junin', 'Concepcion', 'Orcotuna', 44.6100, -75.3131, -11.9681, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120214', 'Junin', 'Concepcion', 'San Jose de Quero', 314.8000, -75.5383, -12.0856, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120215', 'Junin', 'Concepcion', 'Santa Rosa de Ocopa', 13.9100, -75.2944, -11.8769, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120301', 'Junin', 'Chanchamayo', 'Chanchamayo', 919.7200, -75.3292, -11.0558, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120302', 'Junin', 'Chanchamayo', 'Perene', 1191.1600, -75.2244, -10.9522, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120303', 'Junin', 'Chanchamayo', 'Pichanaqui', 1496.5900, -74.8728, -10.9303, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120304', 'Junin', 'Chanchamayo', 'San Luis de Shuaro', 212.4900, -75.2911, -10.8894, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120305', 'Junin', 'Chanchamayo', 'San Ramon', 591.6700, -75.3528, -11.1214, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120306', 'Junin', 'Chanchamayo', 'Vitoc', 313.8500, -75.3372, -11.2083, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120401', 'Junin', 'Jauja', 'Jauja', 10.1000, -75.4992, -11.7761, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120402', 'Junin', 'Jauja', 'Acolla', 122.4000, -75.5489, -11.7317, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120403', 'Junin', 'Jauja', 'Apata', 421.6200, -75.3569, -11.8558, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120404', 'Junin', 'Jauja', 'Ataura', 5.9000, -75.4411, -11.8022, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120405', 'Junin', 'Jauja', 'Canchayllo', 974.6900, -75.7200, -11.8011, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120406', 'Junin', 'Jauja', 'Curicaca', 64.6800, -75.6781, -11.7842, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120407', 'Junin', 'Jauja', 'El Mantaro', 17.7600, -75.3942, -11.8222, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120408', 'Junin', 'Jauja', 'Huamali', 20.1900, -75.4269, -11.8083, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120409', 'Junin', 'Jauja', 'Huaripampa', 14.1900, -75.4739, -11.8086, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120410', 'Junin', 'Jauja', 'Huertas', 11.8200, -75.4769, -11.7686, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120411', 'Junin', 'Jauja', 'Janjaillo', 31.5700, -75.6275, -11.7658, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120412', 'Junin', 'Jauja', 'Julcan', 24.7800, -75.4392, -11.7608, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120413', 'Junin', 'Jauja', 'Leonor Ordoñez', 20.3400, -75.4169, -11.8633, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120414', 'Junin', 'Jauja', 'Llocllapampa', 110.6000, -75.6261, -11.8189, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120415', 'Junin', 'Jauja', 'Marco', 28.8000, -75.5639, -11.7419, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120416', 'Junin', 'Jauja', 'Masma', 14.2600, -75.4289, -11.7867, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120417', 'Junin', 'Jauja', 'Masma Chicche', 29.8600, -75.3800, -11.7864, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120418', 'Junin', 'Jauja', 'Molinos', 312.1700, -75.4467, -11.7378, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120419', 'Junin', 'Jauja', 'Monobamba', 295.8300, -75.3278, -11.3606, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120420', 'Junin', 'Jauja', 'Muqui', 11.7400, -75.4369, -11.8342, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120421', 'Junin', 'Jauja', 'Muquiyauyo', 19.8600, -75.4581, -11.8147, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120422', 'Junin', 'Jauja', 'Paca', 34.2200, -75.5189, -11.7117, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120423', 'Junin', 'Jauja', 'Paccha', 90.8600, -75.5111, -11.8553, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120424', 'Junin', 'Jauja', 'Pancan', 10.8900, -75.4883, -11.7503, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120425', 'Junin', 'Jauja', 'Parco', 32.8200, -75.5469, -11.8022, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120426', 'Junin', 'Jauja', 'Pomacancha', 281.6100, -75.6264, -11.7381, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120427', 'Junin', 'Jauja', 'Ricran', 319.9500, -75.5289, -11.5411, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120428', 'Junin', 'Jauja', 'San Lorenzo', 22.1500, -75.3842, -11.8472, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120429', 'Junin', 'Jauja', 'San Pedro de Chunan', 8.4400, -75.4894, -11.7247, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120430', 'Junin', 'Jauja', 'Sausa', 4.5000, -75.4872, -11.7939, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120431', 'Junin', 'Jauja', 'Sincos', 236.7400, -75.3903, -11.8917, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120432', 'Junin', 'Jauja', 'Tunan Marca', 30.0700, -75.5731, -11.7269, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120433', 'Junin', 'Jauja', 'Yauli', 93.1500, -75.4725, -11.7117, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120434', 'Junin', 'Jauja', 'Yauyos', 20.5400, -75.4989, -11.7822, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120501', 'Junin', 'Junin', 'Junin', 883.8000, -75.9956, -11.1597, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120502', 'Junin', 'Junin', 'Carhuamayo', 219.6800, -76.0569, -10.9233, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120503', 'Junin', 'Junin', 'Ondores', 254.4600, -76.1486, -11.0878, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120504', 'Junin', 'Junin', 'Ulcumayo', 1129.3700, -75.8778, -10.9689, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120601', 'Junin', 'Satipo', 'Satipo', 732.0200, -74.6372, -11.2531, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120602', 'Junin', 'Satipo', 'Coviriali', 145.1300, -74.6283, -11.2906, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120603', 'Junin', 'Satipo', 'Llaylla', 180.3900, -74.5906, -11.3808, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120604', 'Junin', 'Satipo', 'Mazamari', 2219.6300, -74.7519, -11.4056, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120605', 'Junin', 'Satipo', 'Pampa Hermosa', 566.8200, -74.7519, -11.4056, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120606', 'Junin', 'Satipo', 'Pangoa', 3679.4000, -74.6597, -11.2086, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120607', 'Junin', 'Satipo', 'Rio Negro', 714.9800, -74.3100, -11.1469, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120608', 'Junin', 'Satipo', 'Rio Tambo', 10349.9000, -74.6372, -11.2531, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120609', 'Junin', 'Satipo', 'Vizcatán del Ene', 631.2100, -74.0158, -12.2153, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120701', 'Junin', 'Tarma', 'Tarma', 459.9500, -75.6908, -11.4206, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120702', 'Junin', 'Tarma', 'Acobamba', 97.8400, -75.6592, -11.3528, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120703', 'Junin', 'Tarma', 'Huaricolca', 162.3100, -75.6514, -11.5089, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120704', 'Junin', 'Tarma', 'Huasahuasi', 652.1500, -75.6522, -11.2667, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120705', 'Junin', 'Tarma', 'La Union', 140.4000, -75.7547, -11.3756, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120706', 'Junin', 'Tarma', 'Palca', 378.0800, -75.5681, -11.3469, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120707', 'Junin', 'Tarma', 'Palcamayo', 169.2400, -75.7731, -11.2956, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120708', 'Junin', 'Tarma', 'San Pedro de Cajas', 537.3100, -75.8647, -11.2503, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120709', 'Junin', 'Tarma', 'Tapo', 151.8800, -75.5636, -11.3903, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120801', 'Junin', 'Yauli', 'La Oroya', 388.4200, -75.9014, -11.5206, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120802', 'Junin', 'Yauli', 'Chacapalpa', 183.0600, -75.7556, -11.7328, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120803', 'Junin', 'Yauli', 'Huay-Huay', 179.9400, -75.9042, -11.7219, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120804', 'Junin', 'Yauli', 'Marcapomacocha', 888.5600, -76.3364, -11.4056, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120805', 'Junin', 'Yauli', 'Morococha', 265.6700, -76.1400, -11.5972, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120806', 'Junin', 'Yauli', 'Paccha', 323.6900, -75.9669, -11.4794, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120807', 'Junin', 'Yauli', 'Santa Barbara de Carhuacayan', 646.2900, -76.2883, -11.2008, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120808', 'Junin', 'Yauli', 'Santa Rosa de Sacco', 101.0900, -75.9500, -11.5617, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120809', 'Junin', 'Yauli', 'Suitucancha', 216.4700, -75.9358, -11.7875, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120810', 'Junin', 'Yauli', 'Yauli', 424.1600, -76.0883, -11.6672, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120901', 'Junin', 'Chupaca', 'Chupaca', 21.7000, -75.2897, -12.0625, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120902', 'Junin', 'Chupaca', 'Ahuac', 70.4400, -75.3197, -12.0789, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120903', 'Junin', 'Chupaca', 'Chongos Bajo', 100.9500, -75.2681, -12.1361, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120904', 'Junin', 'Chupaca', 'Huachac', 22.0100, -75.3436, -12.0225, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120905', 'Junin', 'Chupaca', 'Huamancaca Chico', 9.4000, -75.2450, -12.0797, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120906', 'Junin', 'Chupaca', 'San Juan de Yscos', 24.7000, -75.2922, -12.1014, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120907', 'Junin', 'Chupaca', 'San Juan de Jarpa', 137.0200, -75.4400, -12.1239, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120908', 'Junin', 'Chupaca', 'Tres de Diciembre', 14.6600, -75.2547, -12.1108, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A120909', 'Junin', 'Chupaca', 'Yanacancha', 743.4000, -75.3864, -12.2008, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130101', 'La Libertad', 'Trujillo', 'Trujillo', 39.3600, -79.0333, -8.1094, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130102', 'La Libertad', 'Trujillo', 'El Porvenir', 36.7000, -79.0025, -8.0819, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130103', 'La Libertad', 'Trujillo', 'Florencia de Mora', 1.9900, -79.0236, -8.0808, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130104', 'La Libertad', 'Trujillo', 'Huanchaco', 332.1400, -79.1214, -8.0814, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130105', 'La Libertad', 'Trujillo', 'La Esperanza', 15.5500, -79.0453, -8.0781, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130106', 'La Libertad', 'Trujillo', 'Laredo', 335.4400, -78.9611, -8.0911, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130107', 'La Libertad', 'Trujillo', 'Moche', 25.2500, -79.0111, -8.1722, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130108', 'La Libertad', 'Trujillo', 'Poroto', 276.0100, -78.7697, -8.0114, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130109', 'La Libertad', 'Trujillo', 'Salaverry', 295.8800, -78.9781, -8.2231, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130110', 'La Libertad', 'Trujillo', 'Simbal', 390.5500, -78.8147, -7.9767, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130111', 'La Libertad', 'Trujillo', 'Victor Larco Herrera', 18.0200, -79.0558, -8.1439, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130201', 'La Libertad', 'Ascope', 'Ascope', 290.1800, -79.1156, -7.7131, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130202', 'La Libertad', 'Ascope', 'Chicama', 870.5800, -79.1461, -7.8442, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130203', 'La Libertad', 'Ascope', 'Chocope', 95.7300, -79.2225, -7.7914, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130204', 'La Libertad', 'Ascope', 'Magdalena de Cao', 163.0100, -79.2947, -7.8767, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130205', 'La Libertad', 'Ascope', 'Paijan', 79.6900, -79.3019, -7.7319, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130206', 'La Libertad', 'Ascope', 'Razuri', 317.3000, -79.4406, -7.7025, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130207', 'La Libertad', 'Ascope', 'Santiago de Cao', 154.5500, -79.2392, -7.9608, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130208', 'La Libertad', 'Ascope', 'Casa Grande', 687.6000, -79.1869, -7.7442, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130301', 'La Libertad', 'Bolivar', 'Bolivar', 740.5800, -77.7044, -7.1547, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130302', 'La Libertad', 'Bolivar', 'Bambamarca', 165.2000, -77.6947, -7.4414, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130303', 'La Libertad', 'Bolivar', 'Condormarca', 331.2600, -77.5981, -7.5556, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130304', 'La Libertad', 'Bolivar', 'Longotea', 192.8800, -77.8744, -7.0428, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130305', 'La Libertad', 'Bolivar', 'Uchumarca', 190.5300, -77.8078, -7.0481, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130306', 'La Libertad', 'Bolivar', 'Ucuncha', 98.4100, -77.8617, -7.1656, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130401', 'La Libertad', 'Chepen', 'Chepen', 287.3400, -79.4292, -7.2267, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130402', 'La Libertad', 'Chepen', 'Pacanga', 583.9300, -79.4867, -7.1731, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130403', 'La Libertad', 'Chepen', 'Pueblo Nuevo', 271.1600, -79.5142, -7.1883, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130501', 'La Libertad', 'Julcan', 'Julcan', 208.4900, -78.4881, -8.0439, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130502', 'La Libertad', 'Julcan', 'Calamarca', 207.5700, -78.4153, -8.1644, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130503', 'La Libertad', 'Julcan', 'Carabamba', 254.2800, -78.6092, -8.1108, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130504', 'La Libertad', 'Julcan', 'Huaso', 431.0500, -78.4158, -8.2233, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130601', 'La Libertad', 'Otuzco', 'Otuzco', 444.1300, -78.5669, -7.9022, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130602', 'La Libertad', 'Otuzco', 'Agallpampa', 258.5600, -78.5481, -7.9853, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130604', 'La Libertad', 'Otuzco', 'Charat', 68.8900, -78.4506, -7.8247, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130605', 'La Libertad', 'Otuzco', 'Huaranchal', 149.6500, -78.4444, -7.6908, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130606', 'La Libertad', 'Otuzco', 'La Cuesta', 39.2500, -78.7081, -7.9189, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130608', 'La Libertad', 'Otuzco', 'Mache', 37.3200, -78.5367, -8.0303, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130610', 'La Libertad', 'Otuzco', 'Paranday', 21.4600, -78.7119, -7.8847, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130611', 'La Libertad', 'Otuzco', 'Salpo', 192.7400, -78.6064, -8.0053, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130613', 'La Libertad', 'Otuzco', 'Sinsicap', 452.9500, -78.7561, -7.8517, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130614', 'La Libertad', 'Otuzco', 'Usquil', 445.8200, -78.4192, -7.8156, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130701', 'La Libertad', 'Pacasmayo', 'San Pedro de Lloc', 697.0100, -79.5036, -7.4278, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130702', 'La Libertad', 'Pacasmayo', 'Guadalupe', 165.3700, -79.4717, -7.2428, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130703', 'La Libertad', 'Pacasmayo', 'Jequetepeque', 50.9800, -79.5628, -7.3369, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130704', 'La Libertad', 'Pacasmayo', 'Pacasmayo', 30.8400, -79.5686, -7.4006, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130705', 'La Libertad', 'Pacasmayo', 'San Jose', 181.0600, -79.4569, -7.3494, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130801', 'La Libertad', 'Pataz', 'Tayabamba', 339.1300, -77.2986, -8.2769, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130802', 'La Libertad', 'Pataz', 'Buldibuyo', 227.3900, -77.3981, -8.1281, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130803', 'La Libertad', 'Pataz', 'Chillia', 300.0400, -77.5169, -8.1258, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130804', 'La Libertad', 'Pataz', 'Huancaspata', 247.4800, -77.3011, -8.4575, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130805', 'La Libertad', 'Pataz', 'Huaylillas', 89.7300, -77.3447, -8.1867, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130806', 'La Libertad', 'Pataz', 'Huayo', 124.6300, -77.5936, -8.0053, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130807', 'La Libertad', 'Pataz', 'Ongon', 1394.8900, -76.9664, -8.1689, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130808', 'La Libertad', 'Pataz', 'Parcoy', 304.9900, -77.4817, -8.0350, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130809', 'La Libertad', 'Pataz', 'Pataz', 467.4400, -77.5942, -7.7856, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130810', 'La Libertad', 'Pataz', 'Pias', 371.6700, -77.5494, -7.8728, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130811', 'La Libertad', 'Pataz', 'Santiago de Challas', 129.4400, -77.3239, -8.4389, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130812', 'La Libertad', 'Pataz', 'Taurija', 130.0900, -77.4250, -8.3083, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130813', 'La Libertad', 'Pataz', 'Urpay', 99.6100, -77.3917, -8.3478, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130901', 'La Libertad', 'Sanchez Carrion', 'Huamachuco', 424.1300, -78.0525, -7.8153, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130902', 'La Libertad', 'Sanchez Carrion', 'Chugay', 416.3100, -77.8694, -7.7825, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130903', 'La Libertad', 'Sanchez Carrion', 'Cochorco', 258.0400, -77.7200, -7.8058, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130904', 'La Libertad', 'Sanchez Carrion', 'Curgos', 99.5000, -77.9431, -7.8592, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130905', 'La Libertad', 'Sanchez Carrion', 'Marcabal', 229.5700, -78.0306, -7.7053, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130906', 'La Libertad', 'Sanchez Carrion', 'Sanagoran', 324.3800, -78.1411, -7.7856, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130907', 'La Libertad', 'Sanchez Carrion', 'Sarin', 340.0800, -77.9044, -7.9122, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A130908', 'La Libertad', 'Sanchez Carrion', 'Sartimbamba', 394.3700, -77.7411, -7.6994, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131001', 'La Libertad', 'Santiago de Chuco', 'Santiago de Chuco', 1073.6300, -78.1753, -8.1456, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131002', 'La Libertad', 'Santiago de Chuco', 'Angasmarca', 153.4500, -78.0547, -8.1331, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131003', 'La Libertad', 'Santiago de Chuco', 'Cachicadan', 266.5000, -78.1467, -8.0917, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131004', 'La Libertad', 'Santiago de Chuco', 'Mollebamba', 69.6900, -77.9764, -8.1706, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131005', 'La Libertad', 'Santiago de Chuco', 'Mollepata', 71.2000, -77.9558, -8.1908, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131006', 'La Libertad', 'Santiago de Chuco', 'Quiruvilca', 549.1400, -78.3108, -8.0025, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131007', 'La Libertad', 'Santiago de Chuco', 'Santa Cruz de Chuca', 165.1200, -78.1411, -8.1194, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131008', 'La Libertad', 'Santiago de Chuco', 'Sitabamba', 310.2300, -77.7314, -8.0231, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131101', 'La Libertad', 'Gran Chimu', 'Cascas', 465.6700, -78.8167, -7.4803, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131102', 'La Libertad', 'Gran Chimu', 'Lucma', 280.3800, -78.5511, -7.6406, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131103', 'La Libertad', 'Gran Chimu', 'Compin', 300.2500, -78.6256, -7.6981, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131104', 'La Libertad', 'Gran Chimu', 'Sayapullo', 238.4700, -78.4681, -7.5964, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131201', 'La Libertad', 'Viru', 'Viru', 1072.9500, -78.7511, -8.4156, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131202', 'La Libertad', 'Viru', 'Chao', 1736.8700, -78.6825, -8.5394, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A131203', 'La Libertad', 'Viru', 'Guadalupito', 404.7200, -78.6258, -8.9519, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140101', 'Lambayeque', 'Chiclayo', 'Chiclayo', 50.3500, -79.8397, -6.7736, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140102', 'Lambayeque', 'Chiclayo', 'Chongoyape', 712.0000, -79.3842, -6.6428, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140103', 'Lambayeque', 'Chiclayo', 'Eten', 84.7800, -79.8644, -6.9072, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140104', 'Lambayeque', 'Chiclayo', 'Eten Puerto', 14.4800, -79.8664, -6.9269, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140105', 'Lambayeque', 'Chiclayo', 'Jose Leonardo Ortiz', 28.2200, -79.8408, -6.7592, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140106', 'Lambayeque', 'Chiclayo', 'La Victoria', 29.3600, -79.8367, -6.7883, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140107', 'Lambayeque', 'Chiclayo', 'Lagunas', 429.2700, -79.6244, -6.9911, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140108', 'Lambayeque', 'Chiclayo', 'Monsefu', 44.9400, -79.8714, -6.8786, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140109', 'Lambayeque', 'Chiclayo', 'Nueva Arica', 208.6300, -79.3386, -6.8731, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140110', 'Lambayeque', 'Chiclayo', 'Oyotun', 455.4000, -79.2981, -6.8458, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140111', 'Lambayeque', 'Chiclayo', 'Picsi', 56.9200, -79.7708, -6.7186, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140112', 'Lambayeque', 'Chiclayo', 'Pimentel', 66.5300, -79.9361, -6.8369, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140113', 'Lambayeque', 'Chiclayo', 'Reque', 47.0300, -79.8181, -6.8644, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140114', 'Lambayeque', 'Chiclayo', 'Santa Rosa', 14.0900, -79.9231, -6.8800, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140115', 'Lambayeque', 'Chiclayo', 'Saña', 313.9000, -79.5839, -6.9233, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140116', 'Lambayeque', 'Chiclayo', 'Cayalti', 162.8600, -79.5617, -6.8917, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140117', 'Lambayeque', 'Chiclayo', 'Patapo', 182.8100, -79.6406, -6.7386, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140118', 'Lambayeque', 'Chiclayo', 'Pomalca', 80.3500, -79.7728, -6.7667, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140119', 'Lambayeque', 'Chiclayo', 'Pucala', 175.8100, -79.6122, -6.7800, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140120', 'Lambayeque', 'Chiclayo', 'Tuman', 130.3400, -79.7017, -6.7478, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140201', 'Lambayeque', 'Ferreñafe', 'Ferreñafe', 62.1800, -79.7911, -6.6394, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140202', 'Lambayeque', 'Ferreñafe', 'Cañaris', 284.8800, -79.2647, -6.0447, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140203', 'Lambayeque', 'Ferreñafe', 'Incahuasi', 443.9100, -79.3150, -6.2372, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140204', 'Lambayeque', 'Ferreñafe', 'Manuel Antonio Mesones Muro', 200.5700, -79.7361, -6.6456, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140205', 'Lambayeque', 'Ferreñafe', 'Pitipo', 558.1800, -79.7808, -6.5664, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140206', 'Lambayeque', 'Ferreñafe', 'Pueblo Nuevo', 28.8800, -79.7947, -6.6367, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140301', 'Lambayeque', 'Lambayeque', 'Lambayeque', 330.7300, -79.9072, -6.7006, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140302', 'Lambayeque', 'Lambayeque', 'Chochope', 79.2700, -79.6469, -6.1586, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140303', 'Lambayeque', 'Lambayeque', 'Illimo', 24.3700, -79.8531, -6.4733, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140304', 'Lambayeque', 'Lambayeque', 'Jayanca', 680.9600, -79.8211, -6.3881, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140305', 'Lambayeque', 'Lambayeque', 'Mochumi', 103.7000, -79.8647, -6.5467, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140306', 'Lambayeque', 'Lambayeque', 'Morrope', 1041.6600, -80.0128, -6.5400, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140307', 'Lambayeque', 'Lambayeque', 'Motupe', 557.3700, -79.7153, -6.1536, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140308', 'Lambayeque', 'Lambayeque', 'Olmos', 5583.4700, -79.7500, -5.9883, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140309', 'Lambayeque', 'Lambayeque', 'Pacora', 87.7900, -79.8400, -6.4275, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140310', 'Lambayeque', 'Lambayeque', 'Salas', 991.8000, -79.6044, -6.2736, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140311', 'Lambayeque', 'Lambayeque', 'San Jose', 46.7300, -79.9686, -6.7703, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A140312', 'Lambayeque', 'Lambayeque', 'Tucume', 67.0000, -79.8594, -6.5097, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150101', 'Lima', 'Lima', 'Lima', 21.9800, -77.0322, -12.0467, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150102', 'Lima', 'Lima', 'Ancon', 285.4500, -77.1703, -11.7764, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150103', 'Lima', 'Lima', 'Ate', 77.7200, -76.9242, -12.0256, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150104', 'Lima', 'Lima', 'Barranco', 3.3300, -77.0247, -12.1494, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150105', 'Lima', 'Lima', 'Breña', 3.2200, -77.0536, -12.0567, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150106', 'Lima', 'Lima', 'Carabayllo', 303.3100, -77.0419, -11.8583, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150107', 'Lima', 'Lima', 'Chaclacayo', 39.5000, -76.7642, -11.9783, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150108', 'Lima', 'Lima', 'Chorrillos', 38.9400, -77.0247, -12.1742, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150109', 'Lima', 'Lima', 'Cieneguilla', 240.3300, -76.8125, -12.1178, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150110', 'Lima', 'Lima', 'Comas', 48.7500, -77.0500, -11.9500, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150111', 'Lima', 'Lima', 'El Agustino', 12.5400, -76.9986, -12.0433, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150112', 'Lima', 'Lima', 'Independencia', 14.5600, -77.0522, -12.0008, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150113', 'Lima', 'Lima', 'Jesus Maria', 4.5700, -77.0450, -12.0697, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150114', 'Lima', 'Lima', 'La Molina', 65.7500, -76.9339, -12.0875, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150115', 'Lima', 'Lima', 'La Victoria', 8.7400, -77.0308, -12.0653, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150116', 'Lima', 'Lima', 'Lince', 3.0300, -77.0306, -12.0811, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150117', 'Lima', 'Lima', 'Los Olivos', 18.2500, -77.0694, -11.9828, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150118', 'Lima', 'Lima', 'Lurigancho', 236.4700, -76.7036, -11.9372, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150119', 'Lima', 'Lima', 'Lurin', 180.2600, -76.8847, -12.2686, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150120', 'Lima', 'Lima', 'Magdalena del Mar', 3.6100, -77.0747, -12.0967, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150121', 'Lima', 'Lima', 'Pueblo Libre', 4.3800, -77.0631, -12.0733, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150122', 'Lima', 'Lima', 'Miraflores', 9.6200, -77.0453, -12.1175, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150123', 'Lima', 'Lima', 'Pachacamac', 160.2300, -76.8597, -12.2286, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150124', 'Lima', 'Lima', 'Pucusana', 37.3900, -76.7964, -12.4825, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150125', 'Lima', 'Lima', 'Puente Piedra', 72.8100, -77.1058, -11.8464, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150126', 'Lima', 'Lima', 'Punta Hermosa', 119.5000, -76.8258, -12.3375, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150127', 'Lima', 'Lima', 'Punta Negra', 130.5000, -76.7947, -12.3661, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150128', 'Lima', 'Lima', 'Rimac', 11.8700, -77.0436, -12.0294, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150129', 'Lima', 'Lima', 'San Bartolo', 45.0100, -76.7806, -12.3883, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150130', 'Lima', 'Lima', 'San Borja', 9.9600, -76.9989, -12.1078, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150131', 'Lima', 'Lima', 'San Isidro', 11.1000, -77.0344, -12.0989, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150132', 'Lima', 'Lima', 'San Juan de Lurigancho', 131.2500, -77.0025, -12.0244, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150133', 'Lima', 'Lima', 'San Juan de Miraflores', 22.9700, -76.9722, -12.1589, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150134', 'Lima', 'Lima', 'San Luis', 3.4900, -76.9975, -12.0728, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150135', 'Lima', 'Lima', 'San Martin de Porres', 36.8200, -77.0469, -12.0303, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150136', 'Lima', 'Lima', 'San Miguel', 10.7200, -77.0864, -12.0900, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150137', 'Lima', 'Lima', 'Santa Anita', 10.6900, -76.9850, -12.0433, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150138', 'Lima', 'Lima', 'Santa Maria del Mar', 9.8100, -76.7758, -12.4092, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150139', 'Lima', 'Lima', 'Santa Rosa', 21.3500, -77.1775, -11.7983, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150140', 'Lima', 'Lima', 'Santiago de Surco', 35.8900, -77.0078, -12.1506, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150141', 'Lima', 'Lima', 'Surquillo', 3.4600, -77.0081, -12.1136, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150142', 'Lima', 'Lima', 'Villa El Salvador', 35.4600, -76.9433, -12.2164, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150143', 'Lima', 'Lima', 'Villa Maria del Triunfo', 70.5700, -76.9528, -12.1572, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150201', 'Lima', 'Barranca', 'Barranca', 158.8200, -77.7603, -10.7564, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150202', 'Lima', 'Barranca', 'Paramonga', 408.5900, -77.8197, -10.6742, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150203', 'Lima', 'Barranca', 'Pativilca', 278.6400, -77.7792, -10.6961, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150204', 'Lima', 'Barranca', 'Supe', 512.9200, -77.7133, -10.7992, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150205', 'Lima', 'Barranca', 'Supe Puerto', 11.5100, -77.7447, -10.8003, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150301', 'Lima', 'Cajatambo', 'Cajatambo', 567.9600, -76.9939, -10.4722, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150302', 'Lima', 'Cajatambo', 'Copa', 212.1600, -77.0789, -10.3856, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150303', 'Lima', 'Cajatambo', 'Gorgor', 309.9500, -77.0389, -10.6214, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150304', 'Lima', 'Cajatambo', 'Huancapon', 146.1000, -77.1128, -10.5483, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150305', 'Lima', 'Cajatambo', 'Manas', 279.0400, -77.1669, -10.5953, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150401', 'Lima', 'Canta', 'Canta', 123.0900, -76.6231, -11.4675, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150402', 'Lima', 'Canta', 'Arahuay', 134.2900, -76.6731, -11.6222, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150403', 'Lima', 'Canta', 'Huamantanga', 488.0900, -76.7489, -11.4997, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150404', 'Lima', 'Canta', 'Huaros', 333.4500, -76.5761, -11.4058, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150405', 'Lima', 'Canta', 'Lachaqui', 137.8700, -76.6244, -11.5567, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150406', 'Lima', 'Canta', 'San Buenaventura', 106.2600, -76.6631, -11.4897, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150407', 'Lima', 'Canta', 'Santa Rosa de Quives', 408.1100, -76.8444, -11.6928, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150501', 'Lima', 'Cañete', 'San Vicente de Cañete', 513.1500, -76.3883, -13.0825, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150502', 'Lima', 'Cañete', 'Asia', 277.3600, -76.5572, -12.7789, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150503', 'Lima', 'Cañete', 'Calango', 530.8900, -76.5433, -12.5256, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150504', 'Lima', 'Cañete', 'Cerro Azul', 105.0800, -76.4794, -13.0267, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150505', 'Lima', 'Cañete', 'Chilca', 475.4700, -76.7361, -12.5172, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150506', 'Lima', 'Cañete', 'Coayllo', 590.9900, -76.4606, -12.7258, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150507', 'Lima', 'Cañete', 'Imperial', 53.1600, -76.3500, -13.0608, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150508', 'Lima', 'Cañete', 'Lunahuana', 500.3300, -76.1392, -12.9597, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150509', 'Lima', 'Cañete', 'Mala', 129.3100, -76.6300, -12.6553, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150510', 'Lima', 'Cañete', 'Nuevo Imperial', 329.3000, -76.3158, -13.0742, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150511', 'Lima', 'Cañete', 'Pacaran', 258.7200, -76.0519, -12.8636, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150512', 'Lima', 'Cañete', 'Quilmana', 437.4000, -76.3828, -12.9500, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150513', 'Lima', 'Cañete', 'San Antonio', 37.1500, -76.6500, -12.6431, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150514', 'Lima', 'Cañete', 'San Luis', 38.5300, -76.4294, -13.0508, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150515', 'Lima', 'Cañete', 'Santa Cruz de Flores', 100.0600, -76.6397, -12.6194, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150516', 'Lima', 'Cañete', 'Zuñiga', 198.0100, -76.0225, -12.8581, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150601', 'Lima', 'Huaral', 'Huaral', 640.7600, -77.2053, -11.4914, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150602', 'Lima', 'Huaral', 'Atavillos Alto', 347.6900, -76.6561, -11.2331, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150603', 'Lima', 'Huaral', 'Atavillos Bajo', 164.8900, -76.8231, -11.3533, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150604', 'Lima', 'Huaral', 'Aucallama', 729.4100, -77.1744, -11.5592, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150605', 'Lima', 'Huaral', 'Chancay', 150.1100, -77.2658, -11.5669, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150606', 'Lima', 'Huaral', 'Ihuari', 467.6700, -76.9519, -11.1889, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150607', 'Lima', 'Huaral', 'Lampian', 144.9700, -76.8386, -11.2369, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150608', 'Lima', 'Huaral', 'Pacaraos', 294.0400, -76.6464, -11.1833, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150609', 'Lima', 'Huaral', 'San Miguel de Acos', 48.1600, -76.8214, -11.2736, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150610', 'Lima', 'Huaral', 'Santa Cruz de Andamarca', 216.9200, -76.6336, -11.1947, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150611', 'Lima', 'Huaral', 'Sumbilca', 259.3800, -76.8194, -11.4072, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150612', 'Lima', 'Huaral', 'Veintisiete de Noviembre', 204.2700, -76.7786, -11.1919, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150701', 'Lima', 'Huarochiri', 'Matucana', 179.4400, -76.3878, -11.8458, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150702', 'Lima', 'Huarochiri', 'Antioquia', 387.9800, -76.5133, -12.0814, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150703', 'Lima', 'Huarochiri', 'Callahuanca', 57.4700, -76.6203, -11.8275, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150704', 'Lima', 'Huarochiri', 'Carampoma', 234.2100, -76.5181, -11.6561, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150705', 'Lima', 'Huarochiri', 'Chicla', 244.1000, -76.2711, -11.7078, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150706', 'Lima', 'Huarochiri', 'Cuenca', 60.0200, -76.4378, -12.1336, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150707', 'Lima', 'Huarochiri', 'Huachupampa', 76.0200, -76.5900, -11.7228, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150708', 'Lima', 'Huarochiri', 'Huanza', 227.0100, -76.5069, -11.6561, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150709', 'Lima', 'Huarochiri', 'Huarochiri', 249.0900, -76.2344, -12.1381, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150710', 'Lima', 'Huarochiri', 'Lahuaytambo', 81.8800, -76.3911, -12.0969, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150711', 'Lima', 'Huarochiri', 'Langa', 80.9900, -76.4233, -12.1253, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150712', 'Lima', 'Huarochiri', 'Laraos', 104.5100, -76.5422, -11.6647, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150713', 'Lima', 'Huarochiri', 'Mariatana', 168.6300, -76.3261, -12.2378, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150714', 'Lima', 'Huarochiri', 'Ricardo Palma', 34.5900, -76.6617, -11.9250, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150715', 'Lima', 'Huarochiri', 'San Andres de Tupicocha', 83.3500, -76.4778, -12.0008, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150716', 'Lima', 'Huarochiri', 'San Antonio', 563.5900, -76.6519, -11.7439, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150717', 'Lima', 'Huarochiri', 'San Bartolome', 43.9100, -76.5275, -11.9114, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150718', 'Lima', 'Huarochiri', 'San Damian', 343.2200, -76.3936, -12.0178, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150719', 'Lima', 'Huarochiri', 'San Juan de Iris', 124.3100, -76.5275, -11.6847, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150720', 'Lima', 'Huarochiri', 'San Juan de Tantaranche', 137.1600, -76.1850, -12.1136, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150721', 'Lima', 'Huarochiri', 'San Lorenzo de Quinti', 467.5800, -76.2133, -12.1453, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150722', 'Lima', 'Huarochiri', 'San Mateo', 425.6000, -76.3031, -11.7589, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150723', 'Lima', 'Huarochiri', 'San Mateo de Otao', 123.9100, -76.5475, -11.8686, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150724', 'Lima', 'Huarochiri', 'San Pedro de Casta', 79.9100, -76.5989, -11.7583, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150725', 'Lima', 'Huarochiri', 'San Pedro de Huancayre', 41.7500, -76.2186, -12.1311, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150726', 'Lima', 'Huarochiri', 'Sangallaya', 81.9200, -76.2297, -12.1606, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150727', 'Lima', 'Huarochiri', 'Santa Cruz de Cocachacra', 41.5000, -76.5406, -11.9108, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150728', 'Lima', 'Huarochiri', 'Santa Eulalia', 111.1200, -76.6656, -11.9106, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150729', 'Lima', 'Huarochiri', 'Santiago de Anchucaya', 94.0100, -76.2325, -12.0961, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150730', 'Lima', 'Huarochiri', 'Santiago de Tuna', 54.2500, -76.5275, -11.9850, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150731', 'Lima', 'Huarochiri', 'Santo Domingo de los Olleros', 552.3200, -76.5161, -12.2203, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150732', 'Lima', 'Huarochiri', 'Surco', 102.5800, -76.4425, -11.8850, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150801', 'Lima', 'Huaura', 'Huacho', 717.0200, -77.6100, -11.1069, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150802', 'Lima', 'Huaura', 'Ambar', 929.6800, -77.2694, -10.7572, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150803', 'Lima', 'Huaura', 'Caleta de Carquin', 2.0400, -77.6278, -11.0917, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150804', 'Lima', 'Huaura', 'Checras', 166.3700, -76.8336, -10.9350, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150805', 'Lima', 'Huaura', 'Hualmay', 5.8100, -77.6100, -11.1014, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150806', 'Lima', 'Huaura', 'Huaura', 484.4300, -77.6003, -11.0692, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150807', 'Lima', 'Huaura', 'Leoncio Prado', 300.1300, -76.9308, -11.0586, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150808', 'Lima', 'Huaura', 'Paccho', 229.2500, -76.9336, -10.9567, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150809', 'Lima', 'Huaura', 'Santa Leonor', 375.4900, -76.7447, -10.9483, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150810', 'Lima', 'Huaura', 'Santa Maria', 127.5100, -77.5883, -11.0883, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150811', 'Lima', 'Huaura', 'Sayan', 1310.7700, -77.1917, -11.1364, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150812', 'Lima', 'Huaura', 'Vegueta', 253.7000, -77.6425, -11.0225, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150901', 'Lima', 'Oyon', 'Oyon', 890.4300, -76.7728, -10.6692, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150902', 'Lima', 'Oyon', 'Andajes', 148.1800, -76.9100, -10.7914, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150903', 'Lima', 'Oyon', 'Caujul', 105.5000, -76.9786, -10.8053, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150904', 'Lima', 'Oyon', 'Cochamarca', 265.5500, -77.1278, -10.8617, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150905', 'Lima', 'Oyon', 'Navan', 227.1600, -77.0122, -10.8353, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A150906', 'Lima', 'Oyon', 'Pachangara', 252.0500, -76.8744, -10.8125, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151001', 'Lima', 'Yauyos', 'Yauyos', 327.1700, -75.9217, -12.4600, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151002', 'Lima', 'Yauyos', 'Alis', 142.0600, -75.7864, -12.2803, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151003', 'Lima', 'Yauyos', 'Ayauca', 438.7900, -76.0367, -12.5922, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151004', 'Lima', 'Yauyos', 'Ayaviri', 238.8300, -76.1389, -12.3825, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151005', 'Lima', 'Yauyos', 'Azangaro', 79.8400, -75.8367, -12.9994, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151006', 'Lima', 'Yauyos', 'Cacra', 213.7900, -75.7828, -12.8119, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151007', 'Lima', 'Yauyos', 'Carania', 122.1300, -75.8717, -12.3444, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151008', 'Lima', 'Yauyos', 'Catahuasi', 123.8600, -75.8911, -12.8003, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151009', 'Lima', 'Yauyos', 'Chocos', 213.3700, -75.8631, -12.9133, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151010', 'Lima', 'Yauyos', 'Cochas', 27.7300, -76.1589, -12.2964, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151011', 'Lima', 'Yauyos', 'Colonia', 323.9600, -75.8906, -12.6319, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151012', 'Lima', 'Yauyos', 'Hongos', 103.8000, -75.7647, -12.8108, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151013', 'Lima', 'Yauyos', 'Huampara', 54.0300, -76.1661, -12.3608, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151014', 'Lima', 'Yauyos', 'Huancaya', 283.6000, -75.7992, -12.2028, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151015', 'Lima', 'Yauyos', 'Huangascar', 50.4600, -75.8311, -12.8997, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151016', 'Lima', 'Yauyos', 'Huantan', 516.3500, -75.8106, -12.4572, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151017', 'Lima', 'Yauyos', 'Huañec', 37.5400, -76.1386, -12.2939, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151018', 'Lima', 'Yauyos', 'Laraos', 402.8500, -75.7856, -12.3456, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151019', 'Lima', 'Yauyos', 'Lincha', 221.2200, -75.6658, -12.8000, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151020', 'Lima', 'Yauyos', 'Madean', 220.7200, -75.7775, -12.9450, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151021', 'Lima', 'Yauyos', 'Miraflores', 226.2400, -75.8536, -12.2747, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151022', 'Lima', 'Yauyos', 'Omas', 295.3500, -76.2903, -12.5172, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151023', 'Lima', 'Yauyos', 'Putinza', 66.4400, -75.9494, -12.6689, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151024', 'Lima', 'Yauyos', 'Quinches', 113.3300, -76.1422, -12.3075, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151025', 'Lima', 'Yauyos', 'Quinocay', 153.1300, -76.2264, -12.3642, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151026', 'Lima', 'Yauyos', 'San Joaquin', 41.2400, -76.1464, -12.2844, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151027', 'Lima', 'Yauyos', 'San Pedro de Pilas', 97.3900, -76.2267, -12.4544, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151028', 'Lima', 'Yauyos', 'Tanta', 347.1500, -76.0122, -12.1214, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151029', 'Lima', 'Yauyos', 'Tauripampa', 530.8600, -76.1600, -12.6156, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151030', 'Lima', 'Yauyos', 'Tomas', 297.9300, -75.7461, -12.2372, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151031', 'Lima', 'Yauyos', 'Tupe', 321.1500, -75.8089, -12.7403, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151032', 'Lima', 'Yauyos', 'Viñac', 165.2300, -75.7794, -12.9311, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A151033', 'Lima', 'Yauyos', 'Vitis', 101.7900, -75.8069, -12.2236, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160101', 'Loreto', 'Maynas', 'Iquitos', 358.1500, -73.2619, -3.7497, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160102', 'Loreto', 'Maynas', 'Alto Nanay', 14290.8100, -73.7003, -3.8869, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160103', 'Loreto', 'Maynas', 'Fernando Lores', 4476.1900, -73.1525, -4.0064, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160104', 'Loreto', 'Maynas', 'Indiana', 3297.7600, -73.0444, -3.4983, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160105', 'Loreto', 'Maynas', 'Las Amazonas', 6593.6400, -72.7689, -3.4136, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160106', 'Loreto', 'Maynas', 'Mazan', 9884.2800, -73.1142, -3.4978, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160107', 'Loreto', 'Maynas', 'Napo', 24049.9500, -73.6806, -2.4936, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160108', 'Loreto', 'Maynas', 'Punchana', 1573.3900, -73.2447, -3.7289, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160110', 'Loreto', 'Maynas', 'Torres Causana', 6795.1400, -75.1814, -0.9642, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160112', 'Loreto', 'Maynas', 'Belen', 632.8000, -73.2444, -3.7644, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160113', 'Loreto', 'Maynas', 'San Juan Bautista', 3117.0500, -73.2864, -3.7742, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160201', 'Loreto', 'Alto Amazonas', 'Yurimaguas', 2187.6700, -76.1094, -5.8944, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160202', 'Loreto', 'Alto Amazonas', 'Balsapuerto', 2954.1700, -76.5597, -5.8314, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160205', 'Loreto', 'Alto Amazonas', 'Jeberos', 4253.6800, -76.2836, -5.2939, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160206', 'Loreto', 'Alto Amazonas', 'Lagunas', 5929.1600, -75.6775, -5.2300, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160210', 'Loreto', 'Alto Amazonas', 'Santa Cruz', 2222.3100, -75.8572, -5.5125, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160211', 'Loreto', 'Alto Amazonas', 'Teniente Cesar Lopez Rojas', 1292.0300, -75.8742, -6.0272, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160301', 'Loreto', 'Loreto', 'Nauta', 6672.3500, -73.5261, -4.4567, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160302', 'Loreto', 'Loreto', 'Parinari', 12934.7400, -74.4844, -4.5600, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160303', 'Loreto', 'Loreto', 'Tigre', 19785.7000, -74.6903, -3.5503, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160304', 'Loreto', 'Loreto', 'Trompeteros', 12246.0100, -75.0597, -3.8028, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160305', 'Loreto', 'Loreto', 'Urarinas', 15434.4600, -74.7597, -4.5333, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160401', 'Loreto', 'Mariscal Ramon Castilla', 'Ramon Castilla', 7163.0700, -70.5178, -3.9078, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160402', 'Loreto', 'Mariscal Ramon Castilla', 'Pebas', 11048.3500, -71.8631, -3.3192, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160403', 'Loreto', 'Mariscal Ramon Castilla', 'Yavari', 13807.5400, -70.0408, -4.3567, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160404', 'Loreto', 'Mariscal Ramon Castilla', 'San Pablo', 5045.5800, -71.1022, -4.0164, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160501', 'Loreto', 'Requena', 'Requena', 3038.5600, -73.8525, -5.0589, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160502', 'Loreto', 'Requena', 'Alto Tapiche', 9013.8000, -74.0908, -6.0256, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160503', 'Loreto', 'Requena', 'Capelo', 842.3700, -74.1592, -5.4072, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160504', 'Loreto', 'Requena', 'Emilio San Martin', 4572.5600, -74.2864, -5.7936, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160505', 'Loreto', 'Requena', 'Maquia', 4792.0600, -74.5503, -5.7892, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160506', 'Loreto', 'Requena', 'Puinahua', 6149.4900, -74.3433, -5.2533, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160507', 'Loreto', 'Requena', 'Saquena', 2081.4200, -73.5333, -4.7261, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160508', 'Loreto', 'Requena', 'Soplin', 4711.3800, -73.6911, -6.0050, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160509', 'Loreto', 'Requena', 'Tapiche', 2014.2300, -74.1886, -5.6644, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160510', 'Loreto', 'Requena', 'Jenaro Herrera', 1517.4300, -73.6728, -4.9053, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160511', 'Loreto', 'Requena', 'Yaquerana', 10947.1600, -72.8761, -5.1494, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160601', 'Loreto', 'Ucayali', 'Contamana', 10675.1300, -75.0414, -7.3250, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160602', 'Loreto', 'Ucayali', 'Inahuaya', 646.0400, -75.2667, -7.1164, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160603', 'Loreto', 'Ucayali', 'Padre Marquez', 2475.6600, -74.8403, -7.9444, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160604', 'Loreto', 'Ucayali', 'Pampa Hermosa', 7346.9800, -75.2969, -7.1950, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160605', 'Loreto', 'Ucayali', 'Sarayacu', 6303.1700, -75.1178, -6.3958, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160606', 'Loreto', 'Ucayali', 'Vargas Guerra', 1846.4900, -75.1594, -6.9094, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160701', 'Loreto', 'Datem del Marañon', 'Barranca', 7235.5300, -76.5642, -4.8219, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160702', 'Loreto', 'Datem del Marañon', 'Cahuapanas', 4685.1100, -76.9858, -5.2711, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160703', 'Loreto', 'Datem del Marañon', 'Manseriche', 3493.7700, -77.4183, -4.5650, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160704', 'Loreto', 'Datem del Marañon', 'Morona', 10776.9500, -77.2147, -4.3247, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160705', 'Loreto', 'Datem del Marañon', 'Pastaza', 8908.9100, -76.5981, -4.6442, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160706', 'Loreto', 'Datem del Marañon', 'Andoas', 11540.6600, -76.4344, -3.4750, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160801', 'Loreto', 'Maynas', 'Putumayo', 10886.4100, -72.6556, -2.4497, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160802', 'Loreto', 'Maynas', 'Rosa Panduro', 7038.6900, -73.4078, -1.7964, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160803', 'Loreto', 'Maynas', 'Teniente Manuel Clavero', 9488.5200, -74.6753, -0.3783, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A160804', 'Loreto', 'Maynas', 'Yaguas', 17725.0200, -71.1836, -2.4114, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A170101', 'Madre de Dios', 'Tambopata', 'Tambopata', 22218.5600, -69.1875, -12.5972, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A170102', 'Madre de Dios', 'Tambopata', 'Inambari', 4256.8200, -70.3678, -13.1000, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A170103', 'Madre de Dios', 'Tambopata', 'Las Piedras', 7032.2100, -69.1536, -12.2781, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A170104', 'Madre de Dios', 'Tambopata', 'Laberinto', 2760.9000, -69.5900, -12.7172, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A170201', 'Madre de Dios', 'Manu', 'Manu', 8166.6500, -71.3633, -12.8381, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A170202', 'Madre de Dios', 'Manu', 'Fitzcarrald', 10955.2900, -70.9336, -12.2678, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A170203', 'Madre de Dios', 'Manu', 'Madre de Dios', 7234.8100, -70.3936, -12.6181, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A170204', 'Madre de Dios', 'Manu', 'Huepetuhe', 1478.4200, -70.5336, -12.9975, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A170301', 'Madre de Dios', 'Tahuamanu', 'Iñapari', 14853.6600, -69.5814, -10.9544, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A170302', 'Madre de Dios', 'Tahuamanu', 'Iberia', 2549.3200, -69.4889, -11.4072, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A170303', 'Madre de Dios', 'Tahuamanu', 'Tahuamanu', 3793.9000, -69.3214, -11.4550, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180101', 'Moquegua', 'Mariscal Nieto', 'Moquegua', 3949.0400, -70.9369, -17.1950, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180102', 'Moquegua', 'Mariscal Nieto', 'Carumas', 2256.3100, -70.6953, -16.8106, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180103', 'Moquegua', 'Mariscal Nieto', 'Cuchumbaya', 67.5800, -70.6878, -16.7525, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180104', 'Moquegua', 'Mariscal Nieto', 'Samegua', 62.5500, -70.9008, -17.1797, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180105', 'Moquegua', 'Mariscal Nieto', 'San Cristobal', 542.7300, -70.6831, -16.7406, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180106', 'Moquegua', 'Mariscal Nieto', 'Torata', 1793.3700, -70.8442, -17.0767, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180201', 'Moquegua', 'General Sanchez Cerr', 'Omate', 250.6400, -70.9719, -16.6739, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180202', 'Moquegua', 'General Sanchez Cerr', 'Chojata', 847.9400, -70.7286, -16.3894, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180203', 'Moquegua', 'General Sanchez Cerr', 'Coalaque', 247.5800, -71.0239, -16.6486, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180204', 'Moquegua', 'General Sanchez Cerr', 'Ichuña', 1017.7400, -70.5392, -16.1411, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180205', 'Moquegua', 'General Sanchez Cerr', 'La Capilla', 776.0400, -71.1767, -16.7581, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180206', 'Moquegua', 'General Sanchez Cerr', 'Lloque', 254.4500, -70.7381, -16.3239, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180207', 'Moquegua', 'General Sanchez Cerr', 'Matalaque', 557.2300, -70.8278, -16.4819, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180208', 'Moquegua', 'General Sanchez Cerr', 'Puquina', 550.9900, -71.1842, -16.6211, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180209', 'Moquegua', 'General Sanchez Cerr', 'Quinistaquillas', 193.7900, -70.8808, -16.7486, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180210', 'Moquegua', 'General Sanchez Cerr', 'Ubinas', 874.5700, -70.8581, -16.3856, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180211', 'Moquegua', 'General Sanchez Cerr', 'Yunga', 110.7400, -70.6814, -16.1964, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180301', 'Moquegua', 'Ilo', 'Ilo', 295.5100, -71.3450, -17.6444, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180302', 'Moquegua', 'Ilo', 'El Algarrobal', 747.0000, -71.2703, -17.6228, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A180303', 'Moquegua', 'Ilo', 'Pacocha', 338.0800, -71.3400, -17.6161, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190101', 'Pasco', 'Pasco', 'Chaupimarca', 6.6600, -76.2556, -10.6828, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190102', 'Pasco', 'Pasco', 'Huachon', 846.3000, -75.9522, -10.6378, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190103', 'Pasco', 'Pasco', 'Huariaca', 133.0700, -76.1889, -10.4428, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190104', 'Pasco', 'Pasco', 'Huayllay', 1026.8700, -76.3681, -11.0044, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190105', 'Pasco', 'Pasco', 'Ninacaca', 508.9200, -76.1131, -10.8617, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190106', 'Pasco', 'Pasco', 'Pallanchacra', 73.6900, -76.2356, -10.4147, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190107', 'Pasco', 'Pasco', 'Paucartambo', 782.1900, -75.8128, -10.7731, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190108', 'Pasco', 'Pasco', 'San Francisco de Asis de Yarusyacan', 117.7000, -76.1964, -10.4914, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190109', 'Pasco', 'Pasco', 'Simon Bolivar', 697.1500, -76.3175, -10.6897, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190110', 'Pasco', 'Pasco', 'Ticlacayan', 748.4300, -76.1625, -10.5344, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190111', 'Pasco', 'Pasco', 'Tinyahuarco', 94.4900, -76.2733, -10.7689, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190112', 'Pasco', 'Pasco', 'Vicco', 173.3000, -76.2375, -10.8414, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190113', 'Pasco', 'Pasco', 'Yanacancha', 165.1100, -76.2556, -10.6689, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190201', 'Pasco', 'Daniel Alcides Carri', 'Yanahuanca', 921.0600, -76.5169, -10.4925, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190202', 'Pasco', 'Daniel Alcides Carri', 'Chacayan', 198.5800, -76.4383, -10.4350, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190203', 'Pasco', 'Daniel Alcides Carri', 'Goyllarisquizga', 23.1700, -76.4078, -10.4733, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190204', 'Pasco', 'Daniel Alcides Carri', 'Paucar', 134.1800, -76.4450, -10.3697, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190205', 'Pasco', 'Daniel Alcides Carri', 'San Pedro de Pillao', 92.1700, -76.4972, -10.4392, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190206', 'Pasco', 'Daniel Alcides Carri', 'Santa Ana de Tusi', 353.1100, -76.3547, -10.4719, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190207', 'Pasco', 'Daniel Alcides Carri', 'Tapuc', 60.1900, -76.4617, -10.4558, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190208', 'Pasco', 'Daniel Alcides Carri', 'Vilcabamba', 102.3500, -76.4492, -10.4789, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190301', 'Pasco', 'Oxapampa', 'Oxapampa', 419.8500, -75.4039, -10.5728, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190302', 'Pasco', 'Oxapampa', 'Chontabamba', 457.0900, -75.4633, -10.6044, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190303', 'Pasco', 'Oxapampa', 'Huancabamba', 1182.1500, -75.5131, -10.4261, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190304', 'Pasco', 'Oxapampa', 'Palcazu', 2912.1600, -75.1458, -10.1878, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190305', 'Pasco', 'Oxapampa', 'Pozuzo', 750.8700, -75.5569, -10.0653, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190306', 'Pasco', 'Oxapampa', 'Puerto Bermudez', 8014.3100, -74.9358, -10.2964, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190307', 'Pasco', 'Oxapampa', 'Villa Rica', 859.2300, -75.2722, -10.7364, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A190308', 'Pasco', 'Oxapampa', 'Constitución', 3171.4900, -74.9986, -9.8458, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200101', 'Piura', 'Piura', 'Piura', 196.1500, -80.6289, -5.1942, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200104', 'Piura', 'Piura', 'Castilla', 656.6900, -80.6211, -5.2006, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200105', 'Piura', 'Piura', 'Catacaos', 2286.9700, -80.6764, -5.2697, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200107', 'Piura', 'Piura', 'Cura Mori', 217.4100, -80.6656, -5.3250, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200108', 'Piura', 'Piura', 'El Tallan', 100.9800, -80.6800, -5.4128, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200109', 'Piura', 'Piura', 'La Arena', 171.2400, -80.7108, -5.3464, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200110', 'Piura', 'Piura', 'La Union', 320.9000, -80.7433, -5.4031, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200111', 'Piura', 'Piura', 'Las Lomas', 557.6900, -80.2442, -4.6578, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200114', 'Piura', 'Piura', 'Tambo Grande', 1496.7500, -80.3414, -4.9331, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200115', 'Piura', 'Piura', '26 de Octubre', 72.0100, -80.6703, -5.1847, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200201', 'Piura', 'Ayabaca', 'Ayabaca', 1549.9900, -79.7161, -4.6392, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200202', 'Piura', 'Ayabaca', 'Frias', 565.3100, -79.9431, -4.9342, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200203', 'Piura', 'Ayabaca', 'Jilili', 104.7300, -79.7989, -4.5839, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200204', 'Piura', 'Ayabaca', 'Lagunas', 190.8200, -79.8456, -4.7900, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200205', 'Piura', 'Ayabaca', 'Montero', 130.5700, -79.8275, -4.6303, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200206', 'Piura', 'Ayabaca', 'Pacaipampa', 981.5000, -79.6700, -4.9953, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200207', 'Piura', 'Ayabaca', 'Paimas', 319.6700, -79.9453, -4.6269, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200208', 'Piura', 'Ayabaca', 'Sapillica', 267.0900, -79.9831, -4.7786, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200209', 'Piura', 'Ayabaca', 'Sicchez', 33.1000, -79.7650, -4.5703, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200210', 'Piura', 'Ayabaca', 'Suyo', 1078.6100, -80.0031, -4.5139, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200301', 'Piura', 'Huancabamba', 'Huancabamba', 446.7500, -79.4508, -5.2394, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200302', 'Piura', 'Huancabamba', 'Canchaque', 306.4100, -79.6097, -5.3758, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200303', 'Piura', 'Huancabamba', 'El Carmen de La Frontera', 702.8100, -79.4347, -5.1481, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200304', 'Piura', 'Huancabamba', 'Huarmaca', 1908.2200, -79.5247, -5.5683, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200305', 'Piura', 'Huancabamba', 'Lalaquiz', 138.9500, -79.6783, -5.2128, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200306', 'Piura', 'Huancabamba', 'San Miguel de El Faique', 201.6000, -79.6053, -5.4022, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200307', 'Piura', 'Huancabamba', 'Sondor', 336.5300, -79.4106, -5.3150, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200308', 'Piura', 'Huancabamba', 'Sondorillo', 226.0900, -79.4300, -5.3394, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200401', 'Piura', 'Morropon', 'Chulucanas', 842.2600, -80.1642, -5.0969, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200402', 'Piura', 'Morropon', 'Buenos Aires', 245.1200, -79.9708, -5.2678, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200403', 'Piura', 'Morropon', 'Chalaco', 151.9600, -79.7958, -5.0417, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200404', 'Piura', 'Morropon', 'La Matanza', 1043.6100, -80.0906, -5.2114, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200405', 'Piura', 'Morropon', 'Morropon', 169.9600, -79.9717, -5.1861, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200406', 'Piura', 'Morropon', 'Salitral', 614.0300, -79.8319, -5.3419, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200407', 'Piura', 'Morropon', 'San Juan de Bigote', 245.2100, -79.7875, -5.3189, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200408', 'Piura', 'Morropon', 'Santa Catalina de Mossa', 76.7600, -79.8872, -5.1031, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200409', 'Piura', 'Morropon', 'Santo Domingo', 187.3200, -79.8756, -5.0292, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200410', 'Piura', 'Morropon', 'Yamango', 216.9100, -79.7528, -5.1814, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200501', 'Piura', 'Paita', 'Paita', 706.3100, -81.1164, -5.0883, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200502', 'Piura', 'Paita', 'Amotape', 90.8200, -81.0178, -4.8822, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200503', 'Piura', 'Paita', 'Arenal', 8.1900, -81.0269, -4.8842, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200504', 'Piura', 'Paita', 'Colan', 124.9300, -81.0572, -4.9092, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200505', 'Piura', 'Paita', 'La Huaca', 599.5100, -80.9608, -4.9117, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200506', 'Piura', 'Paita', 'Tamarindo', 63.6700, -80.9739, -4.8792, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200507', 'Piura', 'Paita', 'Vichayal', 134.3600, -81.0719, -4.8653, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200601', 'Piura', 'Sullana', 'Sullana', 529.7300, -80.7047, -4.9044, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200602', 'Piura', 'Sullana', 'Bellavista', 3.0900, -80.6808, -4.8908, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200603', 'Piura', 'Sullana', 'Ignacio Escudero', 306.5300, -80.8747, -4.8458, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200604', 'Piura', 'Sullana', 'Lancones', 2152.9900, -80.4778, -4.5767, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200605', 'Piura', 'Sullana', 'Marcavelica', 1687.9800, -80.7061, -4.8814, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200606', 'Piura', 'Sullana', 'Miguel Checa', 480.2600, -80.8169, -4.9025, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200607', 'Piura', 'Sullana', 'Querecotillo', 270.0800, -80.6519, -4.8400, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200608', 'Piura', 'Sullana', 'Salitral', 28.2700, -80.6794, -4.8583, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200701', 'Piura', 'Talara', 'Pariñas', 1116.9900, -81.2747, -4.5811, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200702', 'Piura', 'Talara', 'El Alto', 491.3300, -81.2239, -4.2697, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200703', 'Piura', 'Talara', 'La Brea', 692.9600, -81.3069, -4.6564, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200704', 'Piura', 'Talara', 'Lobitos', 233.0100, -81.2783, -4.4531, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200705', 'Piura', 'Talara', 'Los Organos', 165.0100, -81.1322, -4.1789, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200706', 'Piura', 'Talara', 'Mancora', 100.1900, -81.0556, -4.1083, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200801', 'Piura', 'Sechura', 'Sechura', 5710.8500, -80.8217, -5.5567, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200802', 'Piura', 'Sechura', 'Bellavista de La Union', 13.8800, -80.7547, -5.4394, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200803', 'Piura', 'Sechura', 'Bernal', 71.7400, -80.7422, -5.4608, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200804', 'Piura', 'Sechura', 'Cristo Nos Valga', 234.3700, -80.7414, -5.4939, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200805', 'Piura', 'Sechura', 'Vice', 261.0100, -80.7767, -5.4231, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A200806', 'Piura', 'Sechura', 'Rinconada Llicuar', 19.4400, -80.7614, -5.4572, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210101', 'Puno', 'Puno', 'Puno', 460.6300, -70.0278, -15.8406, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210102', 'Puno', 'Puno', 'Acora', 1941.0900, -69.7978, -15.9736, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210103', 'Puno', 'Puno', 'Amantani', 15.0000, -69.7194, -15.6572, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210104', 'Puno', 'Puno', 'Atuncolla', 124.7400, -70.1436, -15.6878, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210105', 'Puno', 'Puno', 'Capachica', 117.0600, -69.8303, -15.6431, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210106', 'Puno', 'Puno', 'Chucuito', 121.1800, -69.8922, -15.8947, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210107', 'Puno', 'Puno', 'Coata', 104.0000, -69.9503, -15.5711, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210108', 'Puno', 'Puno', 'Huata', 130.3700, -69.9722, -15.6144, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210109', 'Puno', 'Puno', 'Mañazo', 410.6700, -70.3458, -15.7992, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210110', 'Puno', 'Puno', 'Paucarcolla', 170.0400, -70.0556, -15.7461, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210111', 'Puno', 'Puno', 'Pichacani', 1633.4800, -70.0642, -16.1508, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210112', 'Puno', 'Puno', 'Plateria', 238.5900, -69.8356, -15.9475, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210113', 'Puno', 'Puno', 'San Antonio', 376.7500, -70.3458, -16.1414, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210114', 'Puno', 'Puno', 'Tiquillaca', 455.7100, -70.1872, -15.7978, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210115', 'Puno', 'Puno', 'Vilque', 193.2900, -70.2594, -15.7661, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210201', 'Puno', 'Azangaro', 'Azangaro', 706.1300, -70.1969, -14.9083, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210202', 'Puno', 'Azangaro', 'Achaya', 132.2300, -70.1608, -15.2847, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210203', 'Puno', 'Azangaro', 'Arapa', 329.8500, -70.1117, -15.1411, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210204', 'Puno', 'Azangaro', 'Asillo', 392.3800, -70.3544, -14.7864, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210205', 'Puno', 'Azangaro', 'Caminaca', 146.8800, -70.0747, -15.3239, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210206', 'Puno', 'Azangaro', 'Chupa', 143.2100, -69.9861, -15.1069, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210207', 'Puno', 'Azangaro', 'Jose Domingo Choquehuanca', 69.7300, -70.3381, -15.0336, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210208', 'Puno', 'Azangaro', 'Muñani', 764.4900, -69.9528, -14.7689, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210209', 'Puno', 'Azangaro', 'Potoni', 602.9500, -70.1136, -14.3944, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210210', 'Puno', 'Azangaro', 'Saman', 188.5900, -70.0169, -15.2917, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210211', 'Puno', 'Azangaro', 'San Anton', 514.8400, -70.3125, -14.5922, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210212', 'Puno', 'Azangaro', 'San Jose', 372.7300, -70.1606, -14.6817, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210213', 'Puno', 'Azangaro', 'San Juan de Salinas', 106.0000, -70.1056, -14.9911, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210214', 'Puno', 'Azangaro', 'Santiago de Pupuja', 301.2700, -70.2792, -15.0547, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210215', 'Puno', 'Azangaro', 'Tirapata', 198.7300, -70.4028, -14.9544, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210301', 'Puno', 'Carabaya', 'Macusani', 1029.5600, -70.4308, -14.0686, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210302', 'Puno', 'Carabaya', 'Ajoyani', 413.1100, -70.2264, -14.2294, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210303', 'Puno', 'Carabaya', 'Ayapata', 1091.6100, -70.3250, -13.7781, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210304', 'Puno', 'Carabaya', 'Coasa', 3572.9200, -70.0197, -13.9853, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210305', 'Puno', 'Carabaya', 'Corani', 852.9900, -70.6042, -13.8686, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210306', 'Puno', 'Carabaya', 'Crucero', 836.3700, -70.0250, -14.3619, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210307', 'Puno', 'Carabaya', 'Ituata', 1200.7900, -70.2178, -13.8761, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210308', 'Puno', 'Carabaya', 'Ollachea', 595.7900, -70.4756, -13.7944, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210309', 'Puno', 'Carabaya', 'San Gaban', 2029.2200, -70.3889, -13.4333, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210310', 'Puno', 'Carabaya', 'Usicayos', 644.0400, -69.9672, -14.1256, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210401', 'Puno', 'Chucuito', 'Juli', 720.3800, -69.4619, -16.2150, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210402', 'Puno', 'Chucuito', 'Desaguadero', 178.2100, -69.0433, -16.5653, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210403', 'Puno', 'Chucuito', 'Huacullani', 705.2800, -69.3250, -16.6292, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210404', 'Puno', 'Chucuito', 'Kelluyo', 485.7700, -69.2492, -16.7208, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210405', 'Puno', 'Chucuito', 'Pisacoma', 959.3400, -69.3736, -16.9092, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210406', 'Puno', 'Chucuito', 'Pomata', 382.5800, -69.2933, -16.2728, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210407', 'Puno', 'Chucuito', 'Zepita', 546.5700, -69.1050, -16.4964, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210501', 'Puno', 'El Collao', 'Ilave', 874.5700, -69.6386, -16.0867, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210502', 'Puno', 'El Collao', 'Capazo', 1039.2500, -69.7439, -17.1828, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210503', 'Puno', 'El Collao', 'Pilcuyo', 157.0000, -69.5547, -16.1100, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210504', 'Puno', 'El Collao', 'Santa Rosa', 2524.0200, -69.7175, -16.7414, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210505', 'Puno', 'El Collao', 'Conduriri', 1005.6700, -69.7025, -16.6156, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210601', 'Puno', 'Huancane', 'Huancane', 381.6200, -69.7614, -15.2017, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210602', 'Puno', 'Huancane', 'Cojata', 881.1800, -69.3647, -15.0161, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210603', 'Puno', 'Huancane', 'Huatasani', 106.7300, -69.8042, -15.0589, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210604', 'Puno', 'Huancane', 'Inchupalla', 289.0300, -69.6822, -15.0089, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210605', 'Puno', 'Huancane', 'Pusi', 148.4200, -69.9294, -15.4419, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210606', 'Puno', 'Huancane', 'Rosaspata', 301.4700, -69.5303, -15.2347, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210607', 'Puno', 'Huancane', 'Taraco', 198.0200, -69.9792, -15.2978, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210608', 'Puno', 'Huancane', 'Vilque Chico', 499.3800, -69.6886, -15.2144, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210701', 'Puno', 'Lampa', 'Lampa', 675.8200, -70.3653, -15.3636, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210702', 'Puno', 'Lampa', 'Cabanilla', 443.0400, -70.3489, -15.6194, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210703', 'Puno', 'Lampa', 'Calapuja', 141.3000, -70.2217, -15.3100, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210704', 'Puno', 'Lampa', 'Nicasio', 134.3500, -70.2622, -15.2361, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210705', 'Puno', 'Lampa', 'Ocuviri', 878.2600, -70.9117, -15.1128, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210706', 'Puno', 'Lampa', 'Palca', 483.9600, -70.5992, -15.2350, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210707', 'Puno', 'Lampa', 'Paratia', 745.0800, -70.6008, -15.4539, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210708', 'Puno', 'Lampa', 'Pucara', 537.6000, -70.3689, -15.0419, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210709', 'Puno', 'Lampa', 'Santa Lucia', 1595.6700, -70.6061, -15.6986, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210710', 'Puno', 'Lampa', 'Vilavila', 156.6500, -70.6606, -15.1883, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210801', 'Puno', 'Melgar', 'Ayaviri', 1013.1400, -70.5897, -14.8811, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210802', 'Puno', 'Melgar', 'Antauta', 636.1700, -70.2950, -14.3000, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210803', 'Puno', 'Melgar', 'Cupi', 214.2500, -70.8683, -14.9058, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210804', 'Puno', 'Melgar', 'Llalli', 216.3600, -70.8792, -14.9339, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210805', 'Puno', 'Melgar', 'Macari', 673.7800, -70.9033, -14.7706, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210806', 'Puno', 'Melgar', 'Nuñoa', 2200.1600, -70.6372, -14.4767, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210807', 'Puno', 'Melgar', 'Orurillo', 379.0500, -70.5133, -14.7261, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210808', 'Puno', 'Melgar', 'Santa Rosa', 790.3800, -70.7872, -14.6072, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210809', 'Puno', 'Melgar', 'Umachiri', 323.5600, -70.7494, -14.8497, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210901', 'Puno', 'Moho', 'Moho', 494.3600, -69.5000, -15.3600, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210902', 'Puno', 'Moho', 'Conima', 72.9500, -69.4375, -15.4572, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210903', 'Puno', 'Moho', 'Huayrapata', 388.3500, -69.3494, -15.3211, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A210904', 'Puno', 'Moho', 'Tilali', 48.1500, -69.3456, -15.5192, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211001', 'Puno', 'San Antonio de Putin', 'Putina', 1021.9200, -69.8619, -14.9003, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211002', 'Puno', 'San Antonio de Putin', 'Ananea', 939.5600, -69.5333, -14.6786, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211003', 'Puno', 'San Antonio de Putin', 'Pedro Vilca Apaza', 565.8100, -69.8897, -15.0592, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211004', 'Puno', 'San Antonio de Putin', 'Quilcapuncu', 516.6600, -69.7344, -14.8964, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211005', 'Puno', 'San Antonio de Putin', 'Sina', 163.4300, -69.2817, -14.4900, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211101', 'Puno', 'San Roman', 'Juliaca', 533.5000, -70.1356, -15.4939, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211102', 'Puno', 'San Roman', 'Cabana', 191.2300, -70.3211, -15.6500, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211103', 'Puno', 'San Roman', 'Cabanillas', 1267.0600, -70.3503, -15.6425, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211104', 'Puno', 'San Roman', 'Caracoto', 285.8700, -70.1022, -15.5683, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211105', 'Puno', 'San Roman', 'San Miguel', 121.8000, -70.0958, -15.4097, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211201', 'Puno', 'Sandia', 'Sandia', 580.1300, -69.4667, -14.3231, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211202', 'Puno', 'Sandia', 'Cuyocuyo', 503.9100, -69.5400, -14.4717, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211203', 'Puno', 'Sandia', 'Limbani', 2112.3400, -69.6897, -14.1458, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211204', 'Puno', 'Sandia', 'Patambuco', 462.7200, -69.6222, -14.3594, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211205', 'Puno', 'Sandia', 'Phara', 400.9000, -69.6642, -14.1511, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211206', 'Puno', 'Sandia', 'Quiaca', 447.9000, -69.3417, -14.4253, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211207', 'Puno', 'Sandia', 'San Juan del Oro', 197.1400, -69.1528, -14.2211, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211208', 'Puno', 'Sandia', 'Yanahuaya', 670.6100, -69.1844, -14.2822, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211209', 'Puno', 'Sandia', 'Alto Inambari', 1124.8800, -69.2442, -14.0897, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211210', 'Puno', 'Sandia', 'San Pedro de Putina Punco', 5361.8800, -69.0467, -14.1119, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211301', 'Puno', 'Yunguyo', 'Yunguyo', 170.5900, -69.0950, -16.2469, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211302', 'Puno', 'Yunguyo', 'Anapia', 9.5400, -68.8539, -16.3133, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211303', 'Puno', 'Yunguyo', 'Copani', 47.3700, -69.0439, -16.3989, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211304', 'Puno', 'Yunguyo', 'Cuturapi', 21.7400, -69.1781, -16.2706, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211305', 'Puno', 'Yunguyo', 'Ollaraya', 23.6700, -68.9981, -16.2308, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211306', 'Puno', 'Yunguyo', 'Tinicachi', 6.2000, -68.9603, -16.1967, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A211307', 'Puno', 'Yunguyo', 'Unicachi', 11.1000, -68.9761, -16.2239, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220101', 'San Martin', 'Moyobamba', 'Moyobamba', 2737.5700, -76.9719, -6.0283, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220102', 'San Martin', 'Moyobamba', 'Calzada', 95.3800, -77.0675, -6.0319, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220103', 'San Martin', 'Moyobamba', 'Habana', 91.2500, -77.0928, -6.0808, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220104', 'San Martin', 'Moyobamba', 'Jepelacio', 360.0300, -76.9161, -6.1081, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220105', 'San Martin', 'Moyobamba', 'Soritor', 387.7600, -77.1050, -6.1408, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220106', 'San Martin', 'Moyobamba', 'Yantalo', 100.3200, -77.0225, -5.9747, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220201', 'San Martin', 'Bellavista', 'Bellavista', 287.1200, -76.5883, -7.0653, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220202', 'San Martin', 'Bellavista', 'Alto Biavo', 6117.1200, -76.4544, -7.2936, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220203', 'San Martin', 'Bellavista', 'Bajo Biavo', 975.4300, -76.4867, -7.1011, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220204', 'San Martin', 'Bellavista', 'Huallaga', 210.4200, -76.6489, -7.1292, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220205', 'San Martin', 'Bellavista', 'San Pablo', 362.4900, -76.5731, -6.8081, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220206', 'San Martin', 'Bellavista', 'San Rafael', 98.3200, -76.4764, -7.0308, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220301', 'San Martin', 'El Dorado', 'San Jose de Sisa', 299.9000, -76.6931, -6.6136, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220302', 'San Martin', 'El Dorado', 'Agua Blanca', 168.1900, -76.6975, -6.7289, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220303', 'San Martin', 'El Dorado', 'San Martin', 562.5700, -76.7425, -6.5147, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220304', 'San Martin', 'El Dorado', 'Santa Rosa', 243.4100, -76.6264, -6.7456, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220305', 'San Martin', 'El Dorado', 'Shatoja', 24.0700, -76.7211, -6.5283, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220401', 'San Martin', 'Huallaga', 'Saposoa', 545.4300, -76.7733, -6.9339, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220402', 'San Martin', 'Huallaga', 'Alto Saposoa', 1347.3400, -76.8139, -6.7658, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220403', 'San Martin', 'Huallaga', 'El Eslabon', 122.7700, -76.7436, -7.0031, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220404', 'San Martin', 'Huallaga', 'Piscoyacu', 184.8700, -76.7647, -6.9831, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220405', 'San Martin', 'Huallaga', 'Sacanche', 143.1500, -76.7136, -7.0700, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220406', 'San Martin', 'Huallaga', 'Tingo de Saposoa', 37.2900, -76.6417, -7.0936, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220501', 'San Martin', 'Lamas', 'Lamas', 79.8200, -76.5211, -6.4217, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220502', 'San Martin', 'Lamas', 'Alonso de Alvarado', 294.2000, -76.7700, -6.3500, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220503', 'San Martin', 'Lamas', 'Barranquita', 1065.1200, -76.0331, -6.2517, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220504', 'San Martin', 'Lamas', 'Caynarachi', 1678.6900, -76.2836, -6.3306, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220505', 'San Martin', 'Lamas', 'Cuñumbuqui', 191.4600, -76.4803, -6.5089, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220506', 'San Martin', 'Lamas', 'Pinto Recodo', 524.0700, -76.6033, -6.3794, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220507', 'San Martin', 'Lamas', 'Rumisapa', 39.1900, -76.4722, -6.4486, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220508', 'San Martin', 'Lamas', 'San Roque de Cumbaza', 525.1500, -76.4419, -6.3864, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220509', 'San Martin', 'Lamas', 'Shanao', 24.5900, -76.5939, -6.4100, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220510', 'San Martin', 'Lamas', 'Tabalosos', 485.2500, -76.6333, -6.3856, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220511', 'San Martin', 'Lamas', 'Zapatero', 175.0000, -76.4911, -6.5308, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220601', 'San Martin', 'Mariscal Caceres', 'Juanjui', 335.1900, -76.7317, -7.1819, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220602', 'San Martin', 'Mariscal Caceres', 'Campanilla', 2249.8300, -76.6528, -7.4814, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220603', 'San Martin', 'Mariscal Caceres', 'Huicungo', 9830.1700, -76.7783, -7.3272, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220604', 'San Martin', 'Mariscal Caceres', 'Pachiza', 1839.5100, -76.7739, -7.2975, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220605', 'San Martin', 'Mariscal Caceres', 'Pajarillo', 244.0300, -76.6881, -7.1789, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220701', 'San Martin', 'Picota', 'Picota', 218.7200, -76.3317, -6.9194, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220702', 'San Martin', 'Picota', 'Buenos Aires', 272.9700, -76.3269, -6.7939, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220703', 'San Martin', 'Picota', 'Caspisapa', 81.4400, -76.4189, -6.9589, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220704', 'San Martin', 'Picota', 'Pilluana', 239.2700, -76.2931, -6.7781, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220705', 'San Martin', 'Picota', 'Pucacaca', 230.7200, -76.3417, -6.8506, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220706', 'San Martin', 'Picota', 'San Cristobal', 29.6300, -76.4186, -6.9925, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220707', 'San Martin', 'Picota', 'San Hilarion', 96.5500, -76.4428, -7.0022, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220708', 'San Martin', 'Picota', 'Shamboyacu', 415.5800, -76.1119, -7.0425, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220709', 'San Martin', 'Picota', 'Tingo de Ponasa', 340.0100, -76.2511, -6.9356, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220710', 'San Martin', 'Picota', 'Tres Unidos', 246.5200, -76.2311, -6.8064, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220801', 'San Martin', 'Rioja', 'Rioja', 185.6900, -77.1669, -6.0589, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220802', 'San Martin', 'Rioja', 'Awajun', 481.0800, -77.3822, -5.8139, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220803', 'San Martin', 'Rioja', 'Elias Soplin Vargas', 199.6400, -77.2781, -5.9908, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220804', 'San Martin', 'Rioja', 'Nueva Cajamarca', 330.3100, -77.3083, -5.9400, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220805', 'San Martin', 'Rioja', 'Pardo Miguel', 1131.8700, -77.5025, -5.7381, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220806', 'San Martin', 'Rioja', 'Posic', 54.6500, -77.1636, -6.0139, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220807', 'San Martin', 'Rioja', 'San Fernando', 63.5300, -77.2700, -5.9019, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220808', 'San Martin', 'Rioja', 'Yorongos', 74.5300, -77.1447, -6.1356, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220809', 'San Martin', 'Rioja', 'Yuracyacu', 13.7400, -77.2269, -5.9278, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220901', 'San Martin', 'San Martin', 'Tarapoto', 67.8100, -76.3664, -6.4969, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220902', 'San Martin', 'San Martin', 'Alberto Leveau', 268.4000, -76.2878, -6.6633, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220903', 'San Martin', 'San Martin', 'Cacatachi', 75.3600, -76.4514, -6.4619, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220904', 'San Martin', 'San Martin', 'Chazuta', 966.3800, -76.0931, -6.5739, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220905', 'San Martin', 'San Martin', 'Chipurana', 500.4400, -75.7411, -6.3539, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220906', 'San Martin', 'San Martin', 'El Porvenir', 483.2100, -75.7867, -6.2150, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220907', 'San Martin', 'San Martin', 'Huimbayoc', 1609.0700, -75.7658, -6.4167, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220908', 'San Martin', 'San Martin', 'Juan Guerra', 196.5000, -76.3336, -6.5833, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220909', 'San Martin', 'San Martin', 'La Banda de Shilcayo', 286.6800, -76.3514, -6.5033, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220910', 'San Martin', 'San Martin', 'Morales', 43.9100, -76.3828, -6.4797, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220911', 'San Martin', 'San Martin', 'Papaplaya', 686.1900, -75.7903, -6.2450, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220912', 'San Martin', 'San Martin', 'San Antonio', 93.0300, -76.4044, -6.4200, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220913', 'San Martin', 'San Martin', 'Sauce', 103.0000, -76.2183, -6.6914, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A220914', 'San Martin', 'San Martin', 'Shapaja', 270.4400, -76.2653, -6.5800, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A221001', 'San Martin', 'Tocache', 'Tocache', 1142.0400, -76.5153, -8.1883, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A221002', 'San Martin', 'Tocache', 'Nuevo Progreso', 860.9800, -76.3253, -8.4500, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A221003', 'San Martin', 'Tocache', 'Polvora', 2174.4800, -76.6706, -7.9075, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A221004', 'San Martin', 'Tocache', 'Shunte', 964.2100, -76.7231, -8.3500, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A221005', 'San Martin', 'Tocache', 'Uchiza', 723.7300, -76.4600, -8.4558, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230101', 'Tacna', 'Tacna', 'Tacna', 1877.7800, -70.2478, -18.0100, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230102', 'Tacna', 'Tacna', 'Alto de La Alianza', 371.4000, -70.2475, -17.9908, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230103', 'Tacna', 'Tacna', 'Calana', 108.3800, -70.1825, -17.9406, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230104', 'Tacna', 'Tacna', 'Ciudad Nueva', 173.4200, -70.2378, -17.9850, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230105', 'Tacna', 'Tacna', 'Inclan', 1414.8200, -70.4919, -17.7950, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230106', 'Tacna', 'Tacna', 'Pachia', 603.6800, -70.1528, -17.8972, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230107', 'Tacna', 'Tacna', 'Palca', 1417.8600, -69.9583, -17.7733, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230108', 'Tacna', 'Tacna', 'Pocollay', 265.6500, -70.2197, -17.9964, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230109', 'Tacna', 'Tacna', 'Sama', 1115.9800, -70.5731, -17.8586, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230110', 'Tacna', 'Tacna', 'Coronel Gregorio Albarracin Lanchipa', 187.7400, -70.2542, -18.0408, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230111', 'Tacna', 'Tacna', 'La Yarada-Los Palos', 529.4000, -70.4769, -18.2292, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230201', 'Tacna', 'Candarave', 'Candarave', 1111.0300, -70.2497, -17.2669, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230202', 'Tacna', 'Candarave', 'Cairani', 371.1700, -70.3628, -17.2861, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230203', 'Tacna', 'Candarave', 'Camilaca', 518.6500, -70.3833, -17.2669, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230204', 'Tacna', 'Candarave', 'Curibaya', 126.9800, -70.3353, -17.3822, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230205', 'Tacna', 'Candarave', 'Huanuara', 95.6100, -70.3217, -17.3133, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230206', 'Tacna', 'Candarave', 'Quilahuani', 37.6600, -70.2583, -17.3175, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230301', 'Tacna', 'Jorge Basadre', 'Locumba', 968.9900, -70.7611, -17.6133, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230302', 'Tacna', 'Jorge Basadre', 'Ilabaya', 1111.3900, -70.5122, -17.4214, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230303', 'Tacna', 'Jorge Basadre', 'Ite', 848.1800, -70.9650, -17.8617, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230401', 'Tacna', 'Tarata', 'Tarata', 864.3100, -70.0306, -17.4772, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230402', 'Tacna', 'Tarata', 'Heroes Albarracin', 372.4100, -70.1211, -17.4817, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230403', 'Tacna', 'Tarata', 'Estique', 312.8500, -70.0206, -17.5428, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230404', 'Tacna', 'Tarata', 'Estique-Pampa', 185.6100, -70.0344, -17.5372, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230405', 'Tacna', 'Tarata', 'Sitajara', 251.2400, -70.1342, -17.3747, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230406', 'Tacna', 'Tarata', 'Susapaya', 373.2100, -70.1311, -17.3528, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230407', 'Tacna', 'Tarata', 'Tarucachi', 113.2700, -70.0292, -17.5253, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A230408', 'Tacna', 'Tarata', 'Ticaco', 347.0600, -70.0456, -17.4506, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240101', 'Tumbes', 'Tumbes', 'Tumbes', 158.1400, -80.4536, -3.5647, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240102', 'Tumbes', 'Tumbes', 'Corrales', 131.6000, -80.4797, -3.6022, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240103', 'Tumbes', 'Tumbes', 'La Cruz', 65.2300, -80.5925, -3.6378, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240104', 'Tumbes', 'Tumbes', 'Pampas de Hospital', 727.7500, -80.4358, -3.6956, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240105', 'Tumbes', 'Tumbes', 'San Jacinto', 598.7200, -80.4511, -3.6431, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240106', 'Tumbes', 'Tumbes', 'San Juan de La Virgen', 118.7100, -80.4336, -3.6275, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240201', 'Tumbes', 'Contralmirante Villa', 'Zorritos', 644.5200, -80.6783, -3.6806, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240202', 'Tumbes', 'Contralmirante Villa', 'Casitas', 855.3600, -80.6519, -3.9406, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240203', 'Tumbes', 'Contralmirante Villa', 'Canoas de Punta Sal', 623.3400, -80.9428, -3.9467, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240301', 'Tumbes', 'Zarumilla', 'Zarumilla', 113.2500, -80.2750, -3.5011, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240302', 'Tumbes', 'Zarumilla', 'Aguas Verdes', 46.0600, -80.2461, -3.4814, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240303', 'Tumbes', 'Zarumilla', 'Matapalo', 392.2900, -80.1997, -3.6839, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A240304', 'Tumbes', 'Zarumilla', 'Papayal', 193.5300, -80.2333, -3.5736, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250101', 'Ucayali', 'Coronel Portillo', 'Calleria', 10485.4100, -74.5322, -8.3828, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250102', 'Ucayali', 'Coronel Portillo', 'Campoverde', 1194.1000, -74.8072, -8.4761, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250103', 'Ucayali', 'Coronel Portillo', 'Iparia', 8029.1200, -74.4378, -9.3064, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250104', 'Ucayali', 'Coronel Portillo', 'Masisea', 14102.1900, -74.3097, -8.6025, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250105', 'Ucayali', 'Coronel Portillo', 'Yarinacocha', 596.2000, -74.5769, -8.3550, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250106', 'Ucayali', 'Coronel Portillo', 'Nueva Requena', 1857.8200, -74.8653, -8.3061, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250107', 'Ucayali', 'Coronel Portillo', 'Manantay', 579.9100, -74.5378, -8.3981, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250201', 'Ucayali', 'Atalaya', 'Raymondi', 14504.9900, -73.7592, -10.7278, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250202', 'Ucayali', 'Atalaya', 'Sepahua', 8223.6300, -73.0475, -11.1464, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250203', 'Ucayali', 'Atalaya', 'Tahuania', 7010.0900, -73.9808, -10.1033, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250204', 'Ucayali', 'Atalaya', 'Yurua', 9175.5800, -72.7622, -9.5281, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250301', 'Ucayali', 'Padre Abad', 'Padre Abad', 4689.2000, -75.5128, -9.0375, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250302', 'Ucayali', 'Padre Abad', 'Irazola', 998.9300, -75.2139, -8.8289, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250303', 'Ucayali', 'Padre Abad', 'Curimana', 2134.0400, -75.1597, -8.4353, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250304', 'Ucayali', 'Padre Abad', 'Neshuya', 579.5100, -74.9644, -8.6392, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250305', 'Ucayali', 'Padre Abad', 'Alexander von Humboldt', 190.8000, -75.0522, -8.8264, true);
INSERT INTO public.ubigeo (cod_ubigeo, departamento, provincia, distrito, superficie, posx, posy, estado_reg) VALUES ('A250401', 'Ucayali', 'Purus', 'Purus', 17847.7600, -70.7122, -9.7703, true);


--
-- TOC entry 3528 (class 0 OID 16866)
-- Dependencies: 240
-- Data for Name: unidad_medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.unidad_medida (id_um, nombre, abreviatura, estado, estado_reg) VALUES (1, 'TONELADAS METRICAS', 'TM', true, true);
INSERT INTO public.unidad_medida (id_um, nombre, abreviatura, estado, estado_reg) VALUES (2, 'UNIDAD', 'UND', true, true);
INSERT INTO public.unidad_medida (id_um, nombre, abreviatura, estado, estado_reg) VALUES (3, 'GALONES', 'GL', true, true);
INSERT INTO public.unidad_medida (id_um, nombre, abreviatura, estado, estado_reg) VALUES (4, 'CAJA', 'CJ', true, true);
INSERT INTO public.unidad_medida (id_um, nombre, abreviatura, estado, estado_reg) VALUES (5, 'CUBETAS', 'CB', true, true);
INSERT INTO public.unidad_medida (id_um, nombre, abreviatura, estado, estado_reg) VALUES (6, 'EJE', 'EJE', true, true);


--
-- TOC entry 3583 (class 0 OID 0)
-- Dependencies: 218
-- Name: destino_id_destino_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.destino_id_destino_seq', 2, true);


--
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 220
-- Name: embarcacion_id_embarcacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.embarcacion_id_embarcacion_seq', 11, true);


--
-- TOC entry 3585 (class 0 OID 0)
-- Dependencies: 222
-- Name: emp_proveedor_id_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emp_proveedor_id_proveedor_seq', 1, false);


--
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 226
-- Name: planta_id_planta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planta_id_planta_seq', 9, true);


--
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 228
-- Name: proveedor_id_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedor_id_proveedor_seq', 21, true);


--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 249
-- Name: tipo_sub_servicio_id_tipo_sub_servicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_sub_servicio_id_tipo_sub_servicio_seq', 1, false);


--
-- TOC entry 3274 (class 2606 OID 16764)
-- Name: banco banco_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_pk PRIMARY KEY (id_banco);


--
-- TOC entry 3276 (class 2606 OID 16769)
-- Name: camara camara_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camara
    ADD CONSTRAINT camara_pk PRIMARY KEY (placa);


--
-- TOC entry 3278 (class 2606 OID 16774)
-- Name: cliente cliente_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pk PRIMARY KEY (ruc);


--
-- TOC entry 3280 (class 2606 OID 16780)
-- Name: destino destino_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.destino
    ADD CONSTRAINT destino_pk PRIMARY KEY (id_destino);


--
-- TOC entry 3317 (class 2606 OID 16873)
-- Name: dia_semana dia_semana_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dia_semana
    ADD CONSTRAINT dia_semana_pk PRIMARY KEY (id_dia);


--
-- TOC entry 3282 (class 2606 OID 16786)
-- Name: embarcacion embarcacion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.embarcacion
    ADD CONSTRAINT embarcacion_pk PRIMARY KEY (id_embarcacion);


--
-- TOC entry 3284 (class 2606 OID 16792)
-- Name: emp_proveedor emp_proveedor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_proveedor
    ADD CONSTRAINT emp_proveedor_pk PRIMARY KEY (id_proveedor, id_tipodoc, numero_documento);


--
-- TOC entry 3286 (class 2606 OID 16797)
-- Name: forma_pago forma_pago_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_pago
    ADD CONSTRAINT forma_pago_pk PRIMARY KEY (id_forma_pago);


--
-- TOC entry 3288 (class 2606 OID 16802)
-- Name: moneda moneda_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moneda
    ADD CONSTRAINT moneda_pk PRIMARY KEY (id_moneda);


--
-- TOC entry 3290 (class 2606 OID 16808)
-- Name: planta planta_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planta
    ADD CONSTRAINT planta_pk PRIMARY KEY (id_planta);


--
-- TOC entry 3299 (class 2606 OID 16830)
-- Name: rel_planta_proveedor planta_proveedor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_planta_proveedor
    ADD CONSTRAINT planta_proveedor_pk PRIMARY KEY (id_planta, id_proveedor, id_tipo_servicio);


--
-- TOC entry 3293 (class 2606 OID 16815)
-- Name: proveedor proveedor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pk PRIMARY KEY (id_proveedor);


--
-- TOC entry 3295 (class 2606 OID 16820)
-- Name: rel_embarcacion_proveedor rel_embarcacion_proveedor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_embarcacion_proveedor
    ADD CONSTRAINT rel_embarcacion_proveedor_pk PRIMARY KEY (id_embarcacion, id_proovedor, id_tipo_servicio);


--
-- TOC entry 3327 (class 2606 OID 17041)
-- Name: rel_planta_cliente rel_planta_cliente_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_planta_cliente
    ADD CONSTRAINT rel_planta_cliente_pk PRIMARY KEY (ruc, id_planta);


--
-- TOC entry 3297 (class 2606 OID 16825)
-- Name: rel_planta_destino rel_planta_destino_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_planta_destino
    ADD CONSTRAINT rel_planta_destino_pk PRIMARY KEY (id_planta, id_destino);


--
-- TOC entry 3301 (class 2606 OID 16835)
-- Name: rel_prov_tiposerv rel_prov_tiposerv_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_prov_tiposerv
    ADD CONSTRAINT rel_prov_tiposerv_pk PRIMARY KEY (id_proveedor, id_tipo_servicio);


--
-- TOC entry 3303 (class 2606 OID 16840)
-- Name: semana semana_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semana
    ADD CONSTRAINT semana_pk PRIMARY KEY (id_semana);


--
-- TOC entry 3321 (class 2606 OID 16886)
-- Name: tarifario_camara tarifario_camara_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifario_camara
    ADD CONSTRAINT tarifario_camara_pk PRIMARY KEY (id_dia, cod_ubigeo, placa);


--
-- TOC entry 3323 (class 2606 OID 17021)
-- Name: tarifario_embarcacion tarifario_embarcacion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifario_embarcacion
    ADD CONSTRAINT tarifario_embarcacion_pk PRIMARY KEY (id_dia, id_tipo_servicio, id_proveedor, id_embarcacion);


--
-- TOC entry 3319 (class 2606 OID 16893)
-- Name: tarifario_general tarifario_general_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifario_general
    ADD CONSTRAINT tarifario_general_pk PRIMARY KEY (id_proveedor, id_tipo_servicio, id_dia);


--
-- TOC entry 3331 (class 2606 OID 17089)
-- Name: tarifario_muelle tarifario_muelle_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifario_muelle
    ADD CONSTRAINT tarifario_muelle_pk PRIMARY KEY (id_proveedor, id_tipo_servicio, id_tipo_sub_servicio, id_dia);


--
-- TOC entry 3325 (class 2606 OID 17031)
-- Name: tarifario_planta tarifario_planta_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifario_planta
    ADD CONSTRAINT tarifario_planta_pk PRIMARY KEY (id_dia, id_planta, id_proveedor, id_tipo_servicio);


--
-- TOC entry 3305 (class 2606 OID 16845)
-- Name: tipo_cambio tipo_cambio_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cambio
    ADD CONSTRAINT tipo_cambio_pk PRIMARY KEY (id_tipocambio, id_moneda_dest);


--
-- TOC entry 3307 (class 2606 OID 16850)
-- Name: tipo_documento tipo_documento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_pk PRIMARY KEY (id_tipodoc);


--
-- TOC entry 3309 (class 2606 OID 16855)
-- Name: tipo_servicio tipo_servicio_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_servicio
    ADD CONSTRAINT tipo_servicio_pk PRIMARY KEY (id_tipo_servicio);


--
-- TOC entry 3329 (class 2606 OID 17078)
-- Name: tipo_sub_servicio tipo_sub_servicio_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_sub_servicio
    ADD CONSTRAINT tipo_sub_servicio_pk PRIMARY KEY (id_tipo_servicio, id_tipo_sub_servicio);


--
-- TOC entry 3311 (class 2606 OID 16860)
-- Name: trabajador trabajador_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_pk PRIMARY KEY (id_tipodoc, numero_documento);


--
-- TOC entry 3313 (class 2606 OID 16865)
-- Name: ubigeo ubigeo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubigeo
    ADD CONSTRAINT ubigeo_pk PRIMARY KEY (cod_ubigeo);


--
-- TOC entry 3315 (class 2606 OID 16900)
-- Name: unidad_medida unidad_medida_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidad_medida
    ADD CONSTRAINT unidad_medida_pk PRIMARY KEY (id_um);


--
-- TOC entry 3291 (class 1259 OID 16813)
-- Name: proveedor__idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX proveedor__idx ON public.proveedor USING btree (numero_documento);


--
-- TOC entry 3332 (class 2606 OID 16901)
-- Name: camara camara_proveedor_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camara
    ADD CONSTRAINT camara_proveedor_fk FOREIGN KEY (id_proveedor) REFERENCES public.proveedor(id_proveedor);


--
-- TOC entry 3351 (class 2606 OID 16874)
-- Name: dia_semana dia_semana_semana_id_semana_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dia_semana
    ADD CONSTRAINT dia_semana_semana_id_semana_fk FOREIGN KEY (id_semana) REFERENCES public.semana(id_semana);


--
-- TOC entry 3333 (class 2606 OID 16906)
-- Name: embarcacion embarcacion_proveedor_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.embarcacion
    ADD CONSTRAINT embarcacion_proveedor_fk FOREIGN KEY (id_proveedor) REFERENCES public.proveedor(id_proveedor);


--
-- TOC entry 3334 (class 2606 OID 16911)
-- Name: emp_proveedor emp_proveedor_proveedor_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_proveedor
    ADD CONSTRAINT emp_proveedor_proveedor_fk FOREIGN KEY (id_proveedor) REFERENCES public.proveedor(id_proveedor);


--
-- TOC entry 3335 (class 2606 OID 16916)
-- Name: emp_proveedor emp_proveedor_tipo_documento_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_proveedor
    ADD CONSTRAINT emp_proveedor_tipo_documento_fk FOREIGN KEY (id_tipodoc) REFERENCES public.tipo_documento(id_tipodoc);


--
-- TOC entry 3341 (class 2606 OID 16926)
-- Name: rel_planta_proveedor planta_proveedor_planta_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_planta_proveedor
    ADD CONSTRAINT planta_proveedor_planta_fk FOREIGN KEY (id_planta) REFERENCES public.planta(id_planta);


--
-- TOC entry 3342 (class 2606 OID 16931)
-- Name: rel_planta_proveedor planta_proveedor_rel_prov_tiposerv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_planta_proveedor
    ADD CONSTRAINT planta_proveedor_rel_prov_tiposerv_fk FOREIGN KEY (id_proveedor, id_tipo_servicio) REFERENCES public.rel_prov_tiposerv(id_proveedor, id_tipo_servicio);


--
-- TOC entry 3336 (class 2606 OID 16936)
-- Name: planta planta_ubigeo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planta
    ADD CONSTRAINT planta_ubigeo_fk FOREIGN KEY (cod_ubigeo) REFERENCES public.ubigeo(cod_ubigeo);


--
-- TOC entry 3337 (class 2606 OID 16941)
-- Name: rel_embarcacion_proveedor rel_embarcacion_proveedor_embarcacion_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_embarcacion_proveedor
    ADD CONSTRAINT rel_embarcacion_proveedor_embarcacion_fk FOREIGN KEY (id_embarcacion) REFERENCES public.embarcacion(id_embarcacion);


--
-- TOC entry 3338 (class 2606 OID 16946)
-- Name: rel_embarcacion_proveedor rel_embarcacion_proveedor_rel_prov_tiposerv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_embarcacion_proveedor
    ADD CONSTRAINT rel_embarcacion_proveedor_rel_prov_tiposerv_fk FOREIGN KEY (id_proovedor, id_tipo_servicio) REFERENCES public.rel_prov_tiposerv(id_proveedor, id_tipo_servicio);


--
-- TOC entry 3356 (class 2606 OID 17042)
-- Name: rel_planta_cliente rel_planta_cliente_cliente_ruc_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_planta_cliente
    ADD CONSTRAINT rel_planta_cliente_cliente_ruc_fk FOREIGN KEY (ruc) REFERENCES public.cliente(ruc);


--
-- TOC entry 3357 (class 2606 OID 17047)
-- Name: rel_planta_cliente rel_planta_cliente_planta_id_planta_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_planta_cliente
    ADD CONSTRAINT rel_planta_cliente_planta_id_planta_fk FOREIGN KEY (id_planta) REFERENCES public.planta(id_planta);


--
-- TOC entry 3339 (class 2606 OID 16951)
-- Name: rel_planta_destino rel_planta_destino_destino_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_planta_destino
    ADD CONSTRAINT rel_planta_destino_destino_fk FOREIGN KEY (id_destino) REFERENCES public.destino(id_destino);


--
-- TOC entry 3340 (class 2606 OID 16956)
-- Name: rel_planta_destino rel_planta_destino_planta_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_planta_destino
    ADD CONSTRAINT rel_planta_destino_planta_fk FOREIGN KEY (id_planta) REFERENCES public.planta(id_planta);


--
-- TOC entry 3343 (class 2606 OID 16961)
-- Name: rel_prov_tiposerv rel_prov_tiposerv_proveedor_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_prov_tiposerv
    ADD CONSTRAINT rel_prov_tiposerv_proveedor_fk FOREIGN KEY (id_proveedor) REFERENCES public.proveedor(id_proveedor);


--
-- TOC entry 3344 (class 2606 OID 16966)
-- Name: rel_prov_tiposerv rel_prov_tiposerv_tipo_servicio_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_prov_tiposerv
    ADD CONSTRAINT rel_prov_tiposerv_tipo_servicio_fk FOREIGN KEY (id_tipo_servicio) REFERENCES public.tipo_servicio(id_tipo_servicio);


--
-- TOC entry 3353 (class 2606 OID 16887)
-- Name: tarifario_camara tarifario_camara_dia_semana_id_dia_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifario_camara
    ADD CONSTRAINT tarifario_camara_dia_semana_id_dia_fk FOREIGN KEY (id_dia) REFERENCES public.dia_semana(id_dia);


--
-- TOC entry 3354 (class 2606 OID 17022)
-- Name: tarifario_embarcacion tarifario_embarcacion_dia_semana_id_dia_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifario_embarcacion
    ADD CONSTRAINT tarifario_embarcacion_dia_semana_id_dia_fk FOREIGN KEY (id_dia) REFERENCES public.dia_semana(id_dia);


--
-- TOC entry 3352 (class 2606 OID 16894)
-- Name: tarifario_general tarifario_general_semana_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifario_general
    ADD CONSTRAINT tarifario_general_semana_fk FOREIGN KEY (id_dia) REFERENCES public.dia_semana(id_dia);


--
-- TOC entry 3359 (class 2606 OID 17090)
-- Name: tarifario_muelle tarifario_muelle_dia_semana_id_dia_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifario_muelle
    ADD CONSTRAINT tarifario_muelle_dia_semana_id_dia_fk FOREIGN KEY (id_dia) REFERENCES public.dia_semana(id_dia);


--
-- TOC entry 3355 (class 2606 OID 17032)
-- Name: tarifario_planta tarifario_planta_dia_semana_id_dia_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifario_planta
    ADD CONSTRAINT tarifario_planta_dia_semana_id_dia_fk FOREIGN KEY (id_dia) REFERENCES public.dia_semana(id_dia);


--
-- TOC entry 3345 (class 2606 OID 16971)
-- Name: tipo_cambio tipo_cambio_moneda_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cambio
    ADD CONSTRAINT tipo_cambio_moneda_fk FOREIGN KEY (id_moneda_orig) REFERENCES public.moneda(id_moneda);


--
-- TOC entry 3346 (class 2606 OID 16976)
-- Name: tipo_servicio tipo_servicio_unidad_medida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_servicio
    ADD CONSTRAINT tipo_servicio_unidad_medida_fk FOREIGN KEY (id_um) REFERENCES public.unidad_medida(id_um);


--
-- TOC entry 3358 (class 2606 OID 17079)
-- Name: tipo_sub_servicio tipo_sub_servicio_tipo_servicio_id_tipo_servicio_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_sub_servicio
    ADD CONSTRAINT tipo_sub_servicio_tipo_servicio_id_tipo_servicio_fk FOREIGN KEY (id_tipo_servicio) REFERENCES public.tipo_servicio(id_tipo_servicio);


--
-- TOC entry 3347 (class 2606 OID 16981)
-- Name: trabajador trabajador_banco_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_banco_fk FOREIGN KEY (id_banco) REFERENCES public.banco(id_banco);


--
-- TOC entry 3348 (class 2606 OID 16986)
-- Name: trabajador trabajador_forma_pago_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_forma_pago_fk FOREIGN KEY (id_forma_pago) REFERENCES public.forma_pago(id_forma_pago);


--
-- TOC entry 3349 (class 2606 OID 16991)
-- Name: trabajador trabajador_moneda_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_moneda_fk FOREIGN KEY (id_moneda) REFERENCES public.moneda(id_moneda);


--
-- TOC entry 3350 (class 2606 OID 16996)
-- Name: trabajador trabajador_tipo_documento_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_tipo_documento_fk FOREIGN KEY (id_tipodoc) REFERENCES public.tipo_documento(id_tipodoc);


--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE banco; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.banco TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.banco TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.banco TO "siscope-dev";


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE camara; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.camara TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.camara TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.camara TO "siscope-dev";


--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE cliente; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cliente TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.cliente TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cliente TO "siscope-dev";


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE destino; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.destino TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.destino TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.destino TO "siscope-dev";


--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE dia_semana; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dia_semana TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.dia_semana TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dia_semana TO "siscope-dev";


--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE dual; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dual TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.dual TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dual TO "siscope-dev";


--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE embarcacion; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.embarcacion TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.embarcacion TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.embarcacion TO "siscope-dev";


--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE emp_proveedor; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.emp_proveedor TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.emp_proveedor TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.emp_proveedor TO "siscope-dev";


--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE forma_pago; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.forma_pago TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.forma_pago TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.forma_pago TO "siscope-dev";


--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE moneda; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.moneda TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.moneda TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.moneda TO "siscope-dev";


--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE planta; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.planta TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.planta TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.planta TO "siscope-dev";


--
-- TOC entry 3560 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE proveedor; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.proveedor TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.proveedor TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.proveedor TO "siscope-dev";


--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE rel_embarcacion_proveedor; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_embarcacion_proveedor TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.rel_embarcacion_proveedor TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_embarcacion_proveedor TO "siscope-dev";


--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE rel_planta_cliente; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_planta_cliente TO "siscope-dev";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_planta_cliente TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.rel_planta_cliente TO "siscope-tarifario";


--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE rel_planta_destino; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_planta_destino TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.rel_planta_destino TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_planta_destino TO "siscope-dev";


--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE rel_planta_proveedor; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_planta_proveedor TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.rel_planta_proveedor TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_planta_proveedor TO "siscope-dev";


--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE rel_prov_tiposerv; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_prov_tiposerv TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.rel_prov_tiposerv TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_prov_tiposerv TO "siscope-dev";


--
-- TOC entry 3567 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE semana; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.semana TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.semana TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.semana TO "siscope-dev";


--
-- TOC entry 3568 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE tarifario_camara; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_camara TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tarifario_camara TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_camara TO "siscope-dev";


--
-- TOC entry 3569 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE tarifario_embarcacion; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_embarcacion TO "siscope-dev";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_embarcacion TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tarifario_embarcacion TO "siscope-tarifario";


--
-- TOC entry 3570 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE tarifario_general; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_general TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tarifario_general TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_general TO "siscope-dev";


--
-- TOC entry 3571 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE tarifario_muelle; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_muelle TO "siscope-dev";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_muelle TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tarifario_muelle TO "siscope-tarifario";


--
-- TOC entry 3573 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE tarifario_planta; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_planta TO "siscope-dev";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_planta TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tarifario_planta TO "siscope-tarifario";


--
-- TOC entry 3574 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE tipo_cambio; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_cambio TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tipo_cambio TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_cambio TO "siscope-dev";


--
-- TOC entry 3576 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE tipo_documento; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_documento TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tipo_documento TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_documento TO "siscope-dev";


--
-- TOC entry 3577 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE tipo_servicio; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_servicio TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tipo_servicio TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_servicio TO "siscope-dev";


--
-- TOC entry 3578 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE tipo_sub_servicio; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_sub_servicio TO "siscope-dev";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_sub_servicio TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tipo_sub_servicio TO "siscope-tarifario";


--
-- TOC entry 3580 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE trabajador; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.trabajador TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.trabajador TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.trabajador TO "siscope-dev";


--
-- TOC entry 3581 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE ubigeo; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.ubigeo TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.ubigeo TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.ubigeo TO "siscope-dev";


--
-- TOC entry 3582 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE unidad_medida; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.unidad_medida TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.unidad_medida TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.unidad_medida TO "siscope-dev";


-- Completed on 2023-11-30 18:24:07

--
-- PostgreSQL database dump complete
--

