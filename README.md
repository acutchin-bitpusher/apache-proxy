# apache-proxy

Apache2 proxy server for testing Built Technologies arch


##  DOCKER

* build Docker image with version tag in `version`

  * on M1 Mac ([requires special 'buildx' invocation](https://blog.jaimyn.dev/how-to-build-multi-architecture-docker-images-on-an-m1-mac/))

            TAG=`cat version | cut -f2 -d= | tr -d \'`; docker buildx build --platform linux/amd64 -t acutchinbitpusher/apache-proxy:$TAG .

  * on Linux

            TAG=`cat version | cut -f2 -d= | tr -d \'`; docker build -f Dockerfile -t acutchinbitpusher/apache-proxy:$TAG .

* push to DockerHub

        TAG=`cat version | cut -f2 -d= | tr -d \'`; docker push acutchinbitpusher/apache-proxy:$TAG


##  Build for EC2 and push to DockerHub

        DH_ACCT='acutchinbitpusher'; REPO='apache-proxy'; TAG=`cat version cut -f2 -d= | tr -d \'`; docker buildx build --platform linux/amd64 -t $DH_ACCT/$REPO:$TAG . && docker push $DH_ACCT/$REPO:$TAG

