.PHONY: help pr

help:
	@echo "\`make <target>\` where <target> is one of"
	@echo "  lk			necessary links"
	@echo "  gc			git clone the work repository"
	@echo "  ss			checks for the service status of the DBs"
	@echo "  uv			make a PostgreSQL ubuntu volume"
	@echo "  vo			make a PostgreSQL volume for other OS"
	@echo "  pc			PostgreSQL commands"
	@echo "  ad			pgadmin commands"
	@echo "  pa			phpadminer commands"

lk:
	@echo https://docs.google.com/presentation/d/1DxFjOH5rWBaqaO4u8HnTc_aA36c6ALxOiAa5KDEeK6k/edit?usp=sharing
	@echo https://hub.docker.com/r/ichux/sqlraw
	@echo https://github.com/ichux/sqlraw
	@echo https://insights.stackoverflow.com/survey/2020
	@echo https://insights.stackoverflow.com/survey/2020#technology-programming-scripting-and-markup-languages
	@echo https://insights.stackoverflow.com/survey/2020#technology-databases

gc:
	@git clone git@github.com:ichux/sqlraw.git

ss:
	@sudo service mysql status && sudo service mysql status

uv:
	@#make uv id=$PWD/psql
	@test -d $(id) || mkdir -p $(id)
	@docker volume inspect psql | grep psql > /dev/null || docker volume create --driver local --opt type=tmpfs --opt device=$(id) --opt o=bind psql
	@docker volume inspect psql

vo:
	@#make vo id=$PWD/psql
	@test -d $(id) || mkdir -p $(id)
	@docker volume inspect psql | grep psql > /dev/null || docker volume create --driver local --opt type=none --opt device=$(id) --opt o=bind psql
	@docker volume inspect psql

pc:
	@echo make -C docker-postgresql up
	@echo make -C docker-postgresql stop
	@echo make -C docker-postgresql start
	@echo make -C docker-postgresql restart
	@echo make -C docker-postgresql down
	@echo make -C docker-postgresql cr8
	@echo make -C docker-postgresql logs

ad:
	@echo make -C pgadmin up
	@echo make -C pgadmin logs

pa:
	@echo make -C phpadminer up
	@echo make -C phpadminer logs
