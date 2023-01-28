FROM docker.io/python:3.10

RUN python -m pip install pipenv

WORKDIR /build
COPY Pipfile .
COPY Pipfile.lock .

RUN python -m pipenv install

COPY . .

RUN python -m pipenv run mkdocs build



FROM docker.io/nginx:alpine
WORKDIR /app/site
COPY ./nginx.conf /etc/nginx/nginx.conf

COPY --from=0 /build/site .
