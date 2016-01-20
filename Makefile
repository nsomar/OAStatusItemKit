build_help:
	cd OAStatusItemKit && jazzy \
	--clean \
	--author NSOmar \
	--author_url https://nsomar.com \
	--github_url https://github.com/oarrabi/OAStatusItemKit \
	--github-file-prefix https://github.com/oarrabi/OAStatusItemKit \
	--module-version 0.1.0 \
	--xcodebuild-arguments -scheme,OAStatusItemKit \
	--module OAStatusItemKit \
	--output ../../Docs/swift_output
	git stash
	git checkout gh-pages
	git fetch origin
	\git reset --hard origin/gh-pages
	git clean -fd
	\cp -rf ../Docs/swift_output/* .
	git aa
	git commit -m "Updating documentation"
	\git push origin gh-pages --force
	git co -
	- git stash pop

test:
	(cd OAStatusItemKit; xcodebuild -workspace OAStatusItemKit.xcworkspace -scheme "OAStatusItemKit"  build test | xcpretty)
