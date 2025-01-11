DATE=\"$(date +"%m/%d/%Y_%H:%M_%Z")\"
sudo docker build --build-arg BUILD_VER=$DATE -t ubuntu-basic .
