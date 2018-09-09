npx sonarqube-scanner \
  -Dsonar.projectKey=mattpjohnson_typescript-library-boilerplate \
  -Dsonar.organization=mattpjohnson-github \
  -Dsonar.sources=. \
  -Dsonar.exclusions=node_modules/**,coverage/** \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.login=$SONAR_LOGIN
