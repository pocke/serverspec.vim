options = {
  cmd: "ruby",
  run_all: {
    cmd: "ruby test/**/*_test.rb",
    cmd_additional_args: ""
  }
}

guard :test, options do
  watch(%r{^test/.+_test\.rb$})
  watch(%r{^autoload/(.+)\.rb$}) { |m| "test/#{m[1]}_test.rb" }
end
