sonar_project=sonar-scanner-cli-3.2.0.1227-linux
sonar_download_url=https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/$sonar_project.zip

curl $sonar_download_url -L --output $sonar_project.zip
unzip $sonar_project.zip

PATH=$PATH:`pwd`/$sonar_project

sonar-scanner \
  -Dsonar.projectKey=mattpjohnson_node-typescript-boilerplate \
  -Dsonar.organization=mattpjohnson-github \
  -Dsonar.sources=. \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.login=SONAR_LOGIN
