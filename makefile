.PHONY: clone config init install post-merge

install:
	pip install -r requirements.txt

clone: 
	git clone https://github.com/Jack-cky/SuperPriceWatchdog.git

config:
	cp SuperPriceWatchdog/config/.env.example SuperPriceWatchdog/config/.env
	curl -L -o SuperPriceWatchdog/config/NotoSansCJK-Bold.ttc https://github.com/notofonts/noto-cjk/raw/refs/heads/main/Sans/OTC/NotoSansCJK-Bold.ttc

post-merge:
	echo "#!/bin/sh" > SuperPriceWatchdog/.git/hooks/post-merge
	echo "touch /var/www/superpricewatchdog_pythonanywhere_com_wsgi.py" >> SuperPriceWatchdog/.git/hooks/post-merge
	chmod +x SuperPriceWatchdog/.git/hooks/post-merge

init: install clone config post-merge
