PGDMP                       {            SISCOPE    16.1    16.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17115    SISCOPE    DATABASE     u   CREATE DATABASE "SISCOPE" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE "SISCOPE";
                postgres    false            �            1259    17116    banco    TABLE     �   CREATE TABLE public.banco (
    id_banco integer NOT NULL,
    nombre_banco character varying(70),
    estado boolean,
    estado_reg boolean
);
    DROP TABLE public.banco;
       public         heap    postgres    false            �           0    0    TABLE banco    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.banco TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.banco TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.banco TO "siscope-dev";
          public          postgres    false    215            �            1259    17119    camara    TABLE     �   CREATE TABLE public.camara (
    placa character(10) NOT NULL,
    marca character(50),
    modelo character(50),
    eje integer,
    id_proveedor integer NOT NULL,
    estado boolean,
    estado_reg boolean
);
    DROP TABLE public.camara;
       public         heap    postgres    false            �           0    0    TABLE camara    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.camara TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.camara TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.camara TO "siscope-dev";
          public          postgres    false    216            �            1259    17122    cliente    TABLE     b   CREATE TABLE public.cliente (
    ruc character(11) NOT NULL,
    nombre character varying(50)
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �           0    0    TABLE cliente    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cliente TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.cliente TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cliente TO "siscope-dev";
          public          postgres    false    217            �            1259    17125    destino    TABLE     �   CREATE TABLE public.destino (
    id_destino integer NOT NULL,
    nombre character varying(100),
    abreviatura character(20),
    estado boolean,
    estado_reg boolean
);
    DROP TABLE public.destino;
       public         heap    postgres    false            �           0    0    COLUMN destino.nombre    COMMENT     A   COMMENT ON COLUMN public.destino.nombre IS 'Nombre del destino';
          public          postgres    false    218            �           0    0    COLUMN destino.abreviatura    COMMENT     ?   COMMENT ON COLUMN public.destino.abreviatura IS 'Abreviatura';
          public          postgres    false    218            �           0    0    TABLE destino    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.destino TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.destino TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.destino TO "siscope-dev";
          public          postgres    false    218            �            1259    17128    destino_id_destino_seq    SEQUENCE     �   ALTER TABLE public.destino ALTER COLUMN id_destino ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.destino_id_destino_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    17129 
   dia_semana    TABLE     �   CREATE TABLE public.dia_semana (
    id_dia integer NOT NULL,
    id_semana integer,
    nombre_dia character(20) NOT NULL,
    caracteristica character(1)
);
    DROP TABLE public.dia_semana;
       public         heap    postgres    false            �           0    0    TABLE dia_semana    COMMENT     G   COMMENT ON TABLE public.dia_semana IS 'Realización de dia de semana';
          public          postgres    false    220            �           0    0    COLUMN dia_semana.id_dia    COMMENT     E   COMMENT ON COLUMN public.dia_semana.id_dia IS 'Id del dia AAAAMMDD';
          public          postgres    false    220            �           0    0    TABLE dia_semana    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dia_semana TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.dia_semana TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dia_semana TO "siscope-dev";
          public          postgres    false    220            �            1259    17132    dual    TABLE     0   CREATE TABLE public.dual (
    valor integer
);
    DROP TABLE public.dual;
       public         heap    postgres    false            �           0    0 
   TABLE dual    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dual TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.dual TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.dual TO "siscope-dev";
          public          postgres    false    221            �            1259    17135    embarcacion    TABLE        CREATE TABLE public.embarcacion (
    id_embarcacion integer NOT NULL,
    id_proveedor integer NOT NULL,
    nombre character varying(100),
    num_matricula character varying(50),
    tonelaje numeric(10,2),
    estado boolean,
    estado_reg boolean
);
    DROP TABLE public.embarcacion;
       public         heap    postgres    false            �           0    0    COLUMN embarcacion.id_proveedor    COMMENT     u   COMMENT ON COLUMN public.embarcacion.id_proveedor IS 'Señala la embarcación a quien esta asociado como proveedor';
          public          postgres    false    222            �           0    0    TABLE embarcacion    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.embarcacion TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.embarcacion TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.embarcacion TO "siscope-dev";
          public          postgres    false    222            �            1259    17138    embarcacion_id_embarcacion_seq    SEQUENCE     �   ALTER TABLE public.embarcacion ALTER COLUMN id_embarcacion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.embarcacion_id_embarcacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    17139    emp_proveedor    TABLE     )  CREATE TABLE public.emp_proveedor (
    id_proveedor integer NOT NULL,
    id_tipodoc integer NOT NULL,
    numero_documento character varying(20) NOT NULL,
    nombre character varying(70),
    apellido_pat character varying(70),
    apellido_mat character varying(70),
    estado_reg boolean
);
 !   DROP TABLE public.emp_proveedor;
       public         heap    postgres    false            �           0    0    TABLE emp_proveedor    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.emp_proveedor TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.emp_proveedor TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.emp_proveedor TO "siscope-dev";
          public          postgres    false    224            �            1259    17142    emp_proveedor_id_proveedor_seq    SEQUENCE     �   ALTER TABLE public.emp_proveedor ALTER COLUMN id_proveedor ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.emp_proveedor_id_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    17143 
   forma_pago    TABLE     �   CREATE TABLE public.forma_pago (
    id_forma_pago integer NOT NULL,
    nombre character varying(50),
    estado boolean,
    estado_reg boolean
);
    DROP TABLE public.forma_pago;
       public         heap    postgres    false            �           0    0    TABLE forma_pago    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.forma_pago TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.forma_pago TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.forma_pago TO "siscope-dev";
          public          postgres    false    226            �            1259    17146    moneda    TABLE        CREATE TABLE public.moneda (
    id_moneda integer NOT NULL,
    nombre character varying(20),
    abreviatura character(5)
);
    DROP TABLE public.moneda;
       public         heap    postgres    false            �           0    0    TABLE moneda    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.moneda TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.moneda TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.moneda TO "siscope-dev";
          public          postgres    false    227            �            1259    17149    planta    TABLE     �   CREATE TABLE public.planta (
    id_planta integer NOT NULL,
    nombre character varying(80),
    direccion character varying(100),
    cod_ubigeo character varying(10) NOT NULL,
    estado boolean,
    estado_reg boolean
);
    DROP TABLE public.planta;
       public         heap    postgres    false            �           0    0    TABLE planta    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.planta TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.planta TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.planta TO "siscope-dev";
          public          postgres    false    228            �            1259    17152    planta_id_planta_seq    SEQUENCE     �   ALTER TABLE public.planta ALTER COLUMN id_planta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planta_id_planta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    17153 	   proveedor    TABLE     �  CREATE TABLE public.proveedor (
    id_proveedor integer NOT NULL,
    razon_social character varying(100) NOT NULL,
    nombre_comercial character varying(100),
    id_tipodoc integer,
    numero_documento character varying(20),
    direccion character varying(100),
    telefono character varying(15),
    correo character varying(70),
    estado boolean NOT NULL,
    estado_reg boolean NOT NULL
);
    DROP TABLE public.proveedor;
       public         heap    postgres    false            �           0    0    TABLE proveedor    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.proveedor TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.proveedor TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.proveedor TO "siscope-dev";
          public          postgres    false    230            �            1259    17156    proveedor_id_proveedor_seq    SEQUENCE     �   ALTER TABLE public.proveedor ALTER COLUMN id_proveedor ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.proveedor_id_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    17157    rel_embarcacion_proveedor    TABLE     �   CREATE TABLE public.rel_embarcacion_proveedor (
    id_embarcacion integer NOT NULL,
    id_proovedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL
);
 -   DROP TABLE public.rel_embarcacion_proveedor;
       public         heap    postgres    false            �           0    0    TABLE rel_embarcacion_proveedor    ACL       GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_embarcacion_proveedor TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.rel_embarcacion_proveedor TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_embarcacion_proveedor TO "siscope-dev";
          public          postgres    false    232            �            1259    17160    rel_planta_cliente    TABLE     k   CREATE TABLE public.rel_planta_cliente (
    ruc character(11) NOT NULL,
    id_planta integer NOT NULL
);
 &   DROP TABLE public.rel_planta_cliente;
       public         heap    postgres    false            �           0    0    TABLE rel_planta_cliente    COMMENT     Y   COMMENT ON TABLE public.rel_planta_cliente IS 'Relacion entre la planta con el cliente';
          public          postgres    false    233            �           0    0    TABLE rel_planta_cliente    ACL       GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_planta_cliente TO "siscope-dev";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_planta_cliente TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.rel_planta_cliente TO "siscope-tarifario";
          public          postgres    false    233            �            1259    17163    rel_planta_destino    TABLE     l   CREATE TABLE public.rel_planta_destino (
    id_planta integer NOT NULL,
    id_destino integer NOT NULL
);
 &   DROP TABLE public.rel_planta_destino;
       public         heap    postgres    false            �           0    0    TABLE rel_planta_destino    ACL       GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_planta_destino TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.rel_planta_destino TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_planta_destino TO "siscope-dev";
          public          postgres    false    234            �            1259    17166    rel_planta_proveedor    TABLE     �   CREATE TABLE public.rel_planta_proveedor (
    id_planta integer NOT NULL,
    id_proveedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL
);
 (   DROP TABLE public.rel_planta_proveedor;
       public         heap    postgres    false            �           0    0    TABLE rel_planta_proveedor    ACL       GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_planta_proveedor TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.rel_planta_proveedor TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_planta_proveedor TO "siscope-dev";
          public          postgres    false    235            �            1259    17169    rel_prov_tiposerv    TABLE     �   CREATE TABLE public.rel_prov_tiposerv (
    id_proveedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL,
    estado boolean,
    estado_reg boolean
);
 %   DROP TABLE public.rel_prov_tiposerv;
       public         heap    postgres    false            �           0    0    TABLE rel_prov_tiposerv    ACL       GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_prov_tiposerv TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.rel_prov_tiposerv TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_prov_tiposerv TO "siscope-dev";
          public          postgres    false    236            �            1259    17414    rel_proveedor_cuenta    TABLE     �   CREATE TABLE public.rel_proveedor_cuenta (
    id_proveedor integer NOT NULL,
    id_banco integer NOT NULL,
    numero_cuenta character varying(20) NOT NULL,
    id_moneda integer,
    estado boolean,
    estado_reg boolean
);
 (   DROP TABLE public.rel_proveedor_cuenta;
       public         heap    postgres    false            �           0    0    TABLE rel_proveedor_cuenta    ACL       GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_proveedor_cuenta TO "siscope-dev";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.rel_proveedor_cuenta TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.rel_proveedor_cuenta TO "siscope-tarifario";
          public          postgres    false    249            �            1259    17172    semana    TABLE     �   CREATE TABLE public.semana (
    id_semana integer NOT NULL,
    fecha_inicio integer NOT NULL,
    fecha_fin integer NOT NULL,
    tipo_semana character(1) NOT NULL,
    estado boolean
);
    DROP TABLE public.semana;
       public         heap    postgres    false            �           0    0    TABLE semana    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.semana TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.semana TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.semana TO "siscope-dev";
          public          postgres    false    237            �            1259    17175    tarifario_camara    TABLE     �   CREATE TABLE public.tarifario_camara (
    cod_ubigeo character varying(10) NOT NULL,
    placa character(10) NOT NULL,
    id_dia integer NOT NULL,
    id_moneda integer,
    monto numeric(10,2),
    estado boolean,
    estado_reg boolean
);
 $   DROP TABLE public.tarifario_camara;
       public         heap    postgres    false            �           0    0    TABLE tarifario_camara    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_camara TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tarifario_camara TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_camara TO "siscope-dev";
          public          postgres    false    238            �            1259    17178    tarifario_embarcacion    TABLE       CREATE TABLE public.tarifario_embarcacion (
    id_dia integer NOT NULL,
    id_embarcacion integer NOT NULL,
    id_proveedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL,
    id_moneda integer,
    monto numeric(10,2),
    estado boolean,
    estado_reg boolean
);
 )   DROP TABLE public.tarifario_embarcacion;
       public         heap    postgres    false            �           0    0    TABLE tarifario_embarcacion    ACL       GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_embarcacion TO "siscope-dev";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_embarcacion TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tarifario_embarcacion TO "siscope-tarifario";
          public          postgres    false    239            �            1259    17434    tarifario_flete    TABLE     3  CREATE TABLE public.tarifario_flete (
    cod_ubigeo_origen character varying(10) DEFAULT 'A021801'::character varying NOT NULL,
    cod_ubigeo_destino character varying(10) NOT NULL,
    id_dia integer NOT NULL,
    id_moneda integer,
    monto numeric(10,2),
    estado boolean,
    estado_reg boolean
);
 #   DROP TABLE public.tarifario_flete;
       public         heap    postgres    false            �           0    0    TABLE tarifario_flete    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_flete TO "siscope-dev";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_flete TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tarifario_flete TO "siscope-tarifario";
          public          postgres    false    250            �            1259    17181    tarifario_general    TABLE     �   CREATE TABLE public.tarifario_general (
    id_proveedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL,
    id_dia integer NOT NULL,
    id_moneda integer,
    monto numeric(10,2),
    estado boolean,
    estado_reg boolean
);
 %   DROP TABLE public.tarifario_general;
       public         heap    postgres    false            �           0    0    TABLE tarifario_general    ACL       GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_general TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tarifario_general TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_general TO "siscope-dev";
          public          postgres    false    240            �            1259    17184    tarifario_muelle    TABLE       CREATE TABLE public.tarifario_muelle (
    id_proveedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL,
    id_tipo_sub_servicio integer NOT NULL,
    id_dia integer NOT NULL,
    id_moneda integer,
    monto numeric(10,2),
    estado boolean,
    estado_reg boolean
);
 $   DROP TABLE public.tarifario_muelle;
       public         heap    postgres    false            �           0    0    TABLE tarifario_muelle    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_muelle TO "siscope-dev";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_muelle TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tarifario_muelle TO "siscope-tarifario";
          public          postgres    false    241            �            1259    17187    tarifario_planta    TABLE       CREATE TABLE public.tarifario_planta (
    id_dia integer NOT NULL,
    id_planta integer NOT NULL,
    id_proveedor integer NOT NULL,
    id_tipo_servicio integer NOT NULL,
    id_moneda integer,
    monto numeric(10,2),
    estado boolean,
    estado_reg boolean
);
 $   DROP TABLE public.tarifario_planta;
       public         heap    postgres    false            �           0    0    COLUMN tarifario_planta.id_dia    COMMENT     K   COMMENT ON COLUMN public.tarifario_planta.id_dia IS 'El dia de la tarifa';
          public          postgres    false    242                        0    0    TABLE tarifario_planta    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_planta TO "siscope-dev";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tarifario_planta TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tarifario_planta TO "siscope-tarifario";
          public          postgres    false    242            �            1259    17190    tipo_cambio    TABLE     �   CREATE TABLE public.tipo_cambio (
    id_tipocambio integer NOT NULL,
    id_moneda_orig integer NOT NULL,
    id_moneda_dest integer NOT NULL,
    valor numeric(10,2) NOT NULL
);
    DROP TABLE public.tipo_cambio;
       public         heap    postgres    false                       0    0    TABLE tipo_cambio    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_cambio TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tipo_cambio TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_cambio TO "siscope-dev";
          public          postgres    false    243            �            1259    17193    tipo_documento    TABLE     �   CREATE TABLE public.tipo_documento (
    id_tipodoc integer NOT NULL,
    nombre character varying(30) NOT NULL,
    abreviatura character varying(15) NOT NULL,
    longitud integer,
    tipo character(1),
    estado boolean,
    estado_reg boolean
);
 "   DROP TABLE public.tipo_documento;
       public         heap    postgres    false                       0    0     COLUMN tipo_documento.estado_reg    COMMENT     R   COMMENT ON COLUMN public.tipo_documento.estado_reg IS '1 = Activo
0 = Eliminado';
          public          postgres    false    244                       0    0    TABLE tipo_documento    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_documento TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tipo_documento TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_documento TO "siscope-dev";
          public          postgres    false    244            �            1259    17196    tipo_servicio    TABLE     �   CREATE TABLE public.tipo_servicio (
    id_tipo_servicio integer NOT NULL,
    tipo_tarifa integer,
    nombre character varying(100) NOT NULL,
    id_um integer NOT NULL,
    estado boolean,
    estado_reg boolean
);
 !   DROP TABLE public.tipo_servicio;
       public         heap    postgres    false                       0    0    TABLE tipo_servicio    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_servicio TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.tipo_servicio TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.tipo_servicio TO "siscope-dev";
          public          postgres    false    245            �            1259    17203 
   trabajador    TABLE     �  CREATE TABLE public.trabajador (
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
    DROP TABLE public.trabajador;
       public         heap    postgres    false                       0    0    COLUMN trabajador.cta_bancaria    COMMENT     G   COMMENT ON COLUMN public.trabajador.cta_bancaria IS 'Cuenta Bancaria';
          public          postgres    false    246                       0    0    TABLE trabajador    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.trabajador TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.trabajador TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.trabajador TO "siscope-dev";
          public          postgres    false    246            �            1259    17206    ubigeo    TABLE     %  CREATE TABLE public.ubigeo (
    cod_ubigeo character varying(10) NOT NULL,
    departamento character varying(50),
    provincia character varying(50),
    distrito character varying(50),
    superficie numeric(10,4),
    posx numeric(10,4),
    posy numeric(10,4),
    estado_reg boolean
);
    DROP TABLE public.ubigeo;
       public         heap    postgres    false                       0    0    TABLE ubigeo    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.ubigeo TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.ubigeo TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.ubigeo TO "siscope-dev";
          public          postgres    false    247            �            1259    17209    unidad_medida    TABLE     �   CREATE TABLE public.unidad_medida (
    id_um integer NOT NULL,
    nombre character varying(30) NOT NULL,
    abreviatura character varying(5) NOT NULL,
    estado boolean,
    estado_reg boolean
);
 !   DROP TABLE public.unidad_medida;
       public         heap    postgres    false                       0    0    TABLE unidad_medida    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.unidad_medida TO "siscope-main";
GRANT SELECT,INSERT,UPDATE ON TABLE public.unidad_medida TO "siscope-tarifario";
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.unidad_medida TO "siscope-dev";
          public          postgres    false    248            �          0    17116    banco 
   TABLE DATA                 public          postgres    false    215   ��       �          0    17119    camara 
   TABLE DATA                 public          postgres    false    216   �       �          0    17122    cliente 
   TABLE DATA                 public          postgres    false    217   ��       �          0    17125    destino 
   TABLE DATA                 public          postgres    false    218   �       �          0    17129 
   dia_semana 
   TABLE DATA                 public          postgres    false    220   ��       �          0    17132    dual 
   TABLE DATA                 public          postgres    false    221   �      �          0    17135    embarcacion 
   TABLE DATA                 public          postgres    false    222   &      �          0    17139    emp_proveedor 
   TABLE DATA                 public          postgres    false    224   �      �          0    17143 
   forma_pago 
   TABLE DATA                 public          postgres    false    226   �      �          0    17146    moneda 
   TABLE DATA                 public          postgres    false    227   ;      �          0    17149    planta 
   TABLE DATA                 public          postgres    false    228   �      �          0    17153 	   proveedor 
   TABLE DATA                 public          postgres    false    230   �      �          0    17157    rel_embarcacion_proveedor 
   TABLE DATA                 public          postgres    false    232   /      �          0    17160    rel_planta_cliente 
   TABLE DATA                 public          postgres    false    233   �      �          0    17163    rel_planta_destino 
   TABLE DATA                 public          postgres    false    234   m      �          0    17166    rel_planta_proveedor 
   TABLE DATA                 public          postgres    false    235   �      �          0    17169    rel_prov_tiposerv 
   TABLE DATA                 public          postgres    false    236   ]      �          0    17414    rel_proveedor_cuenta 
   TABLE DATA                 public          postgres    false    249   8      �          0    17172    semana 
   TABLE DATA                 public          postgres    false    237   �      �          0    17175    tarifario_camara 
   TABLE DATA                 public          postgres    false    238   
!      �          0    17178    tarifario_embarcacion 
   TABLE DATA                 public          postgres    false    239   $!      �          0    17434    tarifario_flete 
   TABLE DATA                 public          postgres    false    250   I"      �          0    17181    tarifario_general 
   TABLE DATA                 public          postgres    false    240   a#      �          0    17184    tarifario_muelle 
   TABLE DATA                 public          postgres    false    241   �'      �          0    17187    tarifario_planta 
   TABLE DATA                 public          postgres    false    242   �'      �          0    17190    tipo_cambio 
   TABLE DATA                 public          postgres    false    243   �(      �          0    17193    tipo_documento 
   TABLE DATA                 public          postgres    false    244   �(      �          0    17196    tipo_servicio 
   TABLE DATA                 public          postgres    false    245   *      �          0    17203 
   trabajador 
   TABLE DATA                 public          postgres    false    246   �+      �          0    17206    ubigeo 
   TABLE DATA                 public          postgres    false    247   S,      �          0    17209    unidad_medida 
   TABLE DATA                 public          postgres    false    248   ��      	           0    0    destino_id_destino_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.destino_id_destino_seq', 2, true);
          public          postgres    false    219            
           0    0    embarcacion_id_embarcacion_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.embarcacion_id_embarcacion_seq', 11, true);
          public          postgres    false    223                       0    0    emp_proveedor_id_proveedor_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.emp_proveedor_id_proveedor_seq', 1, false);
          public          postgres    false    225                       0    0    planta_id_planta_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.planta_id_planta_seq', 9, true);
          public          postgres    false    229                       0    0    proveedor_id_proveedor_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.proveedor_id_proveedor_seq', 23, true);
          public          postgres    false    231            �           2606    17213    banco banco_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_pk PRIMARY KEY (id_banco);
 8   ALTER TABLE ONLY public.banco DROP CONSTRAINT banco_pk;
       public            postgres    false    215            �           2606    17215    camara camara_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.camara
    ADD CONSTRAINT camara_pk PRIMARY KEY (placa);
 :   ALTER TABLE ONLY public.camara DROP CONSTRAINT camara_pk;
       public            postgres    false    216            �           2606    17217    cliente cliente_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pk PRIMARY KEY (ruc);
 <   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pk;
       public            postgres    false    217            �           2606    17219    destino destino_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.destino
    ADD CONSTRAINT destino_pk PRIMARY KEY (id_destino);
 <   ALTER TABLE ONLY public.destino DROP CONSTRAINT destino_pk;
       public            postgres    false    218            �           2606    17221    dia_semana dia_semana_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.dia_semana
    ADD CONSTRAINT dia_semana_pk PRIMARY KEY (id_dia);
 B   ALTER TABLE ONLY public.dia_semana DROP CONSTRAINT dia_semana_pk;
       public            postgres    false    220            �           2606    17223    embarcacion embarcacion_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.embarcacion
    ADD CONSTRAINT embarcacion_pk PRIMARY KEY (id_embarcacion);
 D   ALTER TABLE ONLY public.embarcacion DROP CONSTRAINT embarcacion_pk;
       public            postgres    false    222            �           2606    17225    emp_proveedor emp_proveedor_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.emp_proveedor
    ADD CONSTRAINT emp_proveedor_pk PRIMARY KEY (id_proveedor, id_tipodoc, numero_documento);
 H   ALTER TABLE ONLY public.emp_proveedor DROP CONSTRAINT emp_proveedor_pk;
       public            postgres    false    224    224    224            �           2606    17227    forma_pago forma_pago_pk 
   CONSTRAINT     a   ALTER TABLE ONLY public.forma_pago
    ADD CONSTRAINT forma_pago_pk PRIMARY KEY (id_forma_pago);
 B   ALTER TABLE ONLY public.forma_pago DROP CONSTRAINT forma_pago_pk;
       public            postgres    false    226            �           2606    17229    moneda moneda_pk 
   CONSTRAINT     U   ALTER TABLE ONLY public.moneda
    ADD CONSTRAINT moneda_pk PRIMARY KEY (id_moneda);
 :   ALTER TABLE ONLY public.moneda DROP CONSTRAINT moneda_pk;
       public            postgres    false    227            �           2606    17231    planta planta_pk 
   CONSTRAINT     U   ALTER TABLE ONLY public.planta
    ADD CONSTRAINT planta_pk PRIMARY KEY (id_planta);
 :   ALTER TABLE ONLY public.planta DROP CONSTRAINT planta_pk;
       public            postgres    false    228            �           2606    17233 (   rel_planta_proveedor planta_proveedor_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.rel_planta_proveedor
    ADD CONSTRAINT planta_proveedor_pk PRIMARY KEY (id_planta, id_proveedor, id_tipo_servicio);
 R   ALTER TABLE ONLY public.rel_planta_proveedor DROP CONSTRAINT planta_proveedor_pk;
       public            postgres    false    235    235    235                       2606    17418 %   rel_proveedor_cuenta proveedor_cta_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.rel_proveedor_cuenta
    ADD CONSTRAINT proveedor_cta_pk PRIMARY KEY (id_proveedor, id_banco, numero_cuenta);
 O   ALTER TABLE ONLY public.rel_proveedor_cuenta DROP CONSTRAINT proveedor_cta_pk;
       public            postgres    false    249    249    249            �           2606    17235    proveedor proveedor_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pk PRIMARY KEY (id_proveedor);
 @   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT proveedor_pk;
       public            postgres    false    230            �           2606    17237 6   rel_embarcacion_proveedor rel_embarcacion_proveedor_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.rel_embarcacion_proveedor
    ADD CONSTRAINT rel_embarcacion_proveedor_pk PRIMARY KEY (id_embarcacion, id_proovedor, id_tipo_servicio);
 `   ALTER TABLE ONLY public.rel_embarcacion_proveedor DROP CONSTRAINT rel_embarcacion_proveedor_pk;
       public            postgres    false    232    232    232            �           2606    17239 (   rel_planta_cliente rel_planta_cliente_pk 
   CONSTRAINT     r   ALTER TABLE ONLY public.rel_planta_cliente
    ADD CONSTRAINT rel_planta_cliente_pk PRIMARY KEY (ruc, id_planta);
 R   ALTER TABLE ONLY public.rel_planta_cliente DROP CONSTRAINT rel_planta_cliente_pk;
       public            postgres    false    233    233            �           2606    17241 (   rel_planta_destino rel_planta_destino_pk 
   CONSTRAINT     y   ALTER TABLE ONLY public.rel_planta_destino
    ADD CONSTRAINT rel_planta_destino_pk PRIMARY KEY (id_planta, id_destino);
 R   ALTER TABLE ONLY public.rel_planta_destino DROP CONSTRAINT rel_planta_destino_pk;
       public            postgres    false    234    234            �           2606    17243 &   rel_prov_tiposerv rel_prov_tiposerv_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.rel_prov_tiposerv
    ADD CONSTRAINT rel_prov_tiposerv_pk PRIMARY KEY (id_proveedor, id_tipo_servicio);
 P   ALTER TABLE ONLY public.rel_prov_tiposerv DROP CONSTRAINT rel_prov_tiposerv_pk;
       public            postgres    false    236    236            �           2606    17245    semana semana_pk 
   CONSTRAINT     U   ALTER TABLE ONLY public.semana
    ADD CONSTRAINT semana_pk PRIMARY KEY (id_semana);
 :   ALTER TABLE ONLY public.semana DROP CONSTRAINT semana_pk;
       public            postgres    false    237            �           2606    17247 $   tarifario_camara tarifario_camara_pk 
   CONSTRAINT     y   ALTER TABLE ONLY public.tarifario_camara
    ADD CONSTRAINT tarifario_camara_pk PRIMARY KEY (id_dia, cod_ubigeo, placa);
 N   ALTER TABLE ONLY public.tarifario_camara DROP CONSTRAINT tarifario_camara_pk;
       public            postgres    false    238    238    238            �           2606    17249 .   tarifario_embarcacion tarifario_embarcacion_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.tarifario_embarcacion
    ADD CONSTRAINT tarifario_embarcacion_pk PRIMARY KEY (id_dia, id_tipo_servicio, id_proveedor, id_embarcacion);
 X   ALTER TABLE ONLY public.tarifario_embarcacion DROP CONSTRAINT tarifario_embarcacion_pk;
       public            postgres    false    239    239    239    239                       2606    17439 "   tarifario_flete tarifario_flete_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.tarifario_flete
    ADD CONSTRAINT tarifario_flete_pk PRIMARY KEY (cod_ubigeo_origen, cod_ubigeo_destino, id_dia);
 L   ALTER TABLE ONLY public.tarifario_flete DROP CONSTRAINT tarifario_flete_pk;
       public            postgres    false    250    250    250            �           2606    17251 &   tarifario_general tarifario_general_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.tarifario_general
    ADD CONSTRAINT tarifario_general_pk PRIMARY KEY (id_proveedor, id_tipo_servicio, id_dia);
 P   ALTER TABLE ONLY public.tarifario_general DROP CONSTRAINT tarifario_general_pk;
       public            postgres    false    240    240    240            �           2606    17253 $   tarifario_muelle tarifario_muelle_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.tarifario_muelle
    ADD CONSTRAINT tarifario_muelle_pk PRIMARY KEY (id_proveedor, id_tipo_servicio, id_tipo_sub_servicio, id_dia);
 N   ALTER TABLE ONLY public.tarifario_muelle DROP CONSTRAINT tarifario_muelle_pk;
       public            postgres    false    241    241    241    241            �           2606    17255 $   tarifario_planta tarifario_planta_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.tarifario_planta
    ADD CONSTRAINT tarifario_planta_pk PRIMARY KEY (id_dia, id_planta, id_proveedor, id_tipo_servicio);
 N   ALTER TABLE ONLY public.tarifario_planta DROP CONSTRAINT tarifario_planta_pk;
       public            postgres    false    242    242    242    242            �           2606    17257    tipo_cambio tipo_cambio_pk 
   CONSTRAINT     s   ALTER TABLE ONLY public.tipo_cambio
    ADD CONSTRAINT tipo_cambio_pk PRIMARY KEY (id_tipocambio, id_moneda_dest);
 D   ALTER TABLE ONLY public.tipo_cambio DROP CONSTRAINT tipo_cambio_pk;
       public            postgres    false    243    243            �           2606    17259     tipo_documento tipo_documento_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_pk PRIMARY KEY (id_tipodoc);
 J   ALTER TABLE ONLY public.tipo_documento DROP CONSTRAINT tipo_documento_pk;
       public            postgres    false    244            �           2606    17261    tipo_servicio tipo_servicio_pk 
   CONSTRAINT     j   ALTER TABLE ONLY public.tipo_servicio
    ADD CONSTRAINT tipo_servicio_pk PRIMARY KEY (id_tipo_servicio);
 H   ALTER TABLE ONLY public.tipo_servicio DROP CONSTRAINT tipo_servicio_pk;
       public            postgres    false    245                        2606    17265    trabajador trabajador_pk 
   CONSTRAINT     p   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_pk PRIMARY KEY (id_tipodoc, numero_documento);
 B   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_pk;
       public            postgres    false    246    246                       2606    17267    ubigeo ubigeo_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.ubigeo
    ADD CONSTRAINT ubigeo_pk PRIMARY KEY (cod_ubigeo);
 :   ALTER TABLE ONLY public.ubigeo DROP CONSTRAINT ubigeo_pk;
       public            postgres    false    247                       2606    17269    unidad_medida unidad_medida_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public.unidad_medida
    ADD CONSTRAINT unidad_medida_pk PRIMARY KEY (id_um);
 H   ALTER TABLE ONLY public.unidad_medida DROP CONSTRAINT unidad_medida_pk;
       public            postgres    false    248            �           1259    17445    proveedor_idx    INDEX     {   CREATE INDEX proveedor_idx ON public.proveedor USING btree (id_tipodoc, numero_documento) WITH (deduplicate_items='true');
 !   DROP INDEX public.proveedor_idx;
       public            postgres    false    230    230            	           2606    17271    camara camara_proveedor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.camara
    ADD CONSTRAINT camara_proveedor_fk FOREIGN KEY (id_proveedor) REFERENCES public.proveedor(id_proveedor);
 D   ALTER TABLE ONLY public.camara DROP CONSTRAINT camara_proveedor_fk;
       public          postgres    false    3298    216    230            
           2606    17276 )   dia_semana dia_semana_semana_id_semana_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.dia_semana
    ADD CONSTRAINT dia_semana_semana_id_semana_fk FOREIGN KEY (id_semana) REFERENCES public.semana(id_semana);
 S   ALTER TABLE ONLY public.dia_semana DROP CONSTRAINT dia_semana_semana_id_semana_fk;
       public          postgres    false    237    3310    220                       2606    17281 $   embarcacion embarcacion_proveedor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.embarcacion
    ADD CONSTRAINT embarcacion_proveedor_fk FOREIGN KEY (id_proveedor) REFERENCES public.proveedor(id_proveedor);
 N   ALTER TABLE ONLY public.embarcacion DROP CONSTRAINT embarcacion_proveedor_fk;
       public          postgres    false    230    3298    222                       2606    17286 (   emp_proveedor emp_proveedor_proveedor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.emp_proveedor
    ADD CONSTRAINT emp_proveedor_proveedor_fk FOREIGN KEY (id_proveedor) REFERENCES public.proveedor(id_proveedor);
 R   ALTER TABLE ONLY public.emp_proveedor DROP CONSTRAINT emp_proveedor_proveedor_fk;
       public          postgres    false    230    224    3298                       2606    17291 -   emp_proveedor emp_proveedor_tipo_documento_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.emp_proveedor
    ADD CONSTRAINT emp_proveedor_tipo_documento_fk FOREIGN KEY (id_tipodoc) REFERENCES public.tipo_documento(id_tipodoc);
 W   ALTER TABLE ONLY public.emp_proveedor DROP CONSTRAINT emp_proveedor_tipo_documento_fk;
       public          postgres    false    244    3324    224                       2606    17296 /   rel_planta_proveedor planta_proveedor_planta_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_planta_proveedor
    ADD CONSTRAINT planta_proveedor_planta_fk FOREIGN KEY (id_planta) REFERENCES public.planta(id_planta);
 Y   ALTER TABLE ONLY public.rel_planta_proveedor DROP CONSTRAINT planta_proveedor_planta_fk;
       public          postgres    false    228    3295    235                       2606    17301 :   rel_planta_proveedor planta_proveedor_rel_prov_tiposerv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_planta_proveedor
    ADD CONSTRAINT planta_proveedor_rel_prov_tiposerv_fk FOREIGN KEY (id_proveedor, id_tipo_servicio) REFERENCES public.rel_prov_tiposerv(id_proveedor, id_tipo_servicio);
 d   ALTER TABLE ONLY public.rel_planta_proveedor DROP CONSTRAINT planta_proveedor_rel_prov_tiposerv_fk;
       public          postgres    false    3308    235    235    236    236                       2606    17306    planta planta_ubigeo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.planta
    ADD CONSTRAINT planta_ubigeo_fk FOREIGN KEY (cod_ubigeo) REFERENCES public.ubigeo(cod_ubigeo);
 A   ALTER TABLE ONLY public.planta DROP CONSTRAINT planta_ubigeo_fk;
       public          postgres    false    228    247    3330            $           2606    17419 4   rel_proveedor_cuenta proveedor_cta_banco_id_banco_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_proveedor_cuenta
    ADD CONSTRAINT proveedor_cta_banco_id_banco_fk FOREIGN KEY (id_banco) REFERENCES public.banco(id_banco);
 ^   ALTER TABLE ONLY public.rel_proveedor_cuenta DROP CONSTRAINT proveedor_cta_banco_id_banco_fk;
       public          postgres    false    3277    249    215            %           2606    17424 6   rel_proveedor_cuenta proveedor_cta_moneda_id_moneda_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_proveedor_cuenta
    ADD CONSTRAINT proveedor_cta_moneda_id_moneda_fk FOREIGN KEY (id_moneda) REFERENCES public.moneda(id_moneda);
 `   ALTER TABLE ONLY public.rel_proveedor_cuenta DROP CONSTRAINT proveedor_cta_moneda_id_moneda_fk;
       public          postgres    false    249    227    3293            &           2606    17429 <   rel_proveedor_cuenta proveedor_cta_proveedor_id_proveedor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_proveedor_cuenta
    ADD CONSTRAINT proveedor_cta_proveedor_id_proveedor_fk FOREIGN KEY (id_proveedor) REFERENCES public.proveedor(id_proveedor);
 f   ALTER TABLE ONLY public.rel_proveedor_cuenta DROP CONSTRAINT proveedor_cta_proveedor_id_proveedor_fk;
       public          postgres    false    230    249    3298                       2606    17311 B   rel_embarcacion_proveedor rel_embarcacion_proveedor_embarcacion_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_embarcacion_proveedor
    ADD CONSTRAINT rel_embarcacion_proveedor_embarcacion_fk FOREIGN KEY (id_embarcacion) REFERENCES public.embarcacion(id_embarcacion);
 l   ALTER TABLE ONLY public.rel_embarcacion_proveedor DROP CONSTRAINT rel_embarcacion_proveedor_embarcacion_fk;
       public          postgres    false    3287    232    222                       2606    17316 H   rel_embarcacion_proveedor rel_embarcacion_proveedor_rel_prov_tiposerv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_embarcacion_proveedor
    ADD CONSTRAINT rel_embarcacion_proveedor_rel_prov_tiposerv_fk FOREIGN KEY (id_proovedor, id_tipo_servicio) REFERENCES public.rel_prov_tiposerv(id_proveedor, id_tipo_servicio);
 r   ALTER TABLE ONLY public.rel_embarcacion_proveedor DROP CONSTRAINT rel_embarcacion_proveedor_rel_prov_tiposerv_fk;
       public          postgres    false    232    232    3308    236    236                       2606    17321 4   rel_planta_cliente rel_planta_cliente_cliente_ruc_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_planta_cliente
    ADD CONSTRAINT rel_planta_cliente_cliente_ruc_fk FOREIGN KEY (ruc) REFERENCES public.cliente(ruc);
 ^   ALTER TABLE ONLY public.rel_planta_cliente DROP CONSTRAINT rel_planta_cliente_cliente_ruc_fk;
       public          postgres    false    217    3281    233                       2606    17326 9   rel_planta_cliente rel_planta_cliente_planta_id_planta_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_planta_cliente
    ADD CONSTRAINT rel_planta_cliente_planta_id_planta_fk FOREIGN KEY (id_planta) REFERENCES public.planta(id_planta);
 c   ALTER TABLE ONLY public.rel_planta_cliente DROP CONSTRAINT rel_planta_cliente_planta_id_planta_fk;
       public          postgres    false    3295    233    228                       2606    17331 0   rel_planta_destino rel_planta_destino_destino_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_planta_destino
    ADD CONSTRAINT rel_planta_destino_destino_fk FOREIGN KEY (id_destino) REFERENCES public.destino(id_destino);
 Z   ALTER TABLE ONLY public.rel_planta_destino DROP CONSTRAINT rel_planta_destino_destino_fk;
       public          postgres    false    218    3283    234                       2606    17336 /   rel_planta_destino rel_planta_destino_planta_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_planta_destino
    ADD CONSTRAINT rel_planta_destino_planta_fk FOREIGN KEY (id_planta) REFERENCES public.planta(id_planta);
 Y   ALTER TABLE ONLY public.rel_planta_destino DROP CONSTRAINT rel_planta_destino_planta_fk;
       public          postgres    false    234    228    3295                       2606    17341 0   rel_prov_tiposerv rel_prov_tiposerv_proveedor_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_prov_tiposerv
    ADD CONSTRAINT rel_prov_tiposerv_proveedor_fk FOREIGN KEY (id_proveedor) REFERENCES public.proveedor(id_proveedor);
 Z   ALTER TABLE ONLY public.rel_prov_tiposerv DROP CONSTRAINT rel_prov_tiposerv_proveedor_fk;
       public          postgres    false    236    230    3298                       2606    17346 4   rel_prov_tiposerv rel_prov_tiposerv_tipo_servicio_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.rel_prov_tiposerv
    ADD CONSTRAINT rel_prov_tiposerv_tipo_servicio_fk FOREIGN KEY (id_tipo_servicio) REFERENCES public.tipo_servicio(id_tipo_servicio);
 ^   ALTER TABLE ONLY public.rel_prov_tiposerv DROP CONSTRAINT rel_prov_tiposerv_tipo_servicio_fk;
       public          postgres    false    236    245    3326                       2606    17351 6   tarifario_camara tarifario_camara_dia_semana_id_dia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarifario_camara
    ADD CONSTRAINT tarifario_camara_dia_semana_id_dia_fk FOREIGN KEY (id_dia) REFERENCES public.dia_semana(id_dia);
 `   ALTER TABLE ONLY public.tarifario_camara DROP CONSTRAINT tarifario_camara_dia_semana_id_dia_fk;
       public          postgres    false    220    3285    238                       2606    17356 @   tarifario_embarcacion tarifario_embarcacion_dia_semana_id_dia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarifario_embarcacion
    ADD CONSTRAINT tarifario_embarcacion_dia_semana_id_dia_fk FOREIGN KEY (id_dia) REFERENCES public.dia_semana(id_dia);
 j   ALTER TABLE ONLY public.tarifario_embarcacion DROP CONSTRAINT tarifario_embarcacion_dia_semana_id_dia_fk;
       public          postgres    false    3285    239    220            '           2606    17440 4   tarifario_flete tarifario_flete_dia_semana_id_dia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarifario_flete
    ADD CONSTRAINT tarifario_flete_dia_semana_id_dia_fk FOREIGN KEY (id_dia) REFERENCES public.dia_semana(id_dia);
 ^   ALTER TABLE ONLY public.tarifario_flete DROP CONSTRAINT tarifario_flete_dia_semana_id_dia_fk;
       public          postgres    false    3285    220    250                       2606    17361 -   tarifario_general tarifario_general_semana_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarifario_general
    ADD CONSTRAINT tarifario_general_semana_fk FOREIGN KEY (id_dia) REFERENCES public.dia_semana(id_dia);
 W   ALTER TABLE ONLY public.tarifario_general DROP CONSTRAINT tarifario_general_semana_fk;
       public          postgres    false    3285    240    220                       2606    17366 6   tarifario_muelle tarifario_muelle_dia_semana_id_dia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarifario_muelle
    ADD CONSTRAINT tarifario_muelle_dia_semana_id_dia_fk FOREIGN KEY (id_dia) REFERENCES public.dia_semana(id_dia);
 `   ALTER TABLE ONLY public.tarifario_muelle DROP CONSTRAINT tarifario_muelle_dia_semana_id_dia_fk;
       public          postgres    false    3285    241    220                       2606    17371 6   tarifario_planta tarifario_planta_dia_semana_id_dia_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarifario_planta
    ADD CONSTRAINT tarifario_planta_dia_semana_id_dia_fk FOREIGN KEY (id_dia) REFERENCES public.dia_semana(id_dia);
 `   ALTER TABLE ONLY public.tarifario_planta DROP CONSTRAINT tarifario_planta_dia_semana_id_dia_fk;
       public          postgres    false    220    3285    242                       2606    17376 !   tipo_cambio tipo_cambio_moneda_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tipo_cambio
    ADD CONSTRAINT tipo_cambio_moneda_fk FOREIGN KEY (id_moneda_orig) REFERENCES public.moneda(id_moneda);
 K   ALTER TABLE ONLY public.tipo_cambio DROP CONSTRAINT tipo_cambio_moneda_fk;
       public          postgres    false    243    227    3293                       2606    17381 ,   tipo_servicio tipo_servicio_unidad_medida_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tipo_servicio
    ADD CONSTRAINT tipo_servicio_unidad_medida_fk FOREIGN KEY (id_um) REFERENCES public.unidad_medida(id_um);
 V   ALTER TABLE ONLY public.tipo_servicio DROP CONSTRAINT tipo_servicio_unidad_medida_fk;
       public          postgres    false    245    3332    248                        2606    17391    trabajador trabajador_banco_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_banco_fk FOREIGN KEY (id_banco) REFERENCES public.banco(id_banco);
 H   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_banco_fk;
       public          postgres    false    3277    246    215            !           2606    17396 #   trabajador trabajador_forma_pago_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_forma_pago_fk FOREIGN KEY (id_forma_pago) REFERENCES public.forma_pago(id_forma_pago);
 M   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_forma_pago_fk;
       public          postgres    false    246    226    3291            "           2606    17401    trabajador trabajador_moneda_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_moneda_fk FOREIGN KEY (id_moneda) REFERENCES public.moneda(id_moneda);
 I   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_moneda_fk;
       public          postgres    false    3293    227    246            #           2606    17406 '   trabajador trabajador_tipo_documento_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_tipo_documento_fk FOREIGN KEY (id_tipodoc) REFERENCES public.tipo_documento(id_tipodoc);
 Q   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_tipo_documento_fk;
       public          postgres    false    3324    244    246            �     x���Mo1�;�bn	!����Y�-S����F��($���&M�mSoC�.�^x4�xg����i�¯�����������O�w���_~�t��z�8|��'p������*Ԣ��a�\{5������9�<��*�^DU����bE(��E^���K-���6�b^���3�4zR��F��T�y����x��UQ��ds����kf�_�t$֤Śyò|uJb�,j�z%0�semaMƝ4���#�Q�C���C�т(�ΘՐ2]�e!^�ha��+R����æ��;���$sw��S��ZH�T�A�uM��q��6ԫ7�jq��Z
GܳM^����[�{��3��.ry�n��-3�G4(@��;~�넡�۞:���I���䦙�b��Эb{f��{fp���'�wiE��i��Z���}�F��Ɩ	s(�/�&��_I)��8䉢����%&��s��Wp�Ѣ�'V��)���W����v�y�<���5��F�E���!��|�F�?sk�(      �   �   x�ő�j�@��y���[��"�x
�U�!ۚ�ǰ&�(�[��k[{+�=�0?3��|LV�rU!+*����Ͱ�'�4��Ӎ&�_a[�Ys4���Zw[��uk�vf?�&�ײD
&�@H.�~�Iͧ)c�l�b'`gw1�}0	���M�Ɯ��J̤��xQ�K��&����ި|Yn��,|d�ː�(RU���sYe�����D5��      �   
  x������0��Oqw�P$�D#]Ř�1���e�E�����'v�@�>.�Q�K7�2�����~���~��3잯� ���s�Å� =�R�JTyMi� ������s�ZE�Bt!�.�:��9�r��l�M�9"Z�F��qU@*�ת��X��X��t^Y�m�B�*�r��d.�zg� �%崬���Z�*v��p�pd���P'%�������4�x��!R��۩��Ȼ&.h����uvѓ�؆��      �   �   x���v
Q���W((M��L�KI-.���W��L���u��s��Ru�dYfbIiQ��P21%F���k*���y�x��+G���*�9���B�`CuG?gGuK �K�JS!��5�'��ht��?��0�#AlB��� �`�      �      x�ŝ��f�uE�~�����־�V n(86D���t!XR�%�f��/�}T��,��V4ԑT�Ti�b�3@�����۟�}��?������_?|�_~x������7����×���ɻ���?�ɻo��������_����?|�݇�����߾��?����ٻ��+����'�>��'�~������w?�����������>����B�����1~����?�}��_F��`��/?~�_�/�(���w���/C1�g�����-�
�?���o��[�b�Qz��P`��^����
v�-
v�-w���V���$o��B���ܭ����)حƫPp��``�z>;y���������՘����U(�[���U=����|
�V�U
�V�U1�[+��jX!�V�
a��V�հB�୆�dou�VO��n�
a��j�0�[�BX�Z!,�Vmz�V��U+����*���ݪ��Mު�&o�a��j���[�B��Z!l�V�6y�V��U(�[ݕ���S0�[M���jz5�Vӳ����Z��0�n5����n5��?RP����?ap��w��Pp����v�Z͍�R����Rj57�[J��FvK����n)���-�fs#���jnd��Z͍�R����Rj67�[J��FvK����n)5��-�Vs#���jnd��Z��R����Rj57�[J}xoh������n�K!4�[�R�얺BC��n�@vK�
�얺�-u+�[�Vd�ԭ�n�� ��R�B ��n�@vK�
햺�-u+�[�Vd��m�n�[!��R�B ��n��vK�
�얺�-u+�[�6h�ԭ�n�[!��R�B@��n�@vK�
�얺�-ow�[�d�4<��nix�����x'����NvK�۝얆�;�-�w�[�d�4���nix�����x�[��AvKC�=�nih��-�� ����h�44ރ얆�{����v�[��vKC�=�nih��-m�@����d�44ރ얆�{����v�[�AvKC�����R`�:��얦B��ҔB�[�2�vKS
!�niJ!�-M)�@��)�d�4��얦B��ҔA�[�Vd�4��niZ!��ҴB ��i�@vK�
�얦�-M+�[�Vd�4��niZ!��ҴB ��i�@vK�햦�-M+�[�Vh�4��niy�����v'����vK��얖�;�--ow�[Z�d��<��niy�����vG����NvK��얖�;�--�w�[Z�d�����niy�����x'����NvK��햖�;�--��$����d����햖�{����xO�[Z��vKK�=�nii�'�--m�$������vK�U1�[�RIvK[
!�niK!$�-m)�$��-��d��e햶B��ҖBH�[�R�vK[
!�niK!$�-m)�$��-��h����얶B��ҖBH�[�RIvK[
!�niK!$�-m�D��m�@vK�
�얶�-m+�[�Vd����ni� ��ҶB ��m�@vK�
�ΫbP�z��n�X!��ұA@��c�@vK�
�얎�-+�[:Vd�t��n�� ��ұB ��c�@vK�
햎�-+�[:Vd�tl�n�X!��ұB ��c��vK�
�얎�-+�[:6h�t��n�X!��ұB@��c�@vKG
���R{i�w�[�Q)�[�Y0�[��P@�z)F��n�b̂��x{>;�-]�](�[=��U��vK��
�V��;�-]�,حj�w�[��P`�����n�b�����.ܭ�B�ݪ�{��K���.E
�V��;�-]�^0�[�x�`�t)f� ou�V�|��ҥ8��Uow�[��`P��^����f�@vK#u��
�.�(ԭ6�[��`p��w��Pp�j� vK�B�'�-]�(ح� ������U+�[��P���
w�z>�n�R�B�ݪ�-]�V0�[�B ��K����U+�[�z>�n�R�B���ܭ����)حZ!���}�[��n5<��n�Rd��n5���n�b��A�jx���ҥX���]0�[}{>�-��� ���vh���B�}��Rh��[
��AvK��>�n)���-���@���xd���B�}��Rh��[
��AvK��>�n)���-��� ���xd����B�}��R����B�\}��������s�~F�����Շ"s�E/Э>�`0��P�7
��Շb
�Vw��n��V۫P`��Z��n�E��n����z���
�Vۨح�Y0�[]����](�[=�������E+حFT
�V#v��v�1
w�1w�z>���؅���S)�[�B�z���
�V�U)�[+�~(�s=�C�u�a� ���,ԭ��?�P��z
v�V\�P�B�ݪ�?Y0�[�B�z��b
�V����������.ܭ�J�ݪ�?�P`�j� ��F�V������U�~0V��nu
�V�{��(ԭ��j�z���
�VS{��=��1u���ڸ��؅��S0�[�^m\��P�B�ݪ�jC���^md��ګ��R{���Rj�6�[J��FvK����n)�W�-��j#���^md��ګ�R{���Rj�6�[J��FvK����n)�W�-��j#���'�vK�Oލ�R���-�W��n�� 4�[�Vd�ԭ�n�[!��R�B ��n�@vK�
�얺�-u+�[�Vd�ԭ�n�[!��R�B ��n�@vK�햺�-u+�[�Vh�ԭ�n�[!��R�B ��n��vK�
�얺�-u+�[�Vd�ԭ�n�[!��R�A@����NvK��얆�;�-�w�[�d�4���nix�����x'����NvK��햆�;�-�� ����d�4��햆�{����x�[��vKC�=�nih��-m� ����h�44ރ얆�{����v�[�AvKC�=�nih��-m�@����d�44ރ얆>��-�WŠnuJ!�-M)� ��)�h�4��얦B��ҔB�[�RAvKS
!�niJ!�-M�@��i�@vK�
�얦�-M+�[�Vd�4��ni� ��ҴB ��i�@vK�
햦�-M+�[�Vd�4m�niZ!��ҴB ��i��vK�
�얦�--ow�[Z��h��<��niy�����vG����NvK��얖�;�--ow�[Z�d��<��niy�����x'����NvK�۝얖�;�--�w�[Z�d�����niy�����xO�[Z��IvKK�=�nii�'�--��$����h��4ޓ얖�{����vO�[Z��vKK������RP���햶B��ҖBH�[�RIvK[!�niK!$�-m)�$��-��h����얶B��ҖBH�[�2�vK[
!�niK!$�-m)�D��-��d����얶B��ҖAH�[�Vd����ni[!��ҶB ��m�@vK�
�얶�-m+�[�Vd����ni[!��ұB ��c�@vK�햎�-+�[:Vh�t��n�X!��ұB ��c��vK�
�얎�-+�[:Vd�t��n�X!��ұA@��c�@vK�
�얎�-+�[:Vd�t��n�� ��ұB ��c�@vK�
햎�-)�NvKG
���R{i�w�[�Q0�[�Y(�[��PP�z1F��n�R�=��.�*ܭ�J���)حj�w�[��Pp�����n�R����K�v����.�,ܭ�B���.୞��ݪ�{��K�
v����.F�V5�;�-]�Q(�[�x�`�t)�|��ҥ؅���S)�[�x��K�
u��U)�[mV`�t)��ҥ腂��f�@vKc�V��-]�](�[=�U+�[��P`�j�@vK#v�V`�t)F��n�
�.��O�[��Pp�z*v�V`�t)Z��n�
��.F�V��n�R�B�ݪ�-]�U0�[݅���S(�[�B ��������K�����v'����u���vK�b
�V���.���9�n�R�B�ݪ��@���xd���B�}��Rh��[
��AvK��>�n)   ���-��� ���xd����B�}��Rh��[
m�AvK��>�n)4��-��� ���vh����m�����n�m���n����s��'U�V�(̭>Y(�[}0z�`n5�[�/����o�G
�Vӿ#o̭>�`0��P�B���C�
t��.ܭ�7
��oV�#v�oR����Ֆ����w�m�V��O�~(V��nuW
�VO��n5^���h���Ո���j���z���
�VcT
�Vc�VW��nu
�VO��n5�|r=�C�
u��B�(�[+�~(�PP�V`�`��A�jX!p=�C�
w��Rp�z
v�V\�P�B�ݪ�?z>�����U�~0f��nu
�Vw� o��V����h��U�~0�``�j�����(ܭZ!p=�C��|6�~(v��n5�W�?Q0�[M�����E/ح��j�z�����h\��P�B���ܭ���ݪ�j㺥��
�V�W�-��j#���^md��ګ�R{���Rj�6�[J�ՆvK����n)�W�-��j#���^mh��ګ��R{���Rj�6�[J��FvK�JvK�JvK�/��R���-�>y7�[�J��j�B ��n�@vK�
�얺�-u+�[�Vd�ԭ�n�[!��R�B ��n�@vK�햺�-u+�[�Vh�ԭ�n�[!��R�B ��n��vK�
�얺�-u+�[�Vd�ԭ�n�[!��R�A@��n�@vK�
�얺�-u+�[�d�4���nix�����x'����NvK��햆�;�-�� ����d�4��햆�{����x�[��vKC�=�nih��-m� ����h�44ރ얆�{����v�[�AvKC�=�nih��-m�@����d�44ރ얆�{����x�[�AvKC�=�ni�����|U�V�B��ҔB�[�RAvKS
!�niJ!�-M�@��i�@vK�
�얦�-M+�[�Vd�4��ni� ��ҴB ��i�@vK�
햦�-M+�[�Vd�4m�niZ!��ҴB ��i��vK�
�얦�-M+�[�6h�4��niZ!����vG����NvK��얖�;�--ow�[Z�d��<��niy�����x'����NvK�۝얖�;�--�w�[Z�d�����niy�����xO�[Z��IvKK�=�nii�'�--��$����h��4ޓ얖�{����vO�[Z��vKK�=�nii�'�--m�D����d����?�ni�*u�[!�niK!$�-m)�$��-��h����얶B��ҖBH�[�2�vK[
!�niK!$�-m)�D��-��d����얶B��ҖAH�[�Vd����ni[!��ҶB ��m�@vK�
�얶�-m+�[�Vd����ni[!��ҶB ��m�@vK�햶�-�W��n�X!��ұB ��c�@vK�
�얎�-+�[:Vd�t��n�X!��ұB ��c�@vK�햎�-+�[:Vh�t��n�X!��ұB ��c��vK�
�얎�-+�[:Vd�t�:�-)�NvKG���ґB�d�t�:�-)�NvK�����n�R�=��.E
�V/E�Э^�Q0�[��P@�z)V� ou�V�|��R{i�w�[��R`�����n�Rd��nU۽�����U��vK�b
�Vw��n��V5�;�-]�V(�[�x�`�t)�|��ҥ��Uow�[��`p��
w��P��z
v��`�t)Z��n��~FA�j�B ��K�����f�@vKc�V��-]�U(�[ݕ���S0�[�B ��K�
w�V`�t)�|��ҥ��U�[��`p��
w��P��z
v�V`�t)Z��n���.F�V��n�R�B�ݪ�-]
=�`�t)v��n�T
�V��n��PP���d�t1�`P���.�(ԭ��� ����
w��Pp�z
w���B�}��Rh��[
m��vK��>�n)4��-���@���xd���B�}��Rh��[
��AvK��>�n)���-����?��_��9�(G      �   6   x���v
Q���W((M��L�K)M�Q�(K��/�Ts�	uV�0д��� Rl"      �   \  x�Ք�n�0��}
�h%� @��)�Y�BE��v�(�&�R*Vv߳��fJ7���;V�ȟ��\H���Eù��b��}�yQ�'��ݯ\��M��ԡnt8�վQ�jW嗦,�c�å>�c������k���-K��b�I�,�-3�{	c����頭i� c���95M��iU�'w#����u@��L�G`��h�տ	�sn�`Pд�]e2�v$��0�oc1
���*&
�Ϗ8��9�Rgf7�d��W�2sm{HR�~��<�7�q<kH$>�t�h�W�K���t�1G�o.�Mn�X|���;uX޵#�u�R�[�:�� 64�      �   
   x���          �      x���v
Q���W((M��L�K�/�M�/HL�W��L�Gpu��s��RuR�KS�at|Qj��B��O�k����������s�g����BIQi*�Դ��mF@�\\��=�F��)8����8���� �J      �   n   x���v
Q���W((M��L����KMIT��L��0u��s��Ru�dYfbIiQ��B��O�k������z���k�:�������i��I��F@�\�}� F�((@��� c_5�      �     x���͊�0�{��S��VwA�M����CЋ�)�V���7���� �C&C�Ïa&\�-��
ס<�Ut=�[�i[i�K�Y�M��훪j�K����Cٞ�.D�u+����7�Ԏi�S.�0{c���d�=��4	1�j�+�2��`"�h�����d�|z��g���y�MyF�%�,�N�gi2�>Xf5���ځq����M\�G�+�R�Q&��!�ټ��ݛ�ȵJ���:��]ޭJ�)W�p�ĝ���au�2B��S����hu`��o�[����X*tl      �   7  x���r�8��y��1S����k/�ň#�l�%�!�-�2q�I�O���C�>�x.F�e��u�H][�ԥ���o�����o~��]��O��������67?�����������Ͷ�^�+���{l�-�>c��������v�z��5��T��7X�6�}���������f_���JX+�R�T��R,hŪ�kA��Kh��L8��h����̂-	i� ��+��J���W�M!(g�ҍG��g�x�$��$;�!�sf�K�a�[O���p��ǅ�ua�8%��J:���A���%�ͶTpւ�;X�S�+��%��hc�h�Se'�d=��SR	�4]M�-�(ũ���{�2�q&�j0Q�b�=����t���6�a�~)�z}�R���Z|�DG.G�c��Ŏ�EɅ�H0[����8�PƝwi�"Ϋ����tf�-,�����;�E~HJ.�I�2Ǜ[�a�a:��ᛐO�(ܘU����怆(�|�Ileƴ�x��*)�H1ᝥ��銲�\LL���xFɰg$GG�a��X¦k��#Ö���[�Eö�����Y�Dq��IϘ�]�)Sf�Mm�:?��L
e��?GlV���KcWBK2M�@�8���А��%1�	FA�}Ù�8�(�/Ma�T �� ii�l3���;�.�6�@�(�ܹ๠��.�ͣ��Kۺ��0��_+�%ީ"��D�Ҳ��ʃs$��M�bx��%�<烙�i����/����3VT���_7?CM(	3�]Kk��Q�!���4H�����N�=�sĥ���g=�&���*�����c⚌��3RBk4��.
�J����n�|a��0��2�Q�@�V��\;wE'���8��0	\��谐��Z�64��K!]�F��FݶsB��a{�.�&�Z����@C&�I�ʶ�-p��u�v�������V+m��{�Õ���%̞
����x�o�0qE�RҐ��k��x�-�͛��$E�9��֤��ٖR�����9���0�}��K�����{̵g�ȕ�a8�]�:R��WR��Jb��5칸ja��8�������      �   v   x���v
Q���W((M��L�+J͉O�MJ,JNL��ϋ/(�/KMM�/R��LA��Q �@i�,�W�Y�_�ZT�	T�������a��`d��`h�i��I��n��F#��\\ �Ht�      �   �   x��ϱ
�0��ݧȦ���y�\���A(��*�u����7->B�o���릭����ᴎ�_�k�^��q�F���P��s�z^���UY�`�D��B����DSjǬ��QDdd!�e��Dk���)Ruɂ�H9�G��YD�"����� j 2DBh1I���4      �   j   x���v
Q���W((M��L�+J͉/�I�+I�OI-.���W��L�
�( �PaM�0G�P�`CCMk.O�fDMÌu��f�	53��a�4̒ʆ�b�� ����      �   f   x���v
Q���W((M��L�+J͉/�I�+I�/(�/KMM�/R��L�
�(��0	0�$� ?�8��,393_S!��'�5XA�XG�RG�BӚ˓���m�� �EA      �   �   x��Խ
�0 �Oqc���'��`�k�&H����<������%!���.w����tP7���1�~g� FkV1��Lʮj��QJ��N[Hl1�k����.������x�V-�)B�0�E}���G��;ZR�	��(�S�������ח�����h:8%Q35�P�#A���\9I�܍N�_�����$jB���S�5^�g��      �   �   x�EJM�0��W�7FlF�t��A���cn/"�^Y[��aE��|7mW�zh��
k���<�j��B�䕉肆|���CJ�v�8�����mrh��gЖ~�<�<Η{�A.9$d{)Jy<Te%�̶.��.N��7��3T      �      x��]ͪf���)�.	AݭVKd����@��ab��@b�8~��c�J�����\f(�S-�ߑ�����Oy������ǟ�������O����Ƿ_���~x���7�����������w�������?�����~���߼�����~��7o�>�y�e�A�oZ~x������������cp2 s���-�:��Z��!�\ySk1�Dj-��ֈ�ZL2s4�1,2�:�Y3�c���"�w#��o$L�N��0C��s��c�E�i�D����Y�d�]���2�Z�L�>��}�M2c4���-2�:�Y��c���*}�c��P%�!���4C쳸:�fDj-:���0�If"Wk1��D���+�p���Y>Ɍ7Rj�u��>��>�QC�Eb�FfX�T�Y�d"�df�?�yVt2Su�If�&��C2�:WSkQd&2����b�Z�Efj����72�7b�Ԩ�c02'����d�H?� �rq��;��Ja���$����O-L]�Ef�F]��A$�:@Tg��Yy����}V�1K]�����ш}��˼���7�ZV����kAv"��و�Zܧ��Z����a&ׂ�մ�,��Z����kA��-\\��~��H?��tmw�ۃ]f�j{0'3�!��`Af�Fn�̰�.γ�
t��]�g!���I;H�E��Z���-�㍤�6h|�d$��� ����I;Hۛ�a)�W�t�)�"ó�I�Q�8�2>�`43�y֍"W�!γ�� uu��T�yV�}�3T)�Ϣ�.��R��hd�h�>��B�:��6h�d�H�E�ZLqmТ��Z�k�If�qmЂO���=w�"3F��=w�I� Rk�ٰ�-q���e>�XS�O?�_{?-q�p�Yf���A�������������
 ����v0�r� �����Ե�^d�Qׂ:����t�Yf�,��`��:�,۝���>+��A$�Y	+p��,vv'm�F\�M{CW�AZ-�2�ZЃ�Zt2Sq-�O��ՐgK�6~���Y�����N��$����˲$���2�����h��D����Vlfd�=����{�=X��oDn��a]�g��컓��8�rd6"�Efj!γ�����6���D��Q��N�F����I�Lqm_^��$�'/s@�!γ��`D5�y�sFz�!γ����!C�g1�D��Y��E�Uj���F$�Y��E�Qj��̦8CJ\��:9���2C�)�zt2C�)�z\f�"�z2c�.q�ݣȌ7��=w�If'RkAY.q��{#�k����g�������r�I1��O��˚�6x�Yn������1$�a���Afha�ZP����Ե���r�W����冯���:�>+�a���Yidv"����U\���d{����~*@�Ǵ�xˇ9��1-*�3߈8��n��y�^p��ÌѨׇ~<���Dj-&���|}��P%�u�~�ȇ3$�ut���$-1��:N�{�17C\��+�ޫ�}�ĝ�]��l���Q�,+2;�x��l��Y)�t��P%Ž���0�6���w4�����tX��a��/Rk�urЃq��K�C\��\�}#�:L�%}V�}�O2�}W��*�ϊFf'�����Lu�Nfh1�yV�9u����B�g�j�������N�֢�-������|#�orz��I,�79�c�\X1��{�������g=�H�;觟�0�{�ߧ?3��gy���z�1�Y^���f#RkQd��ZP��P��>���f'��ld�h�>+�̰NW����Y�b��������ߟ�/���g���,���?+��g����Y)�?+Of��?+��kAI+p���?+���Z�If�F\�3�3��@��j{8�K�N�Ab{0'3�!����1�=�k�i��tq���d�]�gaL��7��yV����}��t��@)��-2�2R\LFw�Hqm0i/oD\L��;f��Y����v�Z�Nfh1�yn0��I�H�g�X�UE�g1�̳J���:}V�}�/2�:K���\�J���2C�)�f8����3��F���>=��3��D���2�N�fDj-���b�{��Z,q�=c�ى��Cod>�ٷXI�`d@����g����ܷXI�@fD��+�:��,5�Y^y�Yi8�+M}�WvX"��JS�啝
��t�Yi8�+M}�Wv�L8i.M}7Mf#3ވ�n�L>=|����t2_��Y�Z��Yc�b%��9�ĵ |E;n��+�:����4��
0����q���֢�-�=w��>z{��>�c���N�0v'� �=�l{�N�Fj{����Pۃ�
�=�k���e�N�^9�yְ$3���<k�e"�X'�;h�[��c�d�hR\��I/������*ŵA�P4ZR���;�1KS\\a�}��t���b��A�9�y�`${-c��,�L�yV�}�O2㍔�gݧ��*��b�P~��g���1ŵ�N� RkAfF�S\��L-ĵ�If�F\1��\���"3���>b�Z,q�}�"3���God>od�b%��9�Ե�����v�8~8���;i�k���5v'mWEԵ��dv"��顅�kA��5�h�}��t��A$�:@Tg�iF^f����f���T}7�H'3G#�Y8�bNW���CZge��=���{H�D�հ���zi�<=�ׂpSt5�!�}��t�0��^M�s����s����3�P���x�j�?H?��tkw�ۃ]f�j{0'3�!��`Af�Fn�̰�.γ�
t��]�g�2;�Z�"3��YEo���j�b%�"sic{Tg��]�����Z�2R\,�LءT�+�h�72�yV����!γ�Q��=�yVqU�Ργ�
0�*��za�*��Y��7�)�ϊFf�F���*\���`���"�Afh1ŵ��Nfj!�V$��Fĵ�
>=g���+�����+&��H�f�bT��=�����o�����܁Ե��Ϫ�I;H?�~V�N�F��`����-V�1��㔩�ǩ��*��8e��q���FԵ�ΧG�e��q����p?N�[��c8��ڝ���>+��A$�Y	+�M�����U7��F\B4=��>H�ż̧� ����B\�I�a�;ׂ�Y��mׂf+2�kA�!y6��gS�ܑeΆ�������D��}��}NCy�a�!�Y�a�a"�:y����&gC�gu�ϲ$s���%vΐ��Y�T�"�ϲIfXFW�,�:��$^'9#��#�y֤�Hΐ�Yӝ�i�,T%fX��/&g�`T7�����0;�Z�Afj!�_Lz��є�g1z*��R�,Ά��*�ϊ�UJ����gi�}V8�1��γ"�-�:ϊNf"u�Ifj�γb�+��/f����/f���-q�b�"3G#�_���|�Ӛ��>O?�av"q��/�����g=�H�s����0s4���DxqSߏ3� 3��t�Ys���`vj���Ef�W��ld�q��J#�Eb��NfX��}NJ~��i�n}�'���N��0'����a��aV�O�rq_f=����08��av"����B\����3T	�=����]����`Ff'��3T	�=X����9NY��u�Z�$3����U����H��,+2�6�Fƿvk{1q]nqF&=G��r��w��Iq]�㬖/HO2zA��8�Y��Q��8�/���H2Su�CO58�R�,/2;��gq6}V�}�_f�Rj�E/Q����Y�Y���V8�����V�/Rk�ur҃Nq]nE�+���W2�Z>=��%�w��d�h����̰�%�w���Z��u�8~�y�k����vk#um�����b$�N?k�.֮��kA=�L���~�2�M� �Efj���If�W����Db��X'�.��42�2\���Ɍ���>'x��^M}&*nŉf/H�>ę�p&j4���q*�p&j4����DÙ���g�bL4��M��4NU2�s4�=�8�.��FS�!��!���Cv���zV��`�k���Y��g�|�3�A�?+����ޟ����B�?+�%:g�zV�HG�M2�2����a� (  �
���;#��C�?+�O��ޟ��P���B�?+=aV��gg�`T�ޟ~��H�� 3����S�F�?+|�9��>�������".3TQ�ϊ02c���gE8�1���� 3�P�ϊ�d&�d���@"��R��gE���zV��Y�zV�zup�E��_ĩW�_�|�E�zup�E��_D62w �M�zup�E��_ĩW�_�|�E�^RpoT�����~��,��$/��d��-6�/��d� 5�/�e��]b�d�쟔�8�;��"[|G/;jU��E�IG�e����C���      �   
   x���          �     x�՘=k�0Ew��7& �>�|ЩC�q�I��R��������U��c�^���Â����~�}�S��_h�?¸�6��8��Ѧю!^h�����W����޻��*�)W��(�s�x�[�f��k��Q��������;�i��Rz)��� �S�XH)(����Ο��F_�F_CG7?�y�È������n$,���ԵT��KtT���ƥnp�h�|��A���^�
S�
S�
��
��
��
{�.�Q�Y�
��Q��
���	�DGf�a��M�'�      �     x�Փ�j1E��o�B�G_�ʅ�Q���0�(;)c��J�нw��G���p�n����Î���՝��������'o�xt�b�~{������u����5q��M|љ�ԃ���c�y_�i:Y�J�TA�Q�:���jU�Z�4/���~�ע}�ڜ�V%�~�k7���V����@n���hsN�K��N�n0�n`hsN�mډ�L�0�9��6���%��Kڜӆs�v�6c��0�9�������P�b�      �   J  x����N�@��=W�%HQd���QW]�@BT*�m�Y�����!%��u߳hS�ͣ����$�W7���磌��o���ϧ�a�[m�_�����|X/_����_o��j�j7�l����}x6�V��7��z������ݭ������~|�������Y�̪P��i����������u=�v۷���ŗ�����ȦvP�Q�G�Y����4��t���I�l�,J�,#�:©J�T��p*28 u�c��a�4{��p�2[(��R.�EF��p�RF8)#��H�XepX:��^�#���⠔�2C���#����CEꖎUZ��ұ�l�,J�����t�D"��]hO��Q����`Fف
�z�H��T�Lo*R�7Vi�vtzc��BY�2�z��]�ӻ�^���ӛ���ME���*-֎No�2[(��R�wǟޝ�����{��R�7U)ӛ���UZ���Xe�P�L�z/��?��z=F�Lo�r:��H��\��ڑ��UfeqPN�w[��'=��"i�{�>��8Eb�W��S5AR_�$��A���'U��Ͼ����O&�}29��a�L�dr�'��>�����hC�@��9=�*'�A\��4��X;�� �2[(��rr�d���ӠO$�4�{=&�����H� �R:����*-֎vV�-��A)�:(�;�z=&����C����*���H� ��b�ha��BY��A-��Z�j�$�q ��"�_	[��y@GT:!f�wzo̧K�"�)�G<]���(]A}�;: �ɩJir*R���X;��Xe�P�4y�7yth��o�h����ѠɣC�G~�G~�S�&���T�49�M�UZ�mr�2[(��R�<�<94y�7y2h��o�d��ɡ����ɩ���Hmr�R����&�*-֎69V�-��A)M���ˑ�nr�]�ɳA�g~�g�&�M��M��MN����MNUJ�S���X����&�*���8(����i:�MμO�4y1h��o�b��š����ɩ?�/: �ɩJir*R���X;��Xe�P�49��kG"�əw_�&����7yg��C�w�&����gg �V�Q      �   
   x���          �   �   x���?��0�����O{Z�np(��Zb%�����\
���7�I:|�lO�ޮ6;jֻo�o���fQwL�o���DMgZ�4�t����Z�C�����Ն��ϓ_�&��Θ&���?�`OS�~���4�\*!�#Ũf�`$�Y��p��{�,�1�αrp��)��:��ҭ�t�����ѕ\ ��\$]��+�t��zխ�1�X�%�n��[a�Bm9Ij�ɹH�P�Z�}�[V�O3      �   
   x���          �     x�͒KO�0���{K+C/��묐Q�#�Ap��&�"�I~?��8T�!�Ϭ��V:G�@ig�8n����ؗu�M�{X�u"Jt�a34*��m�ǡb��]�ǚA�Ǡy�U�����V�,�sX��T�-:��tƊ$ZEa�ο�yMꇱ������c�+���jt� ���B?�U"�!����/)q��{C8ZI���Ϊu��a�m!o<�~o	"�Ȍu��yT:�	�x�S��ui�TB��L�<���p=��0Κ�ſ��-

DS      �   U  x�͕]K�0���+�]6b77����H�٦���Rpvt���c��!䋐�p�79�d*�@�5p�l߫�͹:��S�|V���a�_�ؑ�.ϛ�z�H��ۦ���.	������nʷ�s��0$L$��Ĕ�I@�sLCy.$����R�~�4��D��M�T�h��P�=�M�VF�9�F3q4KR�x��Ρ�K+�+�y��J�&4���V��E>�fmx���*�(X:���+�����Gg&�F�|�,��Rp�8bA�$�(��2������wpW�\i��[A�[^Kʿ0W�}UK��&�8�U%�:$d3���7ͬ��#҂B~����Bwu���`�[��Y      �   �   x�M�M�0����Ma�NP��p:e��8��Je]F����D��y�Ȭ�dv9A�W��g�a�/T�`bT�MG����jG%3C�;d+��`���(*;�f�ry��Q+lk�����}K�V�����/K��S�%��(`�� \ƛE�Z�!�H�I�g���^��8�,�[��5�����:�A�_ZP�      �      x�̽�rI�%�����E*]Lߪ2+��H � 1�ٔ^�E9��0V�џ0�^�"�������nf��.oWK���$������~����Ow�?�}\=�_v�f=~����l�����mu�}n���i��z���~ӵ������o����ݦ���@�����[m/�}������~��������xwф����V������ǟ?^~���7��WW��|����?���*����S��߷�|��n���u�L���M�o�����I�I�9w������J����Z���y��fh@o@y���Pfݸ�Į��
�h �oޱ�K�?(�vO�iD�\JY8ԛ8�]�����bR��@0¥�e0�M0���}���c�7K#��jy8NA�y�߇v��f�Z���B���8G���7��8��M�(��8<mu@$�Ľ��]���6p*�6kQ���^��4�k�²ힶ��#�L"���'���4м����_�}0�����Ĺ�ZDc� y��_���n�O_��D�p� �P9��|�u;t�M�[]���n�PV�U	���r��������wݾn�����[2��ڦ �QD�� �߿l�v�[x<��u�����65#�6�[Q���n;�!���2+c4�n�S�goE ������m��\���c������ݯ��#��������c	L�`�ɩ�i쭐 �}8t�C�u�z� ��a���;�p��p+"��[��m��7��J����d��f4^+0�����m0m�mDb2fI	�W6���?0լ&�J��E����8>�f ���}j��F5�ǘ�B�`�}��hxL>/d �K��w��/;B!�m<
C��yA��[ݴCx������������yA|�	����w��=?��1�l�f�;��:>	��w��!lS�h� ���K
홒kV��S�U��OR�17P��cw�c�H�\��-�p	��-�T�d��cv��;��ǆQ�Ws+U��} ��:
��'��D��b�LU(���		kֆ�a�P�_)N#�����ۮ�P���q���R�!����U���^����#�]�($��V�K��O��K8Y�Q�Ma�cT^�,s�0@�t����7�a��u�@B��(���c��r�qS9�F�7n��q(�:j�v��\S�K�k#i��ż�Z���Ob��0U9rgL<�}-��������i�>�_��m��Pײ���o�p].4�'P|�q��oC�TIUgL�G*!�\hhO�|����d/]�[�ּ�d�_	U�L������R�����n-]�SG�	�E�oXp�>=�ð��#���h,d۵`����������r���2@���F�W����b�i��!�w��ѰTe4�j��.d�\A�M�L�͢ a�g�>�}nC�Ș�߿JSK�KN�y�Bw�O=� �$�AۈA2NP�C�
�k��|�b]]��:�DLT�b�#��oǼ1-1�N/B��H�y�^��o���@�ﺱ2�G|O�4����롙ެy!��3�E���z�q���$��5�ڤ�@�A�9�����=��/s l"��	X
N��� ��kx7���6�-�;H"uUs"��p��O�ayʟEa}Oð�F����[�ے��DŠB�Ss�B�n��V����.�U�Bnr�Ry''}7@�i;�x�	�p&3#!	H#h�yԜ�pd���߮���Of7��n��]hs	�T�F�;',T�^|X�#�]Is\ch5��#�甅J����o[�v��cR��D`�t�w]l���W}q��H���n��� �M i�6���s>��C�0n�2�v��g��O<v�?�]���1��C��<�p�lj�&9a֧i
��]8����|N��M��%sn-�e*kS������y�������G��w*�=��K��A�]uO�RǼ�FS���=74z&z^!:�*�R��!D$S�HXE�����S����~�o!SMG�+����[�:�p�z^G:	��=�0�&7�������b�fA�)D��ػS�zH��K��4F9���t����S�B�X�I�iK���לN���~74]u�:H�RE��(�y����OiW��� �aO&��� f��߯/�1{��3\��=�1R�5%�L�UCdZ�̃�#4����0!�(\򭎄#4���Ez�P�4��8V���"u���6������w=�C8���j�2�-4,����OnǹN2=��&>�cT��,�;�L���hxy)Ʉ5D2=3��|n���?�%��\s��!�ǔ����ORp݀�'�|"�)��8
Q,@�(ҩ�ӪP��}���:�"�0v�W��Eh�a�x(���k_C�U�n�B��ֆ�������6=��+wl���5·��q0
cM�'����\̖r8���B6"E�j���U�e�"п����������$�19JM,�(s��� "u�[x�Bp�Qdb���g�[���� ��}J��"��k7��96���$�A(�i�<v�k�tC$��S}��!�X"�����w��`k*F�7L�_G���q�!\t��տ�����T�q�����_���`��Y3�l��x�,g:`G]g��ߤ�n&eDM�ӑ�O�Q��s�s�!�~�z;l���AcȖ[d�#0�B��������y����B��YN�b�q:�|���~��}���}��_��ͣ�ME}l�����H�r=�b�\�v@�H4�w		��T̞��K�<&.d�P墭m�j;�Y�7�t) �S
8�d��0�qd�,��n�X���ɸT;h�9��ѳ`j�ѧ�� ���z��i���1Ka��lVV�8û�7M��t�N�	s�̜U .6P��$"qѲ�]P@�hv��(����a�=�g$� cie��Ă����	F4��e _��v��A����j����4�V�*V�;6@M]�1��A�QS��&��pN4K5u7ǀgZ
��M�Xd���(C#4SS?s�l�������_���M�4hM���Lp�C����È}hBK"�W�*�1�~�/UxFb���l� �`�8��玐:F��c�<ۡa�?�ƨ�I�;���^��I��/�4�|5��Ma���=:H�b��O�D���iY�H&�S�5
h[=ƕ�/�����2���<`LU�������$�����@�R�Y���"�>�sP�8 C�V�r��~x�s���!���uU
��'��a�up<a��UJ��e���DEOC��vxS�?2�}#/��T��F�HO��
�O��h0�8N�A�0w4�F=�kO��Rk��#:�������i�^c��.���CP�D�P�Dƫ��{��c�ޕ4��v�A�5��DO��
�u;l�f���*��b}K��i�^����1���I�jV����<k{Ǳ�⠢P�<��w�)l��'_��e�����!�+E�]L#�
Ý���XS5 �mb\qC�qL��
��1M�H]��Q� H���ȣ�!��i������W�^�mp��j��]��Z��o#���XG2�wA*s�̙j�	�!7�kg(�x9��D���s�>ƪB^nCi��4j�v~�Om���FVP��~IC#���{���{�Y�1�2Cw��ԓ�����oW>����߷�����~?8Gm,6=I��c��o��_�K�u(Lea��%�����i�C�ʫ�������K�C
o b�:
�by/R�*��,��9(���Q��{`R��Xu΅\��(��Sp��P]�����q��H��5�c !���`� ��TSp���?�&��@L3��s�o��!��a80a������9�J+��0�	o���kW�֝�
SB�8�����<$C�뵋� GDJ���t
vbCVA���3]�S�� �)�E��~����K��`�Y�˔X�ʒ(�y0*�5l��#|�Y
�<4EI��h�c�� ��H��`l"���    ����� ��X�h��F����TJ���ي�  �`%yC)�Iy�]�֢0��b�1LK)�;9F�L.�`�E�.�86͝B l�w�1�4���7�x�K�(Q%
��U+*4�%:ʀᔃ��$��,+u�=Ռ%{J�%�rѡ�{�¼��G�
4�h��t�7��mڶ裎�&�V�M�IA��ќrӿ�*�@D�)�c��-N�?m_�?Bqu-�m��
IBP	`,ا#��?o_1�i*�e�u�Ġ>[�p�0��v���Z ���X$g�$�;�`�ʝ��Vي``�%�	LT�p��F�E6/�J��e���/W0�:I��\�
j%����{��`Vj&*��2��v,�&9����`���i�9�Sm�;�u6�y� }T���l.[DG6�Ĭ0\�1
oL�"��*)	U^@052�P(���t��4�L+h� a]�BY q��/�d+�JP<��H+��g@2�d$I�z��BG�L��P3��E�e�A�t���Kv��*�r��$Xٌ/2����n������N�5�!ACf����5�^��ơk�M�����4ŅJS�I���l�z�e�v y�Q��(��l�z��m��V�=���};�L�<���2�#��������?|�u>^�p،���h-h!"y�54b��x�2:�4��V}�2ˈ��}��x�)0c榋j��Љ��$��1�g�<e�`b� ���SL��e0��!|�Z -�I�<k�8����DE.��}�V���A:�P�����D����R l �����  �0����Ue�,x�0r�h��ԿT@����W�fEQc8G��,������c��[��A� (A�(�Iy�ѿ�=`4�<s�ծ�H����C X
[� �=�hiXW��Gm�g�gDTL�;�(tx ��I����19M%ka-tlSu��?��ݧ�
��6SY��jL������m��w�76�`����J���7�x*� �%c��rt�~�8�V��T�Z�gce�k}&�R�L������<-֪�X��Kc�& Qg�����qg��"*gBP�q���f31��U[T��������JM�z6�S9��k�C���_���)�S�F�k&�RC�>�
j����qI#�����H����U�����-G��1�P�A�����i�z�T�V��R���@��.j�3^ޅ��B�o&qӗMkG����[�����.��L�HR�	��Rߓ"u��c��G;`A���Y7�j���i�
q䗱ۏeՅԕ&����Nht�fS˟��1�O+�҂J�c�I��ٔr� �|7�����e$�mhX��Hr�i�l����l��Il�9�v3}F2R��*r�Q��¡����	7I��_��Li���Cc*�LC��:5�A贈��(�,�Y-3��BY$����YK4�6	S1"N�L�����Fq%���H��F�hؚi�^@���t�!a�X$_�Q4DFm�4J�Pt�b���+FJf�I�h<���C�/��x잾�/�~0~��M�xC��3�~( ��v�V����#$���i|�'�o�7�~(X������B4�&"oC$�	> ��vӆ��/�H@���2��$��=u
ALV��PI�Z�ʛ�'���������+��Z(4g�u"�K;���}j����cj�&����N]u!���js�I/�1����w�nѸ�گ*� ���Tv-���4:c3���qLl��I�j˙�k�`w,������PvU��(8��L¥���~�W�>���]7kê�M,�I"��Lȥ �������U�C�ԴPD��3-�
E�]�{��Q�3)��B���KA���yp��J(��n�Lӥ �e�6��C*Yk��@��F!��|b��>��㍭�
�N�I	�7s{�Y��A�bӂW��IYI�=즹i��6�.?	[7��H|Mcm/�i�ףO���A���}(N���g*AB�xN���4����9'q��L,����`<L�J� �$���) ����-�>,��F��Y��]R�0�Tڐ�zgm1od���$jf|&T |j�C��ł2��h��W5�(�0�P�>�ϻ1��4���e�#F���gBA�mm�q��WՑ�Ie��S��M�xa�&|�#֯�����|�H?�O]P�"��������w׹S�}�� �H!�  �����d��8"�ܛ-܀B�C1 !I��`0���+�Z�9u	���pQ
�r��f�|����D�Ar��!�,�Y�D�c�\JQ Ĝr�ӼFJ�'/`��(�{ɱ4R�y�c������d/�Q�_�;��߳q�2Ie�"ذ0�.�Ě���k�{0\y������5c��	+��׊B"p��y<C;��Hr*���Ʊ�d$�7ݟs�إ�VG�E#�)i\yʏaM��u���*�4Mb����2��3��Q�]&�}@3w�34�q��i���G�Y��	d+ e�6����;�_�G#���b��0�2G�j`���M[�:d2��fL�^Hh-��˜�#����F`L#��X
k7D��X�ayz)� ���V� ��yOj�xM�V ��L�b��z*�}�;%�i�@�V Ag^��Π�h,~��H�
� �[�@h<l�)	艖 ݨ��p�VT0�o��n6C�Z�"�0$lNQh7��B�8��m�݄S�� ��Gơ�pjD��V�p���cL^Aɍ�`(�� �[���Ծ�!�@�Fʁ���Q�������q�{����X1����1���c�o��ڠ_�6_5�h+h��?����"������������NUٝ�v8(A���*�K�Q���*�	�T˅�CC��,D�v���۩-�|������U��,�����+�B��J�r|*���T=�� �b�����߼G���>�h���Y�V%�0��b�
��h��C\�k��>��"y�)X ���फ़��@j��F�;x.�Ө*B����}N�N�R��_�������ɇ2�T?lw�Z�~H�;y���8y�\��5����]P�3���Y�\��(���|ch_��#d]��Mv��9 �����z�0-��z�S��ܐ�
s�en�k,�����x�\1�XN*/en������xL#�DZ\$�ma en�+(����&�ǡm.�	
s*�c��U8~/�������qH�F�̌J��'�$�2�Pҭ@]��(vjaXW�<��2�\��V0n�M�N�r�"��>�S��(g�}&&�bZ��� fs���Lg��m�Q��Ҍ�ܥ�:�NC#O��I?�FB]	a��3M�.#ʶ��.�S�U��0�uHX�z�������+4΄�#љRGBDp�u�w�j�P�@[�KiH�g�}غ	B��y�\��$����~�xA��%o !��^&<�w�Qc�T��L�1��_����_Z� �JIA �����*GНc�,D*	�"��%�
V��͏����Qk�s���0�W5O���\G��ށ`Յ��9�M#iQ��kr��^a]p(qՓ��Fý�s�����m�ծń(�w0I�؛d �ܜ���o���¬���5��4J�z���7��Q8O�hd����F�����$<r�$<�Bz��?Z*�Z�27gGX>��l��f�Wo�ܱ�E;���#��Vlt�q@��Q���z�1�_�v�K�@^(ɋ֙c��S�����Y9�Z"qKJ\�����v��s�U�&h�4��OTL 
�2IĊ�+J�P~حn���v����U�K�T�c�������\�����?����g���/��e�y,���#����`����wR�7�e�=Y�e� �qx�	4�2��_���#fM�,�y�q�V y�Ib&�X+-sl�K�F�n�`�63��i4��<l�0��,�`M�Y��@���e��
B�6�v׮޷��.ѫ@�S�    �`H�f4�/f�d47�K��
������S��K 8f�
���a{�e%q����`��;S2��W@d���\�\ŧѼ3���QVăC�$R�7��$� �k(ޫBl���=nN���\�o]�:0(�P4�]Ш��ys����}�K1��#�ͳ#�H+��[[U<����p�Ki�s0E�D��a�����g��)�e>�T\�;7J���)��~u��}mW��C��3��<��yM���	@��k�S��+3�!]�a)0�$
_����~u�������H�92(n�|,�+����<�я �T�1�Ǻ�1d.�>��{�()�����p��o��t�D��H~���~���B�78ƒk@Cb^\��	4W��>��}Ў���3\��'��a�}�����p.�]�`�Y~/$v'{8)>����f,p`+[�[Ј�`G��N�����_"��ň���?K!$g����}0c��b�?�&��B�Y��oq�l�c����R^�q���xW���ͮ�V҂t6��u����s��=�.�b�#Qf� �YW#*��.%� I��FHH� ����6%�Up��+g+$�� �Y_Soo!���|͢�?��� 鬷�!ݵ�7���k�T�,�L�Y"A?��c��á���������N���h*�:��^�����J)�5.:Ib56�:��P ��V��,ɄGCG��@�w]�!�4!���q��� g��_7���*��`c�8�&�H���F���������6'�$֕��� ����UQ"�<9g�d�~6��1�b�7OiL��%�"?|�^���S���؋^s�o�q6��?lWWcwX��_��]�v������$������0�-Q���م�+2)|mX��hl?��y�"P��e잞C��yS�oy>M��'Q�rP.1��m�]{X���6�����*j�e\:�э��N(Q�$�æݭ�*B�c\���q�$��%�`.���c͛�[�����XxKX ��]��"���>��d;g��5�e�F#f���y�; BB�@�������/QܶO�
w�R�H�Ec=�h��G�F������u��� c����$RNɂ�)H.�90\�>*�1�f��7B��$��L�%.z�I��S�>%�c���Dq��8��K.px=n�t���b�rH'����v���}ׇm��ڵ,�K�|��4��~�8���	�}0��d��(o��NAyl�s��6����[M�+������4�q��4n�F(D�bއ�������\2�Ź�n���Zk��04+��X~j�.�8�#�R�4̿wCa� `�u�W�S��8v_}�"-TAL�lͻ�5�0�&�F�J^�8��IdXR�r���Fr��Z��(�;="=K�9^҄ʻ��]�e�;8T�s�kh4��R�X��߷A2D�N_"TlX��NbJ���) ��-x�����/��Q4�KQc�@�i8�5�������H��R�X#�l�G:-C���\ƥs�F�"���M�׀:k����Ǿ1i;Jt�)�4a�#w�GA}V�t�	,��R��
Kf}�h�4b�_���Q�Kac��q��y��pY?�o�Dn�R�X���},t�FUS*	��ė�(x˥б`����j�JR�

�$�x�9���ϐ�s��Xz:9�5$f%������ V���z�9�;u����y����v��49;� �*QH�xNb�럲{��LoS�?t��*MB@���	���I8��q�&?�)l�(�u�<�wB��0�S���|<�2NaÖD���`�kمl�I��Fǀ�����Fਖ��
~fҹj�Ť��	���Y�������1FiYVM|i<Mę��8�@�q�ӗ�^�(�]��\o4$�����GҐwɄw6C���Z����`��<�v<�E\��$W�	'�\7�%4QpɻZ�|+�1�y0�Q����ѺRK�o�q���Ts�0�c*�qַ_��C���ƿq�g0H��nC#�UK�oA2] �+�L	��8OԸ�J*�������$��'^����+5^�q��4���7����<�|���zW�ѕ#]��RUVX�l���Q�R�ѕ#c�-�UQ�l�B��O��(>��3BC��:_�X�$ d>�rl��@�7"-���y"#jz!u���0�f��,���RUK+���F�R�#<q�<X.+J��U9�5�F�T/d��GӾz(a��	�*tó��64J]z!��ܳ.u���հ�c����z!�?��aH�.�3BE�?E���R�#�|��w�B�HUq��]$�>�=>�6��Ghn�Sc�Em��@�6�^�����������Qg�aa'�I��(�Y��p؅WU���MU�oXd�zhDf��ܹ ��>pn6CJR��m�"�n��_f�[�_�>�����w_�l:��_�N�@LR9��kA,�����C�.V�M*�R�0�)�l���4��gZI�֤!g
f�1܌�8����Z�F;�g�_���^�����M�Ua6�]Y��i]	[��.�h�F;7[5��؀gG��F�&��$L�����	��,�VX!�-�9��DB;7X5�!���K����3�,%'���ϴs�U�	�L�2�W;avP���I�܂a_S	�a8�sL9n������5�_����D�n�C$ qL�0'!Y
Xf�p��}0���i<���<�YݫFq׎C��������)���w��p�O�ܛs���-�F���w�����x�J��.�_Î�ST(#��n�8����������Nbq��2E?d�o���K#է%2�Z����V({�a���K��Ʉ&�%pR��
UdO��l��V �`L5�ĹL��� ��PA���.��H]��$n��7�P�+T�{��M\�"���b�¸x\XC���P<���v�����Gb�kO�!QGU({�/c��U�0鎏]�H���:Q�{GP��P��6>z�k�#z��D�q��0/�P<�&P�{ߎ/����y��Qf3FBGJ���iD/]��GI�C�t� @:��DڥPL��~��)+"��X'���뿋��X�U����%`���dg�~�_\%��o�i]'A�R(%{�O��xX��~k��>��u0�i��A2�&�B=�S���~��V0=��W��?A�h��~�Yj{;�t
�Fg�F���<��|��ԟA�����hNA\N���)$����yyu#�HY���S�,�����q�v��u+I�˻Ӕ�@]W��uOb�ia1F�Xlw�.������L74sJ}� ��
�p@�,p>TL����0������� ��+M������~Ӯ|��ɜ���p�����ޑX.�PP�nx�[�X�	��&>�J�?��J��D����I)�X����fW�^��bk����4*r�%��G�B��R6��qR���
�5Q��)�@E�� ��G���
O�M.�<�G�4��J'v\�� �Lh@Y|7ʇ�����K 
����/����P\c��8t�>���>#A%$],K�b-�7	H0_�R�����x����`-P5R(���$�(l�%��$�Q�XK��|�v�Vm��v8;�b�g�dF�Jj,�e�r)���{K<�*ni�e�b13� I���l"ݭi�,��X���A��~ビM�=Y�9��̪�,��qE��'K��f��8�K����i�ЙR(�P��jA�<�ȯ��1�wK�C�'8c]��4RG5��
��^��{<�R�1�N��i�yxUax����{���>12�@
S�ٰ�!�}���*�)EVtZ�jY�0F�s�#wK�P�̥��=��cXa3�%����(Q����J�F� ��[�\�)kUmEw��2B�WZG��⫂�.�NHċ2l�����6n�j'��i|�*f-�Is���TP̓�#���6a�FS�0��4��5��
��C��lz��|�QqH�#LX���P�:� 񏱋۞a���<��    i�z!$)0.`Oj(�4����4	'R��QI�� @l8�<�&�6	���q��I#��n��f:> 1�u�}��o�F![/(���k�����:|L��h��c�G(5��9�'3�q�L��E^X�@af[��2�n��cZ�ظ�\�ddz�4YK�<8)H���zj_�jb����V�7�I� �y�R�z����h�梜�F\��p'�R�
ή�jLҖ(E�.b8I�W���
~d�kJ[GĢ��i�Vz^��|ܴ� [i���W��s�FV����K�x��Oפ7d42*='�U(n�.�Œ�B�2:A�,�yu(�]�o�������R8K!��4f���6A\0Ye#5TIYV0�F��9�8n��aFň�-�8�^�1D\;;��I��P� �V8�i >��N�9�B�QހYL��c�_@?��cu�b&�aLxST�f�E��q"lH������Fj�2�;���%��64�f^��i�����ѻ����$_e��<�%2)���038���s(�鲈�Gy�P�IO�,�Y8�~����/����8��X$G�����2���+S`03�܎!�aޛ�sڤ��I].3�\���yZB��(��>��
�Y�3��:b*.XW&˗r23s�` B���}*hg�+��~�zA��a4*`l==#Gb1���>Sx�>W^��`(�p�'����i��m;�����e��cB-`iL���FC�.y�eH��.;�1k��M�Dr�LӘ��KN��a3&��)��4�v�!-��J�@r/=@!���:�Z6����E�����Tb)1"6�.9�e\_��t-�:#$f�kfh4r쒛:e��DtW�jH��3qFAXT���w`
e��k��?[]��.:^%�E�E#Q��j�Y�i���CR�4�R)Y�2�M@7/ΟFW~a\�S�(��%�����&PfAKj����F�8��4)�h������v�UH�\M��&N��Шp�y(�`�w�s)�� !��J=,7*ah��b��ȿ&�/y�Fe��������a��Rl���NC	`̢�q���>���UYxZ��(��E��Br���8h���s�  !�� �	D��d�$��kTe��ݶ������_���m*]�R�Y�!��`�;�S�_	�?�������HES7o�D}��,��D.�0FA��s3�u��������Pl(ds.���OB�4�`	����b�9���?5M��J�I��		���,rY ������G��O��(x4�f�!hK�ĺ��`��4�Dh���b�9��:�\�zE��ͺ g�,�y���vk��ٹ��c�6�l��=��B�W#�(���(��B�E3���:����f�0�������i�r=����.Q�?���k�A�"����������Q��`�#6�m�XcP�,�%�IG�����;"�� ��2m�Y�W-�
�e4#��d*���V�,�gi�p��Ҋ�[4�a��l�,�byU�q�lI[�5���/(F����DTH�lA�x��o�ϛ(Ρ�^�8&+ )A�	-�o@a�u���h�lA�`$�:'[P9�����?y�����1�P� �S,�*8��x<�tێ0X�.(�0�I�nC0o���[=^0��G1�����K�G���p8:�_z�-��_o��������ϋ���Z���\�=ڵf�,B�M�"8/�����cyܾ$�)�Wx(1X�C�H�:K�A��ûQ�fI8�X�6kɩ�.u�����J-�p�ZȠh֍��E�����2H��}9�������,��ծ��@�#K�{�,�*߉�P��YM����z�/��4�?�x��3=�N���������Q]���n�]`�^6�
\6Ea|DgM�sX^b]M��Mr�����go���ۧ��
���ϓ�������Րl]D{,]��y����'��L09���X��Xh���}�����_�IQ�$��� ~
�&FP#q��bwz��N���ߧ��v/m��T�aP	��T*k�t֘>�D��n?�,���©0���ڒ��Y_�4����'��ٗ	$�Vb�L�;	&��J�^�Q-�'Y�=���&8H}/E,��

(Y<��%n���1���"�� )K�~xخ@.e��]�7%0li����$��?�Y�Y��������ł�r~�Q=�c�:��e!o��D��Շ����
�	e&���&l�i��� Z�^*@����E��&�n�O�� Y�X*$�y��dӠ��m�h��U�������N>�Z;[�v���Ȼ�R�R���%��X�����K,%+��vu�}��{�v!qaV�����?Z2�)�n輣`R��_�>p�p���A�S�yC�2�;�<3Q�݄N��$��K.�_� �x�`]4zɂ`����X�
���{�^6ص�"O�vɥ�������U>��馡LD�ʥx�z�C�7^�b)�&�A)(��y)�	 ��beE�O�TJ�c!�*@��>U��(�֤�A�t��R�e�U���B��$�s���ۥ�*���Dܪ�݈T{PD��r)�B�؏�Nb%ȭYv��MKaU�p݁�!
2��lX�Ru���%;�o�MZh+pZX,bP�7q�}�ľ;���=��"Km(PZ��f>7}X�.�%^�W��PDBv�y��g���6�sn���9�d+SPE塟��wm%J�4��-P=U<Gĉ�3N���<�z!8α�@B3�HI���/������P���֒H`�R��_Ƨ���6b��6�C-4'���#,��nԋ��YCV6�GM������#$`���cx+�ȳ�F.�Ԃ_�0���}������"��KA�A��0���ky��w�GJ�Q<Ӈ�<5�%�0ʦ�v��`^���0~Oy���PB�U	�?�D�4��j)٭A�����Y����D�sztD�,����~��Ҡ�/���o�8��bƗ��?�(����[�|�04�zɽT8�d�:��(�52G�4j�zɻT@��Bb��YCڅ�b۷I4F��_����]R�l�u#�֤��54
tzɫW������M�@�J��3*@<Jr�==w�͇Ґ��M)a+��!��R�}���L8�/팿L%NDnh8z��G
�Y.�������"j�a���#�����I~�m]d���� 1*�TT=����M�<ɚ:�L�����^*�!Jf�ۊ�f�qk�4��R��J��k�.j��.��4��QSZ��a���T��[@�c��"ԔJ#8w䙢Q(�KU�
���쒨X��[��}�Q��y�)w��}�z3o���P�oPl�%5*��Q�,$?���!i��{���GR�jB�ͪz�I,�Y9�4����a�͋�U�h#ҡhC�Gl�#�/8OY
�,F9F�p5v���n�տ�0Ui܆��>�1�F�onUF�~���.��|S���8���)�­�8|n�]��پE>j�l������:��(������f*^���������A��7IM9����h��BR�!\���M7D����e!�D�S�Q�.d�ƍ��`�@.�܆��B�Л�Y�zF^j���n^��i0��B�1ܶ�]ꪈ�;�,A�ȅZH���o�]��C�HN��!!
8N��J
|��؅���]�7�p�}� �?�R�my��jȞ<����_��-�Sp������a�.��E��$�a �\M�\>zW���)C�Ї�`DCcX�-DX0޻���J��1*��F���	���] �
��y �ߕ��ӈV�B�5�sPcځiֺl�XE��44�!n!�Z�yY�U?��P݇5�e���d�YC�����	�;o���Ѐ�^͝Lր�ȷ������  �Á\ت���-HH�d	�3x.An.(l�ʉ2�	I$v��}|��#H7�~�B�~܆J��
LP��#5�v~�@>������]���O�W2L�$lbHX���|    Ї�c�	T�}XA3 ���	���$�V_�Mہ��Ї�S�4P%�MZ�Eղ����m�����/X5_߰�'�=�%͹�'L=�~%4��T����s�D�ƖT�Ѽ�w���� i��D�u��=[�;Fr���[\wԬ�<A�r('lt���Ĝ���q�ve	�[�;���nu3�A ٔ�H@�� ��$dؒ��1���m�}gT�c�e����I̊�%�	�]$_�6n�c!Q$gK�s�@~�ځ٧l5�ej�9E�L��	�n�X�V�,�:N�/�7�N2G�p2�Ȼ����� �x����v>E�?#��a67�	�ּ*�4�o��r�t莡݁0�Ǚ.5u`��X��PB�Hފ ~�w�~u�0�����y�ߦTqR�[�H�K�za�X�e�O����E�	�0�$�7��~;�}R�� ��}$RD�h蟱%����sJ^��d}=F��,��!������µOАJb�I�I�
ؒ��UqB\l8Vq!:БI�9	!�$�w��b�㣦��Y�M����D����������Q�.��D�׆Ĭ"[ٛ@�E�/A��]TS(��(���4�Jؒ��1 ���p�k��K���.5�Ɯ2[��;��s��W��16?I��$�w��fLj[J�RFS�ih�ӱ%���a7�,�#�.AhB�G�P<gKJ{0����E�c[�Tb*+"��%��c��tX1��x�ƥJ�n�ذ�$���_��
��al1E��1e��n��'>ɲ�f�eM2"�)GtX����PP�.���d� ��Ұ���!��㘮�}q	�u&��3���n�C���H�B�H��M�d��a�����
�E|��x�)+L� ~�?�ݧ�#�p��x�'ŀ�D�"n��9��������:�l��0<e�Ҏ�M���1��	 �J����
m�vv`�'k���'�a�]�6v��z��0���`KC.迿t������z�v���Sd/���4i;�"!�mѲ.��~i/]����6�-�y+���!,�%�C�F}Fx�y�"�?�hX �Uļ88�"u
 
џŅP3 �4��?�* .����aV��/\�����G�̊l�m�/�U/�O|�1���X���k�a�=���-6�Be�X�������)
i��k\��~��5o1X�e��+�Q0�u �N����*�(�7��H��WJ����?T8>����B��0�ͻ\	��0�Px?��q�+��g����y�w!!�}���Sh���1jA�Mkq���o`&�
�\T���UK�����`�Y����L!4&�m��
�᱃h��y�=�L\S��֜Y��ʣ)�7`��M��/�I<�Ʀ�I2
����� ��ez��w��#Q��dB�e)�Z\q4�p��v��E�d%|߄AE�A�`
��[��n���8�i,��y�%!�!��7r�e
���_Mbőa�a�Q�D������2�����0~��2�V�(�
y ��x�rZZB �k�-|�*��G=.���u��R��׿j�����ue�g�&4����֕�� ��gxޥ���� ��U23 7ݡ�uiQ�J¹�*9�2��-23 �"������.����+ G#L��rR�q�x	J�t��	8W&�դ��?�{����?������1$O-j�q>5��q���{$S74[)
�!A�|�nRy���S��L}BB��q�2�����{���͢�0�����5$W-l|勢j
EJ�B�0�j�A�8}pW�HL�������sV3א��ЗʺP���903BEO�(r��_H ~��AF�I(� +�2��) �z���n|n7�Ѓf��3�V]zL�(I�o�<����n3�{x�Z*���,.ށ3â����f�FN�*U.s7$��՗`�O_ڔ�3�q{vȃl�RD�=w�u���J�t��L�tBQ �Y�W_�q��2��q��ʭbA
�$Ƭ,��/��j�Bq�3H>�`&�*�Ј���c� ��!+�'oɿ"�=��]�L ����M����,
�"����K���yQ>�J��9�V��o�͕�F��L]�Υ��� Ge�ɖ�!Rx5S2��>E�Hmd�f�]�P*$�<�~�ǸE�g�P��Q,Q	���o2SW2As�?�$OX���][�� �c1So2��K"*q���4P
Dw b��e���g�����ME��W0
¤ Ş���v�E�8�4��B" VHHY[��H~8<w� S}4�T5CɲK1$F�,�q/���N�Ї*�1��	b�4Z�v�L�`<�C�n�׫D=R1�q�`4ډ+�p|����F�Ě�d$���ѐ؛mQ�{�M�ۥ�в���Y��XK�e`'ΣF��88M�X[Ur�6�GAc��EI�����?��5Њ� ���q�\*r�E���h�:a
p���d
K���7u��_�_��/�+�} �n��kZeЯ�Djrn�@f`~�<�C�:&��8�A'4F��#n�Gfh~��>Y�P���Q�L�k�8E7q&30��I.ޟ����f:�t��iF�ͨ�X�{̃�>h�y0�M�4_hI�A[�>��q���c�v1�]��T�Ԃ�]v3����Q����I�P��(�{���v��v��3��e�a��� ȝ��]���@r#�qR$8q� �4�� m�jF4P�KW��<b�Hl>(o� ����WbF��a� X����a�!@~^��AIs���0!��!�;�F����9���ǲK�J��&6���{+�>@1<t�TiPX�;�4:�$
�(�3�mʍ�'������6j4	j*��!\l��;%%2�=�gk	]7���s���9�`�$Z��6��7WQ@ O!�w��py����W�H�	P�}��*���1����(z�O�ڒ衠���ǧ6���G�LT&ש�֣���M�l��ȥ&y5��T�J6�DpԌS@��{�n/&&U���<�	'�A� >���bA�5�Z��,���$zql*�q����|�&��^ۭ9���q�pOcΚM58&h.�.�;���j�Z;�&&%6U��xyԚ��*sk�GK9�~��rL���u*xIm�᱘�E(%{6��`��c�+�޶r.�~)"6��`�G��]:a@�ty�~!R�gS��_�����(��_�,R +���m�RH���T)b�Df��Zء�m%�Ɔ�3]M��Ϧ�S<�����cFbQ՛gL���6Տ�A��&�=D� ����v*!���%�F6��
�0ݐ`γ����x�6�K�nJ����0�Py��,�0|�0�" ���&Q�#�!�8�YW�f�:f+���kAbl��pgq��,$�kk�i۬�+F������=�q��b�)hϡ��9yԜD��0�C���>�����b�F��y_�������.���
�J#��y A�aS�_�1'(�g��-
&���K4�Y-�
��0���6a'A�m6�Mc��eS-����.�q�FgY!h<���L��<������|���A�4�wF�<U�9F2�	��z6Sx���6��1|��/�+�d��|�5&hHڱ��L���+EޙW�ܢ�b�.��ƺ�׭���w�Z����\Fe���P�rYJ�-T���$�aT@�LE�tKj�k�/��u��� �P�!Y�0�GR�f.�����߷���r�����H����w���������.�����v2����C����������sY��;@A��8F�Ea�㟔q��&
�|�%z����f�<Ʊ(���?�Ծ�1h
c@��U-��Ȥ��d�^��D����-4�m�x�$�����x	�&��p�+d�iwش��e��&���x�D&V+���]A�u�LseWA���IB��|W����گ>n|�)�N���q8"G���+d�I�R����f�A%�B��|W�p���ٖEUJ��w�t�ʾ+d��ذ��$�$�I 绂������'�R��S��"C�$|W�pq�l��H�    M.�BH$� ����Aq�9�5PO�s�)4�\�Up"O�~=�/���HVR`�����,�j�-�+���G�l=�1����!"{ "�ݖQ`l����ؼ���,Aj� a�ȉ,��Hh����R��Qb?��uy��9,�^��
9����
\�7�{&�ȚUۅ��K�$(�f�o�h>��턶�A�X����@�syK�KX3�M�)C�\[��B�ox��-�8q½TX.��GhKC��㌲�ݳ<�2
�O�w7�V��Q;IW�_'�k��� ���"��x���x�u�teӌ�E6Gb���
��gZ�K����y�ב�J��f��`�ݤeLK(�.�5GBY�����?�K�P�p�O¤���(�>�Ԩ_W|vhDU{7M�=NҨ��n��q�A�]iqh8y+GC���,Wuk8 �x&{��c�G��*�n�hH��po�	�0!��I<6!��-��N�1
\ �f�p��l��cڬ]I�lӐ�����d�al�����aؾ��	�{�������%o#��"˸Lq����=1N�� �û<� m�w����^��ln�Ұr9�[�|�y�@���Uǔ�@8	�9���|�Ǳh�S�n�$O�F�'���T},������f�
�W�����'rB�'L��yD��>���|�j��D�0\��P*,�Z���2����tX)���L`dD�j9
K�ǰ��7���h�����Q����"&�}Ӝ#�,*�����F��Po�@E���_�9�5�H���_��m��9�"��(X�"#ai��ԉ�q��5Z��_�<��,W���3�F�[��\k<�M�i�̖bq�-iK���N��G5�W�j�R�b�&���:�֐~ ���t�L]Η&wX��0���p����v�l��@�3�%3!&�j)�YT������I�+C S�gC�ݣND�5����m$W&e��RWO)�u"F�A�s�=��Ԅ���~�!�����|����D�r�:E�� ��~KF`��I$�-2E���NĪ�wp�,S���;ȑ�h��D�z���Sn4������c铣7�)�?ˆU)�P�t���!}r��\��_��1�vP���!!���ްsP����N�'8��p!O#i�T}r��薵�q߯R95��Ju8�V�F��ON� �+�ol�7
������t�����''m��M�S�6x2MRс�I4�>9_�Pn��s�	��CwM������./;�q{z�p�g�4RS}r������$+�9?�DN#��'�jϤb.A!�J �!�.�k���9�#x��w�M x� _�.�GA��ǝ���(f��6G�>���0�;�O�� �Hc�X����t�C��059|��	(�ꬲ���4�&����"6oF��d�UU�H�
>K�(��c8G���_��n���4A��Lq��3#2֦O� ���O�\�62c�/j����r�t�kd�ǥ��I5�*�Y������3��R��b�P9U[\'�,�!2�b�s�c8�㬋}o��p\#Rj.I��py]�Y4޼��@�5�к\�����e�R�e��caU�\��$�`]^�y�_�}�ݭ~�{�F~Kՠj:O��	�b�YΜjT�R�ql�A	"�Cj$�T�,g@C��l>�E�@fJ.7D��r�Q������{z��	���)�(5Ä�1s`��cw�-���*WJ~��(�Y��k( �!i�p�aV�实O)H��r�]��m+����!�M'��a��l"3��,�z��n���Y�����W0{�n��֥@#�[��;�BY8�q4*�fy���8lP��L��.0F#'7�3�5��$�V7�~4 ��9��`H'�H,� Do�Uo�6��S*A02K,������7�*���bRJ�׳ՂѨ%��K��	�Ùը&SU�R�<�f�
��b�J�jx�I������fxP������6c�+�Ք�c�l&(L��R7�ɏ�kܺ�!́T�Jܴ���Fq�~�벴i^!0B�ȁV��>�	0�i�'�ƭD
��	�ánm)�����h�������ž��	�	 �4�=�̦�8��?��J�O�	0^
}�4>�|��0�
�x����F1�b]��C��3�Q�%ez����Q��c;��(�֨���F.��o4�&w�K�M���[���B,#�9it0�$c5��}���n�>�����]wx�|�,�) r��o{���N���Yq�����"��H�x���fˬr+�anBL	o��wag�}x��]x�p2��jՒZ�����X�@�v�΂ɋ��+��ۢ��/U��v�0�U��/��0o|3̛�4q�(	��R]�%w��	�b��L�
���4|,�5�&���b���-�=�4z�(;�6����:��e�4t��"�� 2�x������Y�X#���G�݅0D�a��S� � �+��Ƌ�h����m�+����Z�Fl���at[`���S�5��c3G�(hh0t�ɡ!~g�2�Y(>��V�,|d��DS�l$��p�$��!��ʪL   D2^1��&@��J�ݵ��^cx�r S�;����i��z$\Ż�g(���S��[h���E~�D���Dn�}����1f��& ��] 2�t�@�Z�Ղ��H�G"�#!Ro������G�]�LUS�����%�*���^�V�RY]\N��&�f!?��\=<�����Q��犖 �*�YHՏ����t�a+�wl�"�\*��`n�}	��fݰ�
�P&C����B�K��[�lL�cT$����RP\@��t,�������c�����!Q���1����u*1�X�-����'�fE:�{�4P�m�f� 9�YheU`@��/[�TKM .ix���*(�����]W9]E��%o�g) YhgUH�����*ΐ��g��$���V���س���-�o�H�K-��j�3�T��V�0lr�q�;Km�㶋J�P�0���[K#�WK]��"�m�~�'��^%�(��r=Q����[�����Ǽw|n��x;�
�e���f��R
h���M����O�����v$0Y��;; J�Y�2C��vx�v�w~kw�ݷH.�*�( �" �PM�����vu��s�z]�
�O��7��N�f�	�?�5��4��a�_�Ҧ���НK�2�4�kz�̰���_���C�z��1T˼��(��t����ȦQ��l�nq�h[ej,�0����PG�B����JZ Cc����3T0M㞅�!�yeM��
�аH�h�%=��f�f���O�%�"3�X���ǥ�\����tp��i��i׺�H�Y QC�|�w��A
��8U�-C�`��Y�PÀ���q�o���9����x�L�V���I� g.�p@��O(�0�����q� ��`r./�
�m���� ��^�F�06ȿ��v�jgf ����6M[�ۨ�d�j�ҙ�JX
����(.ۇ�?�5��p���H��ؙ	�q\��n�i�R� F����`��^~��W�����vS<�L�rK����c��uا-�G��>��D
�IZA����/��e�
�M�m�B3�96��Z*�� ���c9��c�� �a�E�%l�J��4<��?�c$w�8x��B�A�X� 8)�qd���Ü���Si�܋,&+�ZWrL�W�9�V0��)@;]����!�å���Z4��OAl/���ێp�osQZ�Tc�E���h�?��kx��U��6�z�	 :�ga��c�����0i�J����'�,	�D�g�|����ri�{��TR��`f@��l2�����kQ޾I�ZgH�9!�yUI��?L�nNiu����$�l>k�����vY�(���0�VP���
(��W��Z�³� PL��@*�]q ӆ2�$�69>Br�b���Of�1��q(���n(h_@    S�|(�O.�L���[QM�1[KØ�珏�|������N�8���"���y0��Jd�4�R┳������C����}4� ;F�nƲnŇ�������Z�¹I��亡��<|u>��W���?�ݟ���G�<���N��� ��au�����WM�ʮ]�=G����͸im;ɀ���_G1��P�fY����������s`�T9����E"�� �>����Q��FRp,�QL���S*�d�B�? N��Ȳ��1��6JRk`��/�\����X֘�~��*Z|N���(���䇨�:ZG&8�)v����ElǗ\I���&�
ºǂWκX����d�H�F�,+10~yi����%�D�Uۨ��΀BRǲ��1����Z�EXGd\[�ɟa�]�s@�v�ⰹu��X��t�e!�9�������9[I1�T���F_���!)�4|�j��|��))�MX��X:�8A+�͡�ef,���,Kb��O��)2�P�� ��ˊs?�Smݖi�HoB�P�cYc��C_�̘��f��-�B��eE�9�I��/Pae��I�9���'��"��qt�V��t�HY�ŵ0��c��}j.����q������zHG�miܷO��X[6z�l�P'���V	��}�-�t�mH��I����������yL�vB���
�8�F��{/���7rR#5Q�y�{���A,a����a��R���_`�(��A.a�.��T�o3窵�R$^�8
D�o�e��|�0�YR�`�4�u*$["E(y��o���� �I|
�I;X���K_�j�%��`e�XcRPi
��U!� >u���𷾌��:a R-�Go1D���0��#XsY����"IG#ۖG�1�u_�S����E2�s5�Q F��d�$I=��%��̼|�P���=_��Q*?П�9�͛�*G#0R�� x��0��L����8���:~����&�y��? T_yUmjx�6i
�c������񦊰}��.��4"TuT@q��}$��:��<oF�!Ʋ0����~T��|h�����It�,K1Eq7>��,�3���6�d&3Cb4�g��O�����O>sa@�(�h]4�r?�P��v�"��v ��W�<���2���P(
�d�[��X�2�d��H���5tuq�[�'�t��cP�W����/�"`�x�ğYM�8�P1���R���B� b��%��/�� e ��P��1�a��aA�+��� �����L6��%�]�e�n����5>3b%3���8�@s�%����.��6G��ů��@��m�ǅ�\V�mi��4I@r�����Zy�����c>����
�FP�}J5B*����P�� ���S ݦM}
ip��Ḽ�PP�~ ��!�븁a��6�(o#�*Fb��8�6������lz�	��i��;�$�����XZY�����$����YB����
�CI�30N��Nb4�����ƥQ�m�b�i��v�B�Mȵ)o#��a0�B����q�G�KE*]vO���.�)�8��B��a<��?�bݔ��; �D���`�~l�~�=�}��>R���r`"���8�Bna�;���������l�q$]�N+�T�g.)Z��-�D������Qt��m�|��b��U(V��u�Jm	�33~oܨ
.��ZN<>֏�*���@	��s�v Ȳ'�؀h�+T���җRU�J�a�>�A۴e��9?�Z�f���9ˁ	�����>�i+��5ҹ�&,��%'�]�m�}�4����*irË4�d!	/ �H�����BJn�0�� �oi��M�����$��9 ���=<��
X��L���Kr�*��^|y����������,�w9��Oa< 
/��W��#��5���b�������m�����-�{Ł8%ex�U��^�L@�9��4��hd��"��9l�]vF׮�]NW-�dY�A$L��"�#T M*2:oV(�&G#�9�����kQj(�G�+�9�8l�{��ږ�!0���Š �9���w���#}U�Q�T�ݙP�fo�s.~<��T}i��/���{j��蜯?l}�i3I E퐊�����<��k?@����b�	�~1�J�l�+��&�i�
�z�m�۔�q�}���,��E M�a_���BK�X�Vv�#�T�P��w}��?F����Bq�̪�g�A^b�9L��&�5��/s&&$��F��P>ſe:��H	�R��cT�LO��u�� ��a;��2���.���6�� ��s��)=�@RO�ր �Ih)H�^�-�0��'�j p��0���J�B��Ŋ����D�?�0}ʓg�I�A�#���@�v(K֩��I��D�Z:>�Ų9���!�٭� JL�2GӤ�5P��Y�������������%�g6.!,"�b��1�,r=�3�@l㿅�E1b1iW��Y.=��k]F�Ĩbe" &�A,x���]baA��L�V^X� `�9�ڡ�[��n���~O�z��ӂ^��A��b�K�۵���u�젥%K;*�X�c�[�|2��C,��5�2�~��><d�*��(\�<hpZ,8i���a�@�ц��R,�`��i��G�rH��B�s���%@Xp�W�6�^��f��.���rX�A�G}��B���"����r�M������4z�x2���Ă��N���4m� �$���r�Kǯ�8�a�.�JA���������p���0v�b��^�:{e%G���C��$k�^�i/���bl��C��:�r�7h6I�O�a�6(W��l4�*�\��X�n��WaII�W ���� �(����}f������J=^*��7����X��9�����X���_���ߍa�Tv�4���4�j�9#�yu��k���W�ڎ���X�џ��bA�޴v�0�1Ԃ��!^��8�g����T�2�
{^0�ڙi��Zo�0P�}���sT�[�
x�a̴�S>��߶��f4�ъ2DVyy��6|ʇ?w�>��m���s��΄cn'��c}lۓON�M��[�c��N� �2��]��B���(dId�Q ��1�x���[���H2Qk#��y����E���u^�+�4�I8#������4B��h�۶{h1�3�R:��]D��k1\�./@gByff0��0���;�:�iQ����5���Nڡ�(�����h[+O[p|j�o��?���w�7Ȕ�J�VG�)xԛ������C=��͸N`C���Z�pn���h�-�ޚ�ZT,�a 5��"Dc%m�"WL�#�r�7Fq .�5ろE�(�nˣ��&��P��W��>і7:��x�<7�y��:�,V0�I�vcKB1qn��N���V�Q�C.���A����HA1ʍ^���NI&e}7�z#?��O�o5�K\�D��O�\�5��~ߵ8㭼��&o�E������#Y�0��{U���:��c!�(�<
� ��$"bH>�����������gG ��������K5�:+U:E\$?qx��kiQ�mQxF}
m?�x�ھJ�i7��vԎ�<���<B���^��s'��TT��cd��������ь1y���2��1�SJ��H�&�p�,�ڿ���N���=,�h'kP$�D��O8��|� OHV��k�t><��������m���T��fKx6lG.��CM�5�� ,�����������kz�ը� sƁ�~,�:�و!��{<��4��.����r��#uc��$Z&N��R�A��r<:|��La9��vȍ{=~�A	 [B��4�ê7x,1�� 8��"LU587��P����K�V��Zu�]$5O�� MXB���O=���(O��,"-U�|�]�&[nӁ�_����
@�E,a])���p��|ʛ����m�Mh,=���B�T�8䊀F�����    ⿳V
�/�<�5X�cr���P�-�M�lJ�V��Ƕ��0�m�0����
zAX��lpG�q���,{8�K�MJ�{q>&�H��H
�*� �j�!��x""���J��gpD[�&� ȶD9g1��~.O%���c���m��x8p��z�)cb�<�WJ�ρi��;t�=y�g5~r���*�8� ��l�m��7-�7�mr2��g�"4�n4�8S��	����2����wt0K�n���&gÙ�d5vS�T�07�Ä�*�g���c|�E.7��Y<�Ҫhg.⸪�n��v�뭩ۨ�0��J�3� r6�]��W��/o)�T(��B�T�E��=2�6��a�8�bT��\��料kG���QP)����e�,~9^~}��]��;��f��|˘�15�W^���[ݝ~tz0�p�P�̭��0���^�$��*�� �[�u�*6LkVY�z������f�-hL��Wá���h�2�wP ?n�uI�2��|�*�NU�j[���澧K��",i�7`��Ys������Zl@�ӷ<5b����䓌�XQ�E��Y����Y6����G�x���`��8Q��5_# ��ˮ]��n��Ͱ6B�c����*3b4$�3���<	Mz�G�5$&9���^��zG�1Fm��o?����U�y�3P���>b8)��b+|��I�E���E(@�G�� �<_*H,��}$������>i�i�
�`9 ,4T[�qqW�vEJ����AE3�]�shPe k��}|&GLRHG�â��Az���L`-� �@yR���D��1kp�2sX�\��_c��*�>�[�r��Se�i�U��@��Dpm%�Dz��l�{@qW�y�R�����d��g�Hf�����.��c~���mn@VLL��s�#���>�#1�xT�@L)�H@r���y��ov����c�I�<�+7��!9��i����7*�x-�-9L�2*wկ}}[�z,�A�����|��X2�J��p���ۿ��1&`�H +���ce�L(�a�I���sx�?��f��W��0����K���M�FV�M39<V��/X�cj��n�'ʻT�_U�d���#Y,+Qe�h	��~w�|I:�R:Z�O9��G�/�������$�T�+Me��88�"�2H��#��<d�����5ՉU�y.�p�*Pe����,'�Ex����u��i[U��!��Rj��Da�1�+�l�P��ߥqf4��f�t�{�H��l�E0PW��W�8��NDɺ8�KVethF���#Nܩ\v,6x�29����׭ܰ�'�@?�l	����	�Iw���d���Q��㫘�qֵ��}פ5> 8<��>z�?��?�G,L�@���䷮4�L+�F��`���]٨
�9��>U��J\�̚�,�bT�W{��}����%Qh�f3�<�N��!� ���6�0~N�]~y?4Hs������ѩH�խ�V��Xt&�lH9���YWFC=��㟹a\��\l9)�VtBY�9�E�<�6g�
�l�9���)+�+R��>X�X��!fC�y<G ���?Ҋ�WN�u�h���(��K���o��)Jw`����5�K�-����.�wP�ʌ%���Gn�䢊�$�Z�R�a]�P��Է��a-Yv8�҄b�e�<�sXW�n�-o�f�ȹ�cQ������\�qbD�4���A-x����7]��I2c1?�����_�����a�������VȉS�s���f�5ǡ�-�����SeZ��Ԗ�s�9H<��6���n�meʠ�,�b~��˻~�6�T�И[h�o~�yr,��c���j��2�k���� 槛O�|����>M�I�I�'~���8�7Sb~��S4ԣ_cpw�,(�y1?CW@\ާ!����IX�� ��a����
��{opXW���F���ä��&��x��ud����賉��F��f��n��&����F|�[��d`h�.-��s�l�Akb	̛#����l��a�mc�A�K��P��a/>{M]Q c3�n� /�H+�"[w���}wlp���E{�>=u9=�L,��6.͜7i��Hn�'>d�b�A:�`��}
(#I�(+��a�����%$W������I`5�	�wV�Ahb	��ԫXh�*�XR
i7��C΢��%4��cvYC"S0f��d�9�� 4��٠̻�[`8W��`r��.���o�����
(W4H^���oj����E�W,F� �P�M��"��u	��! ,/����?�B��E'am<
,��d��S��KYIKuC��aQj$/�w`�A��;�V�n).v��;jS�Տs.�� �b� y��_��:���mÉ`CG&�]���o����YU�)lW�'�XV� �4���DE[���?�?.9�~!fQgу��2�K0�]��1�F��v]iCNz]Z�v��;ZG�BF	�wٵT<R{9�ڟ�����v�����iWW�C��VW=�9�Q%�;�C�2ˢ	�!�e|�M^f��"��dc9ԍ� �t�D�����!Y���9w�'M� b�jc?��,������q-�-O���)b�G`��l��Oow��/�M�y���xD�jξ���;��� �z؂KXdv��s��A�g���Tj$��5���1fS,]����(���b��-��u�����1Mq�F��%Qx�<�/j�by����2U �JJo�:0)#�����O��&�{{�U�S��%�A��d�^y���&���U�ѱT� .�4��\�r���P�;|����q`� ��M��0?s�.�7!���8l�0�<n�j��_��1m(Z�eOb�_<���M����IA��ʛ�����O����a�
���_/9$W������@��׊�k��U#,�����3*��������B��ŷs�>Ɏ=�"1
&~b������6��b��7;ة�w��4TL����@��b�
r�8驹{�^C��)�f����0"�y^E�ٮ�@.��P25�ԝ�hS��3~�[d8��:��o�f�����f���sʃ� �Y�'�kj�N0��߂��-n�y��Bc���x���&C-�	�߷������FS��*mk�L�91��ի�v���a�9ī���	X,�4Դ}�`�b�$"��t_��\��~���z��j&��]�����9��h�_�=���o�Ԅ'Ҹ���)ρzi�9;��w�&���*�eKz`ѝ1ԗ���ML_���*���r(#��N��x��L*>�A>�rH���r�;�v˻&-VF��=��R�bQ	���������;����5E� g=�5��xv���Pi)OBry������=�t��I
e��f!�  f=s|
��vu�lo����[��,���I�E�:��hm�m���l��ӧ��xJqy�n:��c{���Q�qU�îg 1�?4�E!�4lyfRC��.�د�?�bF�!E�TƠXtJ"5�CۡJQ��(f�9]��_��g ����"Q%�#Q��%��f��x�I�*`��~W�SIb�3��xNB)ׁ"��he��r<�~�둶�h��W����|�Y���
4S�@��.�m�A[�,�̬�F0�]�s���I�@��Q��Yϝx��e(";�)Oe&.�>5�����@� tpK �+�s eɋcR��酋P1q�zɉ����>��)C���:�/�����{����ע5 ����r`9 �Y_�	:)�7���z�-��]:
=V��1]L�$=�����tM�������t�x��)�!w���c�1��&�@�X��<�<�Q\�]�Цm��kC�܋T�>�I�Q�RNa�"[$Aoa�xt��]#��U�� �0>f�_|a�OB��xx?yʃ�"M������K*���xą��u_�_��/|i�?�N�������q�;4D%��Ѧ�_`T�|��X(P    b��A�����i�@N^@X�a�!����	�1)�k;�-�DO�8�����}��NJ
҅���H+� C��N�ӷ�?�|R���7(�_`]�R������/:{�^��+��a���Ig��?����98�3�L�=}��.q�� ?jc0k�Eb!) �,�w��	�$G5s[TQ�w3a.�S�"A��s�����֧�EeG-nk�Y{.��-AɕH���7߰�!��:���dl�Q&4S+����#��?5��T%��
*Rji��bҰ4S�K�.I	6�3��B���ҳ��] ˒�w���1�����	S�L��a�u���{����dȁ��8E�.�X�0�����jgƔ�4'!xT@�����7���=�S�_�X,�n�ۇ�W5�v�(J�l)��U�<h��6>���CH�d���G�k�B�M��p�9>Bq��B@j�^�� ��V�S�� ѯFJ�Q���n�r�K��<���.e�(��ȝ=oyT΍Xr�1��=�G��#Q6�8J���߈%�AT��x�L�!p����ih*y c�g��ޞ��`^��abeŒ�>��������U�����< Zr�������\?�U�PC��c��$2o4��'�+h��b���*E�A{�S.��7�Z]�b����)��b�	 Q/!y]�ڿo��T`S����#$�]��-5���KuCe�G'ƞ&��{(7c��TTB�o�j��$0����6�JbYG[ lVP��H��iz1 xW?<6I>�z	�O��������BA,tFgM첺��1</p��6�w����4�83�C.��uك%� ��HN��@Zp���/�wo���p�,��Â#��m����lS����mҘ��4iw��ӹo�=���}��7����1�nX�i��U�<�p�,�i���Jy�H�Į�(������k r	��}��ƍ��V��B��<���H��[�#	�L1�/�LÃ���Y# �(��Th�Nd��؃{j�P�۬j3Zr#Z�S����y�5��?m���x�0z�#$���!y4������;^*�F�ytA���xv��~�:�Z��Fj��Qgp�c��;�]���ja}y��<�y�<�#I�Ҵ��
ɣ�Zc9)1�2���2��X�#�u�/GB�1GWvX���,}@���qƕh6�����Gon�"V�' 2	Ұ(�;qƛ���m�=@ �?6����`t@��8F.B4N��c������bb����Ѩ,j%�ӣ�e�&eѼ8�����C*)=ȁW��e&�YN����AͷI�_�����X��6�3�~��j.n���rC�HИ�i"'�8lŵ�v���D����XE4�rb��D�L4��R�[��fm�foU���`��gg���������+�LD{�< ���m��Uׇ�-=����uL4&�|!: @�����|�H M����y�:�AY�N��PE��4���1�����`��ݠ�����&&m��(�I�&�G	֛~W�""T��J�5&gt>P���R�M�w�]Cq��)�L�9u>X L7}b�i��8�J=�H��������'L;���m�,�/c�:k)U�<���:+�vQ�Q���,n���g]�4��J�8:-�7]��C�E(���\<|I2�\``&�f�M�h��g}���m�u
i@c ���i8+Ko�b�B�L���~�#fk�Ң�(��Z��ALò�A���bFr������u_ ��z�I��V��4�1��2�~�i��u�C�dTU�|��<�� �4��@��MVz�E�c�������g]�� Ŋp id�KF�e?05��z.'8�~��n�$`��X�PL�����x��C���.��&.���ݒ|����c"�+¢y��)1����i���	��˯>Td\mY��L�k8�ʷ���D5�úI[*(�
�ÿ��p� ����4�7��!�@�G�1��H����C;1�^9΋,�8/�I���4�#�X$mc���������ؼ���d�d��qj�dWy��C|�'V�s�?a�<|RK!�R�[��@�#�إ���4�b֎��g������Sݧ�[�i�]W���n錈@/"���4�Mz�]�c�>B0��SnS# �N�-�t
!�����<��\S�B�5��Pc4ȡ�% ]�ρ��L-��+�Hi���_�p����"�d�<ѱ��Ea�}���&)r	��A�b�BT�i�DGI�voڬ>!�Ho"��|����4ZG�������ł[����e2��e�V߹b�X4�"���P�)�3�Y��A�a�Z�"�}�dI���`�h#����8bXp̀�>l�:o*R��L6��.W�����#H��ai8?hͣ�!,��៿�,ߍ6�	UX2���Eޙ����9�!D2e��f!4,�fػv����Xy�힂ٚ\p�W��6g���}<Wv͢�,������C�@�u�c�&�(����PT3��P�-BO��/8���ؤQki ���r�o-j]D����帹OET��I��Q����a�7��L��Qw-�]b$�BÂkFNm[玹���$�*��S.x�
�u����[ؤ,�m��Yp�7Y�tGq�R�i ͅ`�O��}ה�?�5�ٖ$��hC-�꛶8	����h
���V��&)׫,�!�J�i&���?5���BZ	�Rqr��7"Xpӟ�c��WbT��UY�$%��[���a�1+�?%I�Wo�g8���t��ZZPR�qH>�\� :N�?�}��:�yDJ��B �s����m����-��`*�����E���uUq(��x���Mޖ
�H��u��a"	�0K �Շ��C��M?[�9��p@�b	��%$W�wLL�����F	�_�08����ib���N
tVHKc����_�p�C�#���=m�hb�^I�]D��3(np��.�������4U���O�:�Ȏ ˢ�x��m�]X%�����l���	@��4hj�u��p$���3O|�����_]��Ҿ�S����O!��c9:Qa�#�#���38��ݡ~,;�d0��(�g�_X�g�Ǽ����<����h�1V�EBä^X�X��k�>�ԁ��l[�X�6��a˷R�48�oqm�Y�-�����\gq�=�]���WگizBI�K R`(�CwK�����h�Su7����I$z�YP�-m9��p]w�>��ƃP�#~{,'F���Ҧ�7�����ZkNi�1�(���a�ڇ��1d!��4�ibRd�Y��-�:�A�g��
a/Ui���`�K�8�s,m;�d]s�Ի�X�������8aa+AWAC���u�V�����tb�Ҟ��(����tK��~���[6n�W#���C��P1���yf�Q�/i�L������`"�Gm�L�ׇ�_�x��c4�>��>U����H���!�P`�sS?6I�&Tb��i���9���I���j�e���[�$Ve�qP�=1aKK��0�yhvM�J�0�15Lc�L�K�Df<jMf�KGx��,��]�t�h ��a��4E���\���Ё+��M�bv�b����Ws0>�壬�XkI!?F3��:�At��ҫY��.=[%��l�;������Ϋ9������x԰� �.,������#��_�v�۶�ig�!i�2I��1��0gfi�����:�\��&�dL�1'��2�K�q��8Ȼ$����Cb�N��JcUܭINKr怼E���j�$���E����&�iT2Bq]�v[p��zaAL#��<x���%�����g��c���=`��I}(�"� �ܹ�.���c��ϛ�.�Mf���'��V����Tww�a�k�]��x$�x 1�Ո%T<,��Z�����!�S;x#�?����u��]N*3Zg������s,�x�%��:���f��    9xd���;�&�#����a��HF�FRZx��<����Lm�f��p�	U	��Jr`�[ZN��k��D�����g���P�E�vn������>�+򥰴��z�+�9o������$]�i���d&�7�L{�������O��P	�D(�U�X;㠖���%�������߶*h��FRW���j��_&�}.��4$����c!��
=�
�������������� �Tu�!"*�M&p���=)&9 ��Z���J�R�W6=�wq �^t��f{���A�e��h|���Wأ/a�Ü}��8[�h� *��ڱ�r���صѯ�-5ʔ-���ZWM�8~i��7�&�nS��@Z^O��7�rhg���3���8X�V8��h/�\h��@������O���Tq������a ��̌�i�CF����c
�Z���܏I|S���P�q�7�"0lI^K����h_��yt�\�Ϝ�3�A��F�ZѮWm8d�B���~{��vYn��єXn�S`��,\��Rn��tYw}z�xG���!�o�Y���x��}C�T���D@yU�];Á��)�9�c�7�ZI����|���ԗ�����W��7����k�$�"8����\�}�Mۥ�T��SD��Xȁ3�b��`t���~�6�8l��W��tg@/�QS�|S�vg �	Yǁ��).�H����tP^C���r2)��:eeyO�鏀j��J_a/k�ު�*G�9�}{�P ��h�ct��D|?N�j�q��y_&#~ջzuY?����"Z�$V މC>�˔��ڵ� �ӻR>�s%�������(�G��
�z�@B{=/���u���`�ͳP���]Y��]��,0�����&hK�K���&Ϗ���K��{ ������9�A}���L����X�p�¿��|;���2��[��_@M�,D��V�xϲ`�x*:<��ov���]�u9w1v���D���Kt8L�x�7<Gr]���J�u�Ө�i<�P*��aӞ|����Ǧ���QU��#,H�"���si#�xа��Lѷ�,�h�RH���55�P�0��M��
V�1��1<�I�%H�������8��PJ�A�]�&����"U��z�B��5�����K�DӳV�Yk�������~���dxI�3 �Zַ8���X?
O� �����C���?�]x�w�A�I�QR���b�����z��o(l�XHN�Ԍ/¡X���s 7�fWo����	+3
���/���o���>ҒˠG˿�K��*kq@���?5���di��v���5�W!����HVI���9
����D�?��fQ���Ei�.�NP�}f�)h����0%phq�R�}T��ˣ��W�*���f�3��싐~m!��_}��]�F
/���9�j��g_�"���h���/P�x89	/� M�dw5Zm9>-$��k�aB2��쏀;֫�=.ʽ�qS��b2�ʔu��q�g�R�}�M�؃Z��((�GeE�c8��R�}Χf��� 1%o#�r�C����Rw����E�w�Y�0�<�+��q<�h5qPc��0�WD��-a�e�L��_#IkQ�j	���P�Ԛ��q(�6�PbZ����X|el���d�*<�:�������;fԦ�l�,\e9����V���C����H���|&<6P����Շ#ko�H�Z�R�t,6�l������M�����:��b$��`�)+*�7e����,-.���w`0)��_���Ў5� �H#����7��Y�p��YZ�'=l&.+�H�>bp⯫�6m�MA�I,&�����f����2ƆU���S�I��
1�y�b"�%��Hy�H��p5�f`]B�O�A�s�`�KI�<E{&Ƹ�� 
!,U	z�7] �e�JR�ankDP�a���<��׮�ߦy� ĩ�C%]�?��łu�����c�5'�,2�h`�*���D���鋧�Sl&�.bQ�O;�Z�!�@��5�UXCAlĢ�ȷ�G�Q*�3~ov*QĐ����FLzm<"B�K�e[;d��qW!�b��,a�j��4�,TE�� �A�	Y�`�0\�_i�S�bm�#�C&� IEnF�\����Q���a%�0�/A���ᔖJ;T�"
�M�sx��",�h6���(3�h�P��'�6�K��o��
ί-��ʇ`�&n���7�Qk���ih�q�LB y�%vwK[U�lG|�Uޠ��"��x�	���]�]�! �Y�/��U�&�Ȫ$`B3@`����=��o$yt#3cHw s�;h��[��En�g�Q&����	Գm�@W%^�x�~��<�Q	Z�oȔ�V��|���Oq��۶CcI�,�Q�E��ȣ&�~Ft�H1�v��3*Bab����\�]�>f���~�o���@K[|�H�q&B�~鉟�x�o��au���:�^2b���A���3'MX�t�v���]��j�^�#g�e�1�U�X,�.9)!�d�Y�0:��Dv�ACQ�E�]s�p��
M�w��
��ˀV�(�yeZt����6�>kSԒ�����I	���ၭO0��$��U{H*��6o�3�y�`R�֓r��]��>4�;�a����r+��<
�z�H��|Y!�%� �>�|��L[�us<��*R�"K@�!x!���u����~LK6J�1��ڰ�/�G�k&�|  �4�������c5�>�Z�����׿ls/S�k�ZH�<�������QL��Re
�ÆӼ(���8o�p�P��\\�*�Q���p��Sp�>5�{�~�����EJB%�<&��c���G#C��@K��ǁ�1�%����7��d����*./� B-�x{��7M�zs����EEC'�]>.�);1�#0����ݧ�UYZ�(����D��,�����o���6�|�%�"{;ђ���1�To���"t*�x��v��� ��_���n�c�O����d���<��v�#��J�D��=���M\�M��������HP (��2����� ��(*�� ֊bA)s_�&�c�����i�A�BN��GȄ*�67�#��W�� �1\��8B7qc����ާ��֌`�wY
�3�.��ǝh�U5��L&����]�Ӑv����8�&j����i8�JEr	���la~�R�!1�����d�4�#�R�������U�WrZ!��F��$��#>�O�.���"��`D�@������� &f�Xf�b��tI	0�<������m�z�Q����ZW˖�0t���Q�~��� P�Y���D��U�ė&������EI�-t�����nZ��j��?@�b��USd� ��H<��es}�,�cB��i't��7Y�3�~�7�9��b���*��E��E��4�p�o�3	!E�& !M�Ň80��*M�YH�ңgL9 �a!~}?�����WU����]�?:����׿�c.�C�ZT��q�����Ɠ�^�9��#C�� �9�
(MA@I������&	���Za8D�����v��l�P�l%B[ZN!"�>A�I�����L�x�
����P��ǃ�n��I����j��������e1�?5�D�I�a��4%4r��s������zWw��@a���X@�CMC�t�
l5�{�#9p����$$�1=A�as��y�dY"�$sQ}��!r�A�V��y���<�Z������*��eҶ��å��0<$��]Dq�?&j�T0 g/SŁ�+h:l���a[e��{P�&m=F�iT�e�S�#���1����� �YҞ�D"�jړ",��n!��s�$�Z��J	�^��#������G�����#�2�� �EH��y9�Z�(�]|"���W`,:o���ǎ��x�Tt��>Y��0���������1U��    ��*���ę�Eg�ަ�Kʋ�c���J�v<D�.�H�2L�+���o�R$��5�U1�,RF�4^���:��{uUo�C���)�� CUFe9L��q�}J(�/㍒6��Rrh�	���D�
������IoU��7�w�N��1�˶��e��-r��	qH7b�MS��,�.�&?���?ʄ��yvC�o��+;ZUX��Z�:�F=g@�=�:s�H�5OR���񨉨�}�=ԥ?nF(t�c�w�$�U�A�$�Ɵ :��*$�m�w���4\��@}���C����7d�.es�KuB���.�׭'~{hz���G�'�R������Z+Y�?���A���P��u&_��<*,TIa-1,8��Fmg��lRM�@*(�qê=�$=q�#�k��%��������eg�m,��z�G ��C�i��f08
���W�F�&m�PDi��˲!N"�g!9hj#������4�c�-�XC�Y��t����ǌ��nu��� ����oPH-d��*[�+ρ�(h�q�=�'1#�!ʍN
�n-8,�Cj�u��dM&�F�	�W؜�q@�Q�Y�-fH��ȁ����Ll��,ߪv�wM�*��Yz���<){�ē�~;��|L���H|F(�V<������Q\Һs?fC)[zL�Ř�A�9�cM�([*j@��y7�y43���x��@�,s�E&��/�����,�Nd,f�Gd�"hJ���f��=��5Y(C<G�x��i 5�q��$���]*�K&�{ZcHԖ��}�I�_a��Z�3SJ2a�S�l[(,l����b'��h�SOA���7yK��j�Tڇ���Q(w��b�aW��Ђ�B��P[�HНz	��G��ȶC%jxK[��T<ܵ;�������b?�j��^�BQ���.�Z�"9�jmU;�������G��:mh:�(
GM�"w��`��r�D	ִX��I��N�� %s�������$�U�F���W�Nk��F���oM���2G6�%@��eӟ����Ѡu���� &�f|j;�p��O}�C�M=�1�����O�v��O]� �L�wt�39Xߞ��󗃔����g���.�m	�-
C� �ڸe��I�~y@pUG��T:�֎�B�T>�x�7�S�< �����sgh�
:�J{N�вn���/��ʅuEO�:����pR�t��/'�V��>��#>%Ո��t�� �9H��*L|[{?�5~�b��~��%�8y��0�j��_���q���Ч�{��̊��G�_���~"����jPZե�$��"L�Z�pC;�iڗŊ���t�,ڡ1e?������=6����C��IQ�eP#���28l@�G ]��=r��"�%�(���,� �C���q����F�nز���sL�|.wO������o`)����Se(���kCS�G@}��ɪ�r �^�I�X�%�xn>�i��PY�U)Z^�G��(��B���D'����^�2��xfNA@��p��\���ɳw?Bm�Hohq7L]�*-�e6 ��K'��WI+���B;��X�g����O>�(BfJ[�͔b���<#���L`�Ϡ����O�*�kY��|��3�w�×ԟ��Ո\g��&X�������c0��OmH+��X@H��ZeX���|����T9��% Y3#��a����D�  FRY�A��)�,x�b2P|b��|�n�>q��+�g :��� ����s�;��ď�Pj#�$|�j%�%	 "̃ a���=l�J� P��wV��Qy&��sz�RU��:��G�e�#T�.0F,"�ɬ��~�����N+a�,514a���#�m��ި<v���12�l��vU��410#�}W�>S��S�l��Y�8�d�p�&ºdo%m�7) X�Z�ɀ��M�o6P]���a�UR�E�FL�G� Q6g�9��f�E�����7y��SK�$�?H��"��d��]W�C�*���4���{}��x����D$����E����JY�:���a���C�E���߷��,M�?([��?Xj��ł\9�HW��3`>��W�Y�hK�+�I�w��\�P>C�v�|*ڒ���i�ap8β�ƝB9�&t���'S��ڵA�O`8����ǝ��9����cAkw�������>�,Zrg���:�	Δ���I���q�veѕ;��4����ʘCc��C�J��s`0k��$։�E^�S�<{&�Y�ٴ�h>����l<�5��n*!�,�:�h��V?�]}Ky��-�&���P�^p�B>!+x�5g�N0]�����.�	K�)N�Ҝ�M�"������|���a�*�1��Us�m�f4f��Z:����8�f�"�s�}}l�&(�j8�����$��s�`�c�Ŀ�M3�c��r=,z�,��H0���$]�x�R��,�n�,��x�}{s��_��)��>���s-FY$<��\7�M�T#IExM�k8���s�2��O��&��{TŎv,� �(��8�"d��X�r�ʳ(�Xލr��A�Ht�$!0s��]���� �؇$��d-9��e�X�p�k�<��ݷ:�t)g�mNE�L��hƖ��u�����&�Z3J9+��Li��Ό)#,���H8�>k���e�]�MǢ8�e��X����w���*��2�*y�B@�-�P���O�>l����ILf��(ǁB!�:�,����%��0J`t�c?h�[����H�/����2޳̺�f�0�`�|��a����4#5�i�'rd�Y�xG��� ��R�@TM�iXU�瑆q���� �R�m�[JƤcgeuc�z���7�����W4�J���w*�a��h1��f��K��-�Rj��V�[b#��m8hK�"�2���f���뀪��X�rG@ISD����������ԇUBn
p�%�@Џ@�Z��G	�����HjpL�1ˢ�r��ٴ�����C�"��,RdyY�������I$a����6WhXFȢ���><�H͋�u���	H`�&������������H'"K��Ļ,�/�@�M�I^�����N�ᑙ��tf ��VM�}�2�^`�^)���Ċ,r0�����%�Jf�q�(�!@Uq���"���~�R��m|��Ȯ �� �,1KP��w���v]�E��1"7 xdn.��>e�羹��F��/��D�6��3����Ф�}�Py)�*6�G�����,������~�I� -�'�I�2P�xyB�f�ԇ���q��W���.�h�u�$���V������~���a�טHw�,,LtB��h�?��	�u�ݶ�qB�u���T�p����y�L{h6P&Ӥy?ו+6Of����_�ݾ�c1�*���S�O�nU<
~����m�F/�-%=�!t�Y
&�����F�՛�|Ue>�#�\�8$�VYgNq��ҳ�iں�� 1��$8L��"?s���˶;��w�o�NGZ��TȔ�%B��fxd��9�2�_��s�ˀ[*���X�$�6�Y0���$�%ʿ�nx�0;9̹�)��1�L�k�z�i���\����gd�����7ݫ$��7� �D��q����))�؟Zp��V���&����av	����ӟp
��~�uI<Ē
-s8c<�6�<�M�����H��ŝ�$��dV,��� �˘�S]��b�&���(�v�ʋ��u�X?��ĸ��>��v��)5� ^F�H�~Ԩy�+�=�䑠�bX��7H��ԨS+�Oc�`/���=K�_W���2)��\��c)�u�蹅����G!�$�}��#�DbYպE$P�hW�]{�m�\���a��2��<�rE�n�u���v���NMH,N���$,Z�E�n���~�b��)B�<�Ϟ����-������7��ڶ��fq ��2�}So����c�?h0K�v��\��@�#@z�b(v�k���DV�/#�puL*���b?G �  C�d��/͡S�������oWXMNѰb<	���L��v�١,�� �ItH��.�<��`��+;\�����>p #�� m>�g�-	��d�]G��/ h7���	�xf��B�%�`�84C���F]l!���*��p0��8Hy�M�z�v��5�7m״�S|��M��~c_�cv�T�d�
�����^<���0R���=�����<FNP;��G8�Š�*#߷��(�m�?D܂�\p���Hˡ�������K:V��fU��a�9,XPEUa	�C������Ly���>���/�$��3�LơX����0�V�IZ�9��s~<�T�P��:� �HQ)G�[���ZU���mw�]���m�`޵�>)�TH+P��UZ&g�&������������g�M��[��l=ǂ�K%�-C6)9BX�a�P����w����'o5rP���p<�x�,I/~�v��0���K{�Y�,oD{.2M��7�c�W�{���p9YN�h+%U�_���uޭ�����Jb���r���zA�9�@�E���!])���R,d�T������S*^]k Qޅ2\��4[�~�T42 /#�0,Բ�4c' ���Tz���k��仚��1�H�M3���E��W�g0�v1BSYwBL�K��y�*���saYh��΀���e���)�R<(Jc=W��@oZS9w:���k�����I�v�ND!%�	x����3pP�"�
�@ss�<��F��挦���$���OMz�\��b8����Ci*�������I�[Xƅ3�����'�c�.C�M��X�fq��Ԇ-A��������@"�-Ť������m��=ȸ}D�`�*
[]H�\��OMSO��Ö�w�0�!+_P��'�PMI�<P=<�>m����%�(�&C�c�^S?�*Ff�I7XYt�`�R(���@Q�E�p�5��8�h��#)l(�00 �D�n��6��u���<4�w�.m��@3�d�0�U"���B���~�'��?�"�!y\ �ǡ\oJ������#�1#�-�m�,��b1�hJ����C���$�9a�<�i�Pǔ �@����c�����J����R��P��ģ/@J�����L.2��!�̻�7��Cr?t�� U�|������K򰐆��z_Ĭ-�^}����-�h��4�)TL�R�$8������H>��G�&a5�*8���k�y�6��T�pܤ���]\Wt n�����V�|�;<� �[EA���X ��1������kh�.�Է�~��2ɰ�\&�Y)	�)I�"��]����3�� �I��G��A6��`4���P��� �=�Vj˦d�P���{|3�Iy�`��CŁ�c���"��������m����W�Ŭ���1��h{/�N�ـ�<�~n��:�?���m'�D���s�p����?f�7�      �   �   x��ѽ
�0�ݧ��
R���)� �����&�@�bM��Qi�P�sB��憲�(�9<Ls�׍��n�����i���T ��K��" ���?]����)����E�����bT��mfs�Z�?;�oS�W1�ȝO�z�ނ1J�
�W��z��z%hrq��{��*$|�h�G��G�~��u�76��H     