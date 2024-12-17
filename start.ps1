docker run -v ${env:USERPROFILE}\.ssh:/root/.ssh:ro -v ${PSScriptRoot}\workspace:/home/user/workspace -p 3389:3389 --name vudu -td ubuntu-vudu /bin/bash
