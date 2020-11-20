# ue4-server
Linux container for running UE4 server


Build docker image
```
docker build -t "ue4_server" .
```

Run docker container
```
docker run -dit -p 7777:7777 --name ue4-server -v "$(pwd):/source" xparr76/ue4-server
```
