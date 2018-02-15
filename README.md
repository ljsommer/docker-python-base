# docker-python-base
Base image from Alpine latest containing Python 3 and a couple other goodies.
Not uploading this to a repository yet, so just building locally and running locally.

Usage:
docker build -t python-base .
docker run --rm python-base python -c 'print("hello world")'
