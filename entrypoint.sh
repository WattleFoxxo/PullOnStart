#!/bin/sh

set -e

mkdir -p /root/.ssh
chmod 700 /root/.ssh

echo "$GIT_KEY" > /root/.ssh/id_git_key
chmod 600 /root/.ssh/id_git_key

ssh-keyscan $GIT_PROVIDER >> /root/.ssh/known_hosts

eval "$(ssh-agent -s)"
ssh-add /root/.ssh/id_git_key

if [ -d "/root/data/.git" ]; then
    cd /root/data && git pull
else
    git clone "$GIT_REPO" /root/data
fi

if [ -n "$GIT_BRANCH" ]; then
    git checkout $GIT_BRANCH
fi

if [ "$EXIT_WHEN_DONE" = "true" ]; then
    exit 0
else
    tail -f /dev/null
fi
