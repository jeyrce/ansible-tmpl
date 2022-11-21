#!/usr/bin/env bash
#coding: utf8

docker run -i --rm --net host \
	-v "${PWD}:/ansible/" \
	-v /etc/localtime:/etc/localtime \
	-v /etc/timezone:/etc/timezone \
	-e ANSIBLE_HOST_KEY_CHECKING=False \
	-e LANG="${LANG}" \
	jeyrce/ansible:latest ansible-playbook \
	--scp-extra-args '-o StrictHostKeyChecking=no' \
	--sftp-extra-args '-o StrictHostKeyChecking=no' \
	--ssh-common-args '-o StrictHostKeyChecking=no' \
	--ssh-extra-args '-o StrictHostKeyChecking=no' \
	-k -K "$@"
