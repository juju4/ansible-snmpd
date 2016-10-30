[![Build Status](https://travis-ci.org/juju4/ansible-snmpd.svg?branch=master)](https://travis-ci.org/juju4/ansible-snmpd)
# SNMPd ansible role

Ansible role to setup snmpd.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with trusty and centos7
Targeted for Linux and Darwin

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - snmpd
```

## Variables

```
snmpd_clients: [ 10.1.1.1 ]
snmpd_v2_snmpcommunity: public
```

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).

Once you ensured all necessary roles are present, You can test with:
```
$ cd /path/to/roles/snmpd
$ kitchen verify
$ kitchen login
```
or
```
$ cd /path/to/roles/snmpd/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues


## License

BSD 2-clause

