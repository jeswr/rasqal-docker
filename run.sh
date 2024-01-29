docker build . -t rasqal-docker
docker create --name rasqal-docker rasqal-docker
docker cp rasqal-docker:/usr/local/lib/ ./build
docker rm rasqal-docker

