FROM postgres:16

# Переменные окружения для БД
ENV POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=postgres \
    POSTGRES_DB=examples_db

# Создаём папку для скриптов и копируем их
RUN mkdir -p /docker-entrypoint-initdb.d/scripts
COPY scripts/*.sql /docker-entrypoint-initdb.d/scripts/

# Переименовываем для правильного порядка выполнения (01, 02...)
RUN mv /docker-entrypoint-initdb.d/scripts/sql-ex-pg.sql /docker-entrypoint-initdb.d/01-sql-ex-pg.sql && \
    mv /docker-entrypoint-initdb.d/scripts/football_script.sql /docker-entrypoint-initdb.d/02-football.sql && \
    mv /docker-entrypoint-initdb.d/scripts/aero_pg_script.sql /docker-entrypoint-initdb.d/03-aero.sql && \
    mv /docker-entrypoint-initdb.d/scripts/computer_pg_script.sql /docker-entrypoint-initdb.d/04-computer.sql && \
    mv /docker-entrypoint-initdb.d/scripts/inc_out_pg_script.sql /docker-entrypoint-initdb.d/05-inc_out.sql && \
    mv /docker-entrypoint-initdb.d/scripts/painting_pg_script.sql /docker-entrypoint-initdb.d/06-painting.sql && \
    mv /docker-entrypoint-initdb.d/scripts/ships_pg_script.sql /docker-entrypoint-initdb.d/07-ships.sql

# Логируем готовность
RUN echo "PostgreSQL с примерами скриптов готов к запуску" > /docker-entrypoint-initdb.d/README

EXPOSE 5432
