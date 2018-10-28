## Sobre

Implanta o SonarQube junto com o banco (Postgres) com configurações bem próximas da padrão do Docker Hub e configura o LDAP.

### Observação
É necessário passar as seguintes variáveis de ambiente para o `docker-compose`: `LDAP_BIND_USER` e `LDAP_BIND_PSWD`, que definem, respectivamente, o usuário e senha de bind do LDAP. Uma maneira de fazer isso sem deixar rastros no histório de commandos do shell é utilizando o comando `read LDAP_*` e depois `export LDAP_*`.