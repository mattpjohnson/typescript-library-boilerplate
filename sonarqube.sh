sonar_version=3.2.0.1227-linux
sonar_project_dir=sonar-scanner-$sonar_version
sonar_download_url=https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$sonar_version.zip

curl $sonar_download_url -L --output sonar.zip
unzip sonar.zip

PATH=$PATH:`pwd`/$sonar_project_dir/bin

sonar-scanner \
  -Dsonar.projectKey=mattpjohnson_node-typescript-boilerplate \
  -Dsonar.organization=mattpjohnson-github \
  -Dsonar.sources=. \
  -Dsonar.exclusions=coverage,node_modules
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.login=$SONAR_LOGIN
