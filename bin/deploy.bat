set SRC_BRANCH="source"
set DEPLOY_BRANCH="gh-pages"

if NOT (git diff-index --quiet HEAD --); 
(echo "Changes to the following files are uncommitted:"
    git diff-index --name-only HEAD --
    echo "Please commit the changes before proceeding."
    echo "Aborting."
	EXIT 1)