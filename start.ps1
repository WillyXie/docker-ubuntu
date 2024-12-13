docker run -v ${env:USERPROFILE}\.ssh:/root/.ssh:ro -v ${PSScriptRoot}\sync:/home/user/sync -v volume-n2nic:/home/user/workspace -p 3389:3389 --name n2nic -td ubuntu-n2nic /bin/fish
