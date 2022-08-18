Prerequisites:

 - Docker
 - Git
 - GNU Make
 - bash shell
 - jq

For fresh virtual machine need to make .env:

    cp .env.example .env


Probably, file permissions may be insufficient:

    chmod -R 0775 .

And git must ignore changed file permissions:

    git config core.fileMode false

And starts all services:

    make up

Login to Docker Registry

    docker login -u <registry_auth_name> https://registry.<domain>


Articles:

 - https://habr.com/ru/post/659813/
 - https://habr.com/ru/company/badoo/blog/507718/
