docker run -v ${env:USERPROFILE}\.ssh:/root/.ssh:ro -v ${PSScriptRoot}\sync:/home/user/sync -v volume-basic:/home/user/workspace -p 3390:3389 --name basic -td ubuntu-basic /bin/fish
