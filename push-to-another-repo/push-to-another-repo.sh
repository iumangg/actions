#!/bin/sh -l
set -e

echo "> Starting - Push to another repository script"

if [ ! -f "${INPUT_SOURCE}" ] && [ ! -d "${INPUT_SOURCE}" ]; then
  echo "No source specified"
  exit 1
fi

# Setting Git configuration
echo "> Git version"
git --version
echo "> Setting Git configuration"
git config --global user.name "${INPUT_USER_NAME}"
git config --global user.email "${INPUT_USER_EMAIL}"
# git lfs install

# Setup directories
echo "> Setup directories"
CURR_DIR=$(pwd)
echo "CURR_DIR - $CURR_DIR"
DEST_CLONE_DIR=$(mktemp -d)
echo "DEST_CLONE_DIR - $DEST_CLONE_DIR"

# Clone the destination repo in the destination clone directory and cd into it
echo "> Cloning destination git repository ${INPUT_DESTINATION_REPO_NAME} using API Token"
DESTINATION_REPO_USERNAME=$(echo $INPUT_DESTINATION_REPO_NAME | cut -d '/' -f 1)
REPO_URL="https://$DESTINATION_REPO_USERNAME:${INPUT_ACCESS_KEY}@${INPUT_SERVER}/${INPUT_DESTINATION_REPO_NAME}.git"
echo "REPO_URL - $REPO_URL"
git clone "$REPO_URL" "$DEST_CLONE_DIR"
cd "$DEST_CLONE_DIR"
pwd & ls -la

# Checkout destination branch and create new branch if it doesn't exist
echo "> Checkout destination branch and creat new branch if it doesn't exist"
git checkout ${INPUT_DESTINATION_BRANCH} || git checkout -b ${INPUT_DESTINATION_BRANCH}
git status

# Ensure destination directory exist, and remove files if needed
echo "> Ensure destination directory exist, and remove files if needed"
mkdir -p ${INPUT_DESTINATION_DIRECTORY}
if [ "${INPUT_DELETE_DESTINATION_CONTENT}" = "true" ]; then
    git rm -rf ./${INPUT_DESTINATION_DIRECTORY}/*
fi

# Copy contents from source to destination
echo "> Copying contents of source repo to destination git repo ${INPUT_DESTINATION_REPO_NAME}"
if [ -f $CURR_DIR/${INPUT_SOURCE} ]; then
    cp -a $CURR_DIR/${INPUT_SOURCE} $DEST_CLONE_DIR/${INPUT_DESTINATION_DIRECTORY}
elif [ -d $CURR_DIR/${INPUT_SOURCE} ]; then
    cp -a $CURR_DIR/${INPUT_SOURCE}/* $DEST_CLONE_DIR/${INPUT_DESTINATION_DIRECTORY}
fi
git status

echo "> Setting Git configuration - add safe.directory"
git config --global --add safe.directory "$DEST_CLONE_DIR"

echo "> Git commands to commit and push to another repository"
git add .
git commit -m "${INPUT_COMMIT_MESSAGE}" || echo
git push -u origin ${INPUT_DESTINATION_BRANCH}

# Output the commit hash
echo "COMMIT_HASH=$(git rev-parse HEAD)" >> "$GITHUB_OUTPUT"

echo "> Completed - Push to another repository script"
