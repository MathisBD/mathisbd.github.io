# Build the website. The output goes in docs/.
all:
	stack build
	stack exec mathisbd-blog rebuild
	