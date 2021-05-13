# Login to docker shell interactively

List all docker processes by running `docker ps -a`.

```bash
docker ps -a

CONTAINER ID   IMAGE                                               COMMAND                  CREATED         STATUS                     PORTS                    NAMES
0727ac3f88e7   form3_client_tests                                  "/bin/sh -c 'go test…"   6 minutes ago   Exited (1) 6 minutes ago                            form3-client-tests
9a267a9f7a4a   form3tech/interview-accountapi:v1.0.0-4-g63cf8434   "./entrypoint.sh"        6 minutes ago   Up 6 minutes               0.0.0.0:8080->8080/tcp   form3_accountapi_1
378141ca607b   postgres:9.5-alpine                                 "docker-entrypoint.s…"   6 minutes ago   Up 6 minutes (healthy)     5432/tcp                 form3_postgresql_1
daca08b7dd99   vault:0.9.3                                         "docker-entrypoint.s…"   6 minutes ago   Up 6 minutes               8200/tcp                 form3_vault_1
```

Then run `docker exec -it <container id> sh`

```bash
docker exec -it 0727ac3f88e7 sh
```
