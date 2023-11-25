# Usa la imagen base alpine
FROM alpine:latest

# Instala el cliente de PostgreSQL
RUN apk --no-cache add postgresql-client

# Configura la variable de entorno para la conexión a PostgreSQL
ENV PGHOST=69.164.197.95
ENV PGUSER=odoo
ENV PGPASSWORD=odoo
ENV PGDATABASE=SISCOPE
ENV PGPORT=5432

WORKDIR /docker-entrypoint-initdb.d

# Ejecuta la sentencia SQL al iniciar el contenedor
CMD ["psql", "-U", "$PGUSER", "-h", "$PGHOST", "-d", "$PGDATABASE", "-f", "/docker-entrypoint-initdb.d/mi_archivo.sql"]

