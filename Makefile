# Build the website. The output goes in docs/.
build:
	stack build
	stack exec mathisbd-blog rebuild
