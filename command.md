# commands used this project

pip freeze > requirements.txt

chmod +x ./entrypoint.sh

docker-compose up -d --build


<!-- WARNING! This will remove all dangling images -->
docker image prune

<!-- go inside of docker container named django -->
docker exec -it django /bin/sh

<!-- exit from docker container -->
exit

<!-- create an app for django project from inside of the container -->
./manage.py startapp taskapp

