docker run -v ${env:USERPROFILE}\.ssh:/root/.ssh:ro -v ${PSScriptRoot}\workspace:/home/user/workspace -p 3389:3389 --name basic -td ubuntu-basic /bin/bash
