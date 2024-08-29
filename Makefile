@@ -6,16 +6,16 @@ SERVICE_NAME=mysql
HOST=127.0.0.1
PORT=3306

PASSWORD=${ROOT_PASSWORD}
DATABASE=${proyecto_pedidos}
PASSWORD=${MYSQL_ROOT_PASSWORD}
DATABASE=${MYSQL_DATABASE}
BACKUP_DIR_FILES=${BACKUP_DIR}

DOCKER_COMPOSE_FILE=./docker-compose.yml
DATABASE_CREATION=./structure/database_structure.sql
DATABASE_CREATION=./structure/proyecto_pedidos.sql
DATABASE_POPULATION=./structure/population.sql
CURDATE=$(shell date --iso=seconds)

FILES = vistas funciones stored_procedures triggers
FILES = views functions stored_procedure triggers roles_users

.PHONY: all up objects clean

@@ -41,7 +41,7 @@ objects:
	@echo "Create objects in database"
	@for file in $(FILES); do \
	    echo "Process $$file and add to the database: $(DATABASE_NAME)"; \
	docker exec -it $(SERVICE_NAME)  mysql -u root -p$(PASSWORD) -e "source $$file"; \
	docker exec -it $(SERVICE_NAME)  mysql -u root -p$(PASSWORD) -e "source /objects/$$file.sql"; \
	done

test-db:
