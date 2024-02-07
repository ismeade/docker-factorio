# docker-factorio

##### startUp
```
sudo docker run -d \
  -v /factorio/saves:/factorio/saves \
  -p 34197:34197/udp \
  --name factorio-server \
  --restart=always \
  ismeade/factorio-server:0.15.18
```
