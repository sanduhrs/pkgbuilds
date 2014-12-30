#!/bin/bash

PACKAGE=$1

if [[ -z "${PACKAGE}" ]]; then
    echo "please specify package name"
    exit 1
fi

if [[ -d "${PACKAGE}" ]]; then
    echo "${PACKAGE} exists"
    exit 1
fi

AUR4HOST=${AUR4HOST:-aur-dev.archlinux.org}
AUR4USER=${AUR4USER:-aur}
AUR4PORT=${AUR4PORT:-2222}

TEMP="$(mktemp -d --tmpdir aurpackage.XXXXX)"

pushd "${TEMP}"
git init
git remote add origin "ssh+git://${AUR4USER}@${AUR4HOST}:${AUR4PORT}/${PACKAGE}.git"
echo "initialized new repository at ${TEMP} - Please add PKGBUILD and .SRCINFO."
read
git push -u origin master
popd

rm -r "${TEMP}"

ssh -p${AUR4PORT} ${AUR4USER}@${AUR4HOST} setup-repo "${PACKAGE}"
git submodule add "ssh+git://${AUR4USER}@${AUR4HOST}:${AUR4PORT}/${PACKAGE}.git/" "${PACKAGE}"
git submodule add "ssh+git://${AURs4USER}@${AUR4HOST}:${AUR4PORT}/${PACKAGE}.git/" "${PACKAGE}"
git submodule update