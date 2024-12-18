docker run -v ${env:USERPROFILE}\.ssh:/root/.ssh:ro -v ${PSScriptRoot}\sync:/home/user/sync -v volume-qt:/home/user/workspace -p 3389:3389 --name qt -td ubuntu-qt /bin/fish
