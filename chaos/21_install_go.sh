#!/bin/bash

#version="1.11.4"
version="1.16.4"

echo -----
echo "Installing go version: ${version} ..."
goenv install ${version}
goenv global ${version}
goenv rehash
goenv versions
