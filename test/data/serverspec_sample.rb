# vim: set ft=ruby.serverspec:

describe user('root') do
  it { should exist }
  it { should be_has_uid(0) }
  it { should be_has_login_shell('/bin/sh') }
end

describe port(80) do
  it { should be_listening }
end

describe command('ls /foo') {its(:exit_status) { should eq 0 }}

describe default_gateway do
  its(:ipaddress) { should eq '192.168.10.1' }
  its(:interface) { should eq 'br0'          }
end
describe file '/etc/sudoers' do
  it { should be_mode 440 }
end
