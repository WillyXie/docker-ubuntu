docker run -v ${env:USERPROFILE}\.ssh:/root/.ssh:ro -v ${PSScriptRoot}\work:/work -p 3389:3389 --name basic -td ubuntu-basic /bin/bash
