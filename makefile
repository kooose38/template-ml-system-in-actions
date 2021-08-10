.PHONY: build
build: 
   docker build -t kooose/ml-system-in-actions:template_0.0.1 .

.PHONY: run 
run: 
   docker run -d --name template -p 8008:8008 kooose/ml-system-in-actions:template_0.0.1

.PHONY: push 
push:
   docker push kooose/ml-system-in-actions:template_0.0.1 

.PHONY: c_up
c_up:
   docker-compose up -d 

 .PHONY: cp 
cp:
   sudo docker cp template:/PROJECT_NAME:./

.PHONY: c_down
c_down:
	docker stop template

.PHONY: rm 
rm:
   docker rm template 

.PHONY: rmi 
rmi:
   docker rmi kooose:ml-system-in-actions:template_0.0.1 
