# SNMPd ansible role

Ansible role to setup snmpd.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.2
 * 2.5

### Operating systems

Tested Ubuntu 14.04, 16.04, 18.04 and centos7
Targeted for Linux and Darwin

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.snmpd
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
$ cd /path/to/roles/juju4.snmpd
$ kitchen verify
$ kitchen login
```
or
```
$ cd /path/to/roles/juju4.snmpd/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues


## License

BSD 2-clause
