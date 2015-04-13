#!/bin/bash

PACKAGE=$1
VERSION=$2

if [[ -z "${PACKAGE}" ]] || [[ -z "${VERSION}" ]]; then
    echo "usage: $0 PACKAGE VERSION"
    exit 1
fi

SOURCEFILE="${PACKAGE}-${VERSION}.src.tar.gz"

if [[ ! -f "${SOURCEFILE}" ]]; then
    echo "${SOURCEFILE} does not exist"
    exit 1
fi

tar --strip 1 -zxf "${SOURCEFILE}" "${PACKAGE}/.SRCINFO"