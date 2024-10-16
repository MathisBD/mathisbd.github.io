# Build the website. The output goes in docs/.
build:
	stack build
	stack exec mathisbd-blog rebuild

deploy: build
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