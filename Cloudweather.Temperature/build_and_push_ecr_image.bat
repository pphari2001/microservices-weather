aws ecr get-login-password --region us-west-2 --profile weather-ecr-agent | docker login --username AWS --password-stdin 763798617373.dkr.ecr.us-west-2.amazonaws.com
docker build -f ./Dockerfile -t cloud-weather-temperature:latest .
docker tag cloud-weather-temperature:latest 763798617373.dkr.ecr.us-west-2.amazonaws.com/cloud-weather-temperature:latest
docker push 763798617373.dkr.ecr.us-west-2.amazonaws.com/cloud-weather-temperature:latest
