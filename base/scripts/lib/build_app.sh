set -e

COPIED_APP_PATH=/copied-app
BUNDLE_DIR=/tmp/bundle-dir

# sometimes, directly copied folder cause some wierd issues
# this fixes that
if [[ $GIT_REPO_URL ]]; then
  if [[ $BRANCH_NAME ]]; then
    git clone $GIT_REPO_URL -b $BRANCH_NAME /app
  else
    git clone $GIT_REPO_URL /app
  fi
fi
cp -R /app $COPIED_APP_PATH
mv $COPIED_APP_PATH/.ssh ~
cd $COPIED_APP_PATH

meteor build --directory $BUNDLE_DIR --server=http://localhost:3000

cd $BUNDLE_DIR/bundle/programs/server/
npm i

mv $BUNDLE_DIR/bundle /built_app

# cleanup
rm -rf /app
rm -rf $COPIED_APP_PATH
rm -rf $BUNDLE_DIR
rm -rf ~/.meteor
rm /usr/local/bin/meteor
