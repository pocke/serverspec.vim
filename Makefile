all:
	bundle exec ruby lib/serverspec_info.rb > autoload/serverspec_info.json
	bundle exec ruby lib/gen_snippet.rb     > neosnippets/ruby.serverspec.snip
