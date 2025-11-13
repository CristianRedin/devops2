IMAGE_NAME=cristianimg:latest
STACK_FILE=stack.yml
STACK_NAME=quinto

build:
	docker build -t $(IMAGE_NAME) .

deploy:
	docker stack deploy --with-registry-auth -c $(STACK_FILE) $(STACK_NAME)

rm:
	docker stack rm $(STACK_NAME)
	