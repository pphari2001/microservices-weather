aws ecr get-login-password --region us-west-2 --profile weather-ecr-agent | docker login --username AWS --password-stdin 763798617373.dkr.ecr.us-west-2.amazonaws.com
docker build -f ./Dockerfile -t cloud-weather-data-loader:latest .
docker tag cloud-weather-data-loader:latest 763798617373.dkr.ecr.us-west-2.amazonaws.com/cloud-weather-data-loader:latest
docker push 763798617373.dkr.ecr.us-west-2.amazonaws.com/cloud-weather-data-loader:latest
