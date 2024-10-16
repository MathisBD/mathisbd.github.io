# Build the website. The output goes in docs/.
all:
	stack build
	stack exec mathisbd-blog rebuild

# Copy the website (docs/) to the master branch and push.
# Uses the last commited version of docs/.
deploy: all
# Go to the master branch.
	git checkout master
# Copy the docs folder and the .gitignore.
	git checkout dev -- docs .gitignore
# Add everything and commit.
	git add --all
	git commit -m "Publish"
	git push
# Return the the dev branch.
	git checkout dev
	