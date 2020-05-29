

## 编译命令

```bash
dotnet publish --framework netcoreapp3.1 --configuration Release --output dist

dotnet run 

```

```docker
docker build . -t yoyomooc.azurecr.io/exampleapp -f Dockerfile

docker push yoyomooc.azurecr.io/exampleapp

```

```bash
docker create -p 3000:80 --name exampleApp3000 yoyomooc.azurecr.io/exampleapp
```


docker run -p 80:80 --name exampleApp yoyomooc.azurecr.io/exampleapp
