# Build the website. The output goes in docs/.
all:
	stack build
	stack exec mathisbd-blog rebuild

# Build the website, copy docs/ to the master branch and push.
deploy: all
# Commit the current dev branch.
	git add --all
	git commit -m "Publish"
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
	