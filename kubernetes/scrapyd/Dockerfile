FROM vimagick/scrapyd:py3

ADD ./*.txt /etc/scrapyd/
RUN sed -i 's#http://deb.debian.org#https://mirrors.aliyun.com#g' /etc/apt/sources.list; \
    cd /etc/scrapyd; \
            [ -f packages.txt -o -f dependencies.txt ] && apt-get update; \
            [ -f packages.txt ] && xargs -r apt-get install -y < packages.txt; \
            [ -f dependencies.txt ] && xargs -r apt-get install -y < dependencies.txt; \
            [ -f requirements.txt ] && pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com -r requirements.txt; \
            [ -f dependencies.txt ] && xargs -r apt-get purge -y --auto-remove < dependencies.txt; \
            [ -f packages.txt -o -f dependencies.txt ] && rm -rf /var/lib/apt/lists/*
