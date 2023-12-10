
####

# Local Machine

        dart_frog build
        
goto build

        docker build -t dart_server .
    
docker tag image_name:tag santamayengb/image_name

        docker tag dart_server:latest santamayengb/dart_server:1.0.0
        
docker push santamayengb/image_name
    
        docker push santamayengb/dart_server
        
#####
        
# Virtual Machine

pull the image

        docker pull santamayengb/dart_server:1.0.3
        
run the docker

        docker run -p 8080:8080 santamayengb/dart_server:1.0.3
        
####

# Operation


Stop docker running server

        docker stop container_id_here

Remove container
        
        docker rm -f container_id_here
        
Renove Image

        docker rmi -f container_id_here
    
    
####

# filter and stop specific conatiner

        docker ps -q --filter ancestor=dart_server | xargs docker stop