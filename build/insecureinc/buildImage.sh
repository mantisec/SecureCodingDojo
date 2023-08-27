cd ../..
docker build -f build/insecureinc/Dockerfile -t mantisec/insecure.inc .
docker push mantisec/insecure.inc