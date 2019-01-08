#!/bin/sh

validate_dependencies() {
    if [ ! -e /usr/bin/git ]; then
        echo "git not installed"
    fi

    if [ ! -e /usr/bin/npm ]; then
        echo "npm not installed"
    fi

    if [ ! -d ".git" ]; then
        echo "No git repository found"
    fi
}

validate_token(){
    if [ -z $WERCKER_TICK_VERSION_TOKEN ]; then
        fail "No git token supplied"
    fi
}

main() {
    validate_dependencies;
    validate_token;

    local git_token="https://$WERCKER_TICK_VERSION_TOKEN@github.com/$WERCKER_GIT_OWNER/$WERCKER_GIT_REPOSITORY.git";

    npm config set git-tag-version true
    echo "set Git tag version config to true"

    git config --global user.email "builds@test.com"
    git config --global user.name "Build Pipeline"

    echo "set git config to builds@test.com and Build Pipeline"

    npm version patch -m 'Version Change'

    echo "Changed version in package.json"

    git add package-lock.json
    git commit -m "Version Change"

    echo "Committed change to package-lock.json"

    git push $git_token HEAD:$WERCKER_GIT_BRANCH
    git push --tags $git_token

    success "New version applied with git tag"
}

main;
