if [ -x /usr/bin/git ]; then
    fail "git not installed"
fi

if [ -x /usr/bin/npm ]; then
    fail "npm not installed"
fi

if [ ! -d ".git" ]; then
    fail "No git repository found"
fi

if [ -z $WERCKER_TICK_VERSION_TOKEN ]; then
    fail "No git token supplied"
fi

git_token="https://$WERCKER_TICK_VERSION_TOKEN@github.com/$WERCKER_GIT_OWNER/$WERCKER_GIT_REPOSITORY.git"

npm config set sign-git-tag true
npm version patch -m 'Version Change'
git push $git_token
git push --tags $git_token

success "New version applied with git tag"
