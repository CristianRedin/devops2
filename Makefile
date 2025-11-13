# Definir el nombre de la imagen Docker
IMAGE_NAME=cristianimg:latest

# El nombre del archivo de configuración de Docker Stack
STACK_FILE=stack.yml

# El nombre de la pila (stack) que se desplegará
STACK_NAME=quinto

# Comando para construir la imagen Docker
build:
	docker build -t $(IMAGE_NAME) .

# Comando para desplegar la pila (stack) usando el archivo stack.yml
deploy:
	docker stack deploy --with-registry-auth -c $(STACK_FILE) $(STACK_NAME)

# Comando para eliminar la pila (stack) en caso de que necesites detenerla y eliminarla
rm:
	docker stack rm $(STACK_NAME)

# Comando para listar las pilas (stacks) activas en Docker Swarm (opcional)
list:
	docker stack ls

# Comando para ver los servicios de una pila (stack) específica
services:
	docker stack services $(STACK_NAME)

# Comando para ver los logs de un servicio específico dentro de la pila (stack) (opcional)
logs:
	docker service logs $(STACK_NAME)_web
