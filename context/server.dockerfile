FROM library/sonarqube:7.1-alpine

ARG LDAP_BIND_USER
ARG LDAP_BIND_PSWD
ARG SONAR_PROP_FILE="/opt/sonarqube/conf/sonar.properties"

COPY ["conf/sonar.properties", "/opt/sonarqube/conf/"]
COPY ["plugins/sonar-ldap-plugin-2.2.0.601.jar", "/opt/sonarqube/extensions/plugins/"]

RUN sed -i "s|@LDAP_BIND_USER@|${LDAP_BIND_USER}|g" "${SONAR_PROP_FILE}" \
    && sed -i "s|@LDAP_BIND_PSWD@|${LDAP_BIND_PSWD}|g" "${SONAR_PROP_FILE}"
