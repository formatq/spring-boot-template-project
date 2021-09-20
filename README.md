# Spring Boot Template Project

Java service project with Spring Boot, H2/Postgresql, Jooq, Liquibase

The migration of db changes (Liquibase) executes by application starting. The Jooq Code Generator uses H2 emulation. No
need real database instance.

This project created as example and might be used as template for your new own projects.

## H2

By default, H2 started on application run. For entering to H2 CONSOLE go to /h2-console, enter Url 'jdbc:h2:mem:db',
press Connect

## Postgres

For work with Posgresql need activate Spring Boot profile 'local' For entering to H2 CONSOLE page go to '/h2-console',
enter Url 'jdbc:postgresql://127.0.0.1:5432/db?ApplicationName=h2', enter user and pass (for, example "db" "db"), press
Connect

### Posgres in Docker (developing)

In directory '/docker' run 'run_down_up.sh' for starting Posrtgesql server in docker container. For more information
check '/docker/docker-compose.yml' and '/docker/postgresql/init.sh'

## Liquibase

All jooq-generated code of DB classes must do a developer using maven plugin 'jooq-codegen-maven'. These classes will
saved in git. After that, ci/cd must not generate code (plugin need to turn off). Spring Boot will start all migrations
while starting application.

You can turn off Spring migrations using property 'spring.liquibase.enabled'
You can turn on Compile migrations using maven profile 'generate-code'