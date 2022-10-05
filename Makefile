help:
	@echo "Usage:"
	@echo "    make [subcommand]\n"
	@echo "Subcommands:"
	@echo "    install   Install the theme dependencies"
	@echo "    clean     Clean the workspace"
	@echo "    status    Display status before push"
	@echo "    build     Build the test site"
	@echo "    server    Make a livereload jekyll server to development"
	@echo "	   s	Make a jekyll server to development without livereload"



install:
	@gem install jekyll bundler
	@bundle install

clean:
	@bundle exec jekyll clean

status: clean
	@git status

build:
	export JEKYLL_ENV=production
	export NODE_ENV=production
	@bundle exec jekyll build --safe --profile
gh-pages:
	export JEKYLL_ENV=production
	export NODE_ENV=production
	@bundle exec jekyll build --baseurl "${{ steps.pages.outputs.base_path }}" --profile	
server:
	@bundle exec jekyll server --safe --livereload
s:
	@bundle exec jekyll server --safe