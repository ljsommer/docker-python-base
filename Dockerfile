FROM alpine:latest

RUN apk add --no-cache --update \
	bash \
	git \
	openssh \
	python3 && \
	python3 -m ensurepip && \
	rm -r /usr/lib/python*/ensurepip && \
	pip3 install --upgrade pip setuptools && \
	if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip; fi && \
	if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
	rm -r /root/.cache

RUN pip3 install --upgrade \
	awscli --upgrade --user \
	boto3 \
	pyyaml

RUN mkdir /root/.aws/ && chmod 0700 /root/.aws/
RUN mkdir /root/.ssh/ && chmod 0700 /root/.ssh/

ONBUILD ADD . /app/src
