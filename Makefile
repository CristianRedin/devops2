# Nombre de la imagen y del stack
IMAGE_NAME=cristianimg:latest
STACK_FILE=stack.yml
STACK_NAME=quinto

# Construir la imagen
build:
    docker build -t $(IMAGE_NAME) .

# Desplegar el stack en Swarm
deploy:
    docker stack deploy --with-registry-auth -c $(STACK_FILE) $(STACK_NAME)

# Eliminar el stack
rm:
    docker stack rm $(STACK_NAME)
