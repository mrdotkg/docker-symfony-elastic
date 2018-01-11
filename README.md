# Docker Symfony LOGTOELK application

Clone the project

```
git clone https://github.com/measdot/docker-symfony-logtoelk.git
```


Run the following commands in same order and then check https://0.0.0.0:8080

```
docker build . --tag "symfony"
docker run -d --name logtoelk symfony
docker cp logtoelk:/appcode .   
docker rm -f logtoelk
docker run -d -p 8080:8080 --name logtoelk -v $(pwd)/appcode:/appcode symfony
```