sudo docker run -v ~/.ssh:/root/.ssh:ro -v ${pwd}/sync:/home/user/sync -v volume-basic:/home/user/workspace -p 3390:3389 --name basic -td ubuntu-basic /bin/fish
