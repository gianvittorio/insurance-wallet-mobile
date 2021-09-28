# insurance-wallet-mobile

Please, run the command down below, to spinning the app. Server will bre listening on port 8082:
```console
docker-compose up -d --build
```


You can check the logs, by:
```console
docker-compose logs --tail <number of lines> --follow app
```


Finally, run the below command to, gracefully, shutting things down:
```console
docker-compose down
```