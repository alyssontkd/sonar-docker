## Sobre

Implanta o SonarQube junto com o banco (Postgres) com configurações bem próximas da padrão do Docker Hub e configura o LDAP.

### Observação
É necessário passar as seguintes variáveis de ambiente para o `docker-compose`: `LDAP_BIND_USER` e `LDAP_BIND_PSWD`, que definem, respectivamente, o usuário e senha de bind do LDAP. Uma maneira de fazer isso sem deixar rastros no histório de commandos do shell é utilizando o comando `read LDAP_*` e depois `export LDAP_*`.

### Exemplo do arquivo de configuração do proxy reverso para NGINX
```
server {
        listen 80;
        server_name sonar.vertenti.com.br;
        location / {
            proxy_pass http://127.0.0.1:9000;
            proxy_redirect off;
            proxy_bind 127.0.0.1;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Host $server_name;
            client_max_body_size 0;
        }
}
```
