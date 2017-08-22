test:
	bundle exec rspec
generate:
	@ruby -r './generator.rb' -e 'Generator.new.perform'
