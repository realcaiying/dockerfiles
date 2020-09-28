镜像制作参考 https://github.com/vimagick/dockerfiles/blob/master/scrapyd/onbuild/README.md


- packages.txt - additional packages to be installed (via apt-get install)
- dependencies.txt - dependencies for python requirements (via apt-get install/purge)
- requirements.txt - additional python packages to be installed (via pip install)


docker build --no-cache -t registry.cn-beijing.aliyuncs.com/caiying/scrapyd:<version> .

docker push registry.cn-beijing.aliyuncs.com/caiying/scrapyd:<version>