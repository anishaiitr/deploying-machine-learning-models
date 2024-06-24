NAME=udemy-mlops-ecr
COMMIT_ID=$(shell git rev-parse HEAD)
PIP_EXTRA_INDEX_URL=https://Zzi76ZMPPyk3donbWkeM:@pypi.fury.io/ANISHAIITR/


build-ml-api-heroku:
	docker build --build-arg PIP_EXTRA_INDEX_URL=${PIP_EXTRA_INDEX_URL} -t registry.heroku.com/$(NAME)/web:$(COMMIT_ID) .

push-ml-api-heroku:
	docker push registry.heroku.com/${HEROKU_APP_NAME}/web:$(COMMIT_ID)

build-ml-api-aws:
	docker build --build-arg PIP_EXTRA_INDEX_URL=${PIP_EXTRA_INDEX_URL} -t $(NAME):$(COMMIT_ID) .

push-ml-api-aws:
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/$(NAME):$(COMMIT_ID)

tag-ml-api:
	docker tag $(NAME):$(COMMIT_ID) ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/$(NAME):$(COMMIT_ID)
