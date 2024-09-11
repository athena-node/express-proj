start:
	sh bin/app-init.sh
	pm2 start boot.json --env dev
stop:
	pm2 stop tiga
restart:
	pm2 restart tiga
logs:
	pm2 logs tiga
monit:
	pm2 monit
deps:
	npm install
.PHONY: logs
