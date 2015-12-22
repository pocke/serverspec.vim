# vim: set ft=ruby.serverspec:

describe user('root') do
  it { should exist }
  it { should be_has_uid(0) }
  it { should be_has_login_shell('/bin/sh') }
end
