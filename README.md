# Build Docker image by [Packer](http://www.packer.io/)

[You can build Docker images without Dockerfile](http://www.packer.io/docs/builders/docker.html#toc_4).

## How to build

Run docker 

```
$ vagrant up
```

This will install docker and packer in vagrant box.

```
$ vagrant ssh
```

## Ansible

Build docker image with ansible provisioning

```
$ packer build machine_ansible.json
```

Check it.

```bash
$ docker run -i -t kkarimi/packer-ansible:0.1 bash
```

