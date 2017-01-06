#require 'spec_helper'
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('net-snmp'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('snmpd'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
  it { should be_installed }
end

describe service('snmpd'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe service('snmpd'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
  it { should be_enabled }
  it { should be_running }
end

#describe service('org.apache.httpd'), :if => os[:family] == 'darwin' do
#  it { should be_enabled }
#  it { should be_running }
#end

describe file('/etc/snmp/snmpd.conf') do
  it { should be_file }
end

describe port(161) do
  it { should be_listening }
end

describe command('snmpwalk -c public -v 2c localhost'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
  its(:stdout) { should match /iso.3.6.1.2.1.1.4.0 = STRING: "Me <me@example.org>"/ }
  its(:stdout) { should match /iso.3.6.1.2.1.1.6.0 = STRING: "Sitting on the Dock of the Bay"/ }
  its(:stdout) { should match /STRING: "The MIB for Message Processing and Dispatching."/ }
  its(:stderr) { should_not match /Timeout: No Response from localhost/ }
  its(:exit_status) { should eq 0 }
end
describe command('snmpwalk -c public -v 2c localhost'), :if => os[:family] == 'redhat' do
  its(:stdout) { should match /SNMPv2-MIB::sysContact.0 = STRING: Me <me@example.org>/ }
  its(:stdout) { should match /SNMPv2-MIB::sysLocation.0 = STRING: Sitting on the Dock of the Bay/ }
  its(:stdout) { should match /SNMPv2-MIB::sysORDescr.1 = STRING: The MIB for Message Processing and Dispatching./ }
  its(:stderr) { should_not match /Timeout: No Response from localhost/ }
  its(:exit_status) { should eq 0 }
end

