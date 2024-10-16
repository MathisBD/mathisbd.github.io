.PHONY: all, deploy

# Build the website. The output goes in docs/.
all:
	stack build
	stack exec mathisbd-blog rebuild

# Build the website, copy docs/ to the master branch and push.
deploy: all
# Commit the current dev branch.
	git checkout dev
	git add --all
	git commit --allow-empty -m "Publish"
	git push
# Go to the master branch.
	git checkout master
# Copy the docs folder and some other files.
	git checkout dev -- docs .gitignore LICENSE README.md
# Add everything and commit.
	git add --all
	git commit --allow-empty -m "Publish"
	git push
# Return to the dev branch.
	git checkout dev
	