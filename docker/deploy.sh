#!/usr/bin/env bash
mode=("development" "production" "stop" "build" "staging" "tag")

if [[ -z "$1" ]]; then
	printf "Please provide mode to deploy\n"
	echo "development, production, or stop"
elif [[ ! "${mode[*]}" =~ "$1" ]]; then
	echo "Mode invalid"
	echo "Please choose one of the mode: development, production and stop "
else
	if [[ "$1" == "development" ]]; then
		docker-compose --env-file ../.env -f ./docker-compose.dev.yml up --build
	elif [[ "$1" == "production" ]]; then

		cd ../server && yarn build
		cd ../client && yarn build
		cd ../docker && docker-compose --env-file ../.env -f ./docker-compose.prod.yml up --build

	elif [[ "$1" == "staging" ]]; then

		cd ../docker && docker-compose --env-file ../.env -f ./docker-compose.stag.yml up --build

	elif [[ "$1" == "build" ]]; then

		if [[ -z "$2" ]]; then
			printf "Please provide mode to deploy\n"
			echo "development, production, staging"
		elif [[ ! "${mode[*]}" =~ "$2" ]]; then
			echo "Type build invalid"
			echo "Please choose one of the type: development, production and staging "
		else

			if [[ "$2" == "development" ]]; then
				cd ../docker && docker-compose --env-file ../.env -f ./docker-compose.dev.yml build
			elif [[ "$2" == "production" ]]; then

				cd ../docker && docker-compose --env-file ../.env -f ./docker-compose.prod.yml build

			elif [[ "$2" == "staging" ]]; then
				cd ../docker && docker-compose --env-file ../.env -f ./docker-compose.stag.yml build
			fi
		fi


	elif [[ "$1" == "stop" ]]; then
		if [[ -z "$2" ]]; then
			printf "Please provide mode deployed\n"
			echo "development, production, staging"
		elif [[ ! "${mode[*]}" =~ "$2" ]]; then
			echo "Type build invalid"
			echo "Please choose one of the type: development, production and staging "
		else

			if [[ "$2" == "development" ]]; then
				cd ../docker && docker-compose --env-file ../.env -f ./docker-compose.dev.yml down
			elif [[ "$2" == "production" ]]; then

				cd ../docker && docker-compose --env-file ../.env -f ./docker-compose.prod.yml down

			elif [[ "$2" == "staging" ]]; then
				cd ../docker && docker-compose --env-file ../.env -f ./docker-compose.stag.yml down
			fi
		fi
	fi
fi
