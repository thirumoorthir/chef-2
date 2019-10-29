# Chef Utils gem

**Umbrella Project**: [Chef Infra](https://github.com/chef/chef-oss-practices/blob/master/projects/chef-infra.md)

**Project State**: [Active](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md#active)

**Issues [Response Time Maximum](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md)**: 14 days

**Pull Request [Response Time Maximum](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md)**: 14 days

## Getting Started

Chef Utils gem is common code and mixins for the core Chef Infra ruby gems.

### Platform Helpers

Individual platforms for when code MUST be different on a case-by-case basis.  It is generally encouraged to not use these and to use
the `platform_family` helpers unless it is known that code must be special cased for individual platforms.

* `aix_platform?`
* `amazon_platform?`
* `arch_platform?`
* `centos_platform?`
* `clearos_platform?`
* `debian_platform?`
* `dragonfly_platform?`
* `fedora_platform?`
* `freebsd_platform?`
* `gentoo_platform?`
* `leap_platform?`
* `linuxmint_platform?`
* `macos_platform?`
* `netbsd_platform?`
* `nexentacore_platform?`
* `omnios_platform?`
* `openbsd_platform?`
* `openindiana_platform?`
* `opensolaris_platform?`
* `opensuse_platform?`
* `oracle_platform?`
* `raspbian_platform?`
* `redhat_platform?`
* `scientific_platform?`
* `slackware_platform?`
* `smartos_platform?`
* `solaris2_platform?`
* `suse_platform?`
* `ubuntu_platform?`
* `windows_platform?`

For campatibility with old chef-sugar code the following aliases work for backwards compatibility, but will be DEPRECATED in the future.

* `centos?`
* `clearos?`
* `linuxmint?`
* `nexentacore?`
* `omnios?`
* `openindiana?`
* `opensolaris?`
* `opensuse?`
* `oracle?`
* `raspbian?`
* `redhat?`
* `scientific?`
* `ubuntu?`

### Platform Family Helpers

These should be the most commonly used helpers to identify the type of node which group somewhat similar or nearly identical types of platforms.
There are helpers here which are also meta-families which group together multiple types into supertypes.

* `aix?`
* `amazon?`
* `arch?`
* `debian?` - includes debian, ubuntu, linuxmint, raspbian, etc
* `dragonflybsd?`
* `fedora?`
* `freebsd?`
* `gentoo?`
* `macos?`
* `netbsd?`
* `openbsd?`
* `rhel?` - includes redhat, cnetos, scientific, oracle
* `smartos?`
* `solaris2?`
* `suse?`
* `windows?`
* `windows_ruby_platform?` - this is always true if the ruby VM is running on a windows host and is not stubbed by chefspec

Super Families:

* `fedora_based?` - anything of fedora lineage (fedora, fedhat, centos, amazon, pidora, etc)
* `rpm_based?`- all `fedora_based` systems plus `suse` and any future linux distros based on RPM (excluding AIX)
* `solaris_based?`- all solaris-derived systems (opensolaris, nexentacore, omnios, smartos, etc)
* `bsd_based?`- all bsd-derived systems (freebsd, netbsd, openbsd, dragonflybsd).

### OS Helpers

OS helpers are only provided for OS types that contain multiple platform families ("linux"), or for unique OS values ("darwin").  Users should
use the Platform Family helper level instead.

* linux?
* darwin?

### Architecture Helpers

* `_64_bit?`
* `_32_bit?`
* `i386?`
* `intel?`
* `sparc?`
* `ppc64?`
* `ppc64le?`
* `powerpc?`
* `armhf?`
* `s390x?`
* `s390?`

### Train Helpers

**EXPERIMENTAL**: APIs may have breaking changes any time without warning

* `file_exist?`
* `file_open`

### Introspection Helpers

* `docker?` - if the node is running inside of docker
* `systemd?` - if the init system is systemd
* `kitchen?` - if ENV['TEST_KITCHEN'] is set
* `ci?` - if ENV['CI'] is set

### Service Helpers

* `debianrcd?` - if the `update-rc.d` binary is present
* `invokercd?` - if the `invoke-rc.d` binary is present
* `upstart?` - if the `initctl` binary is present
* `insserv?` - if the `insserv` binary is present
* `redhatrcd?` - if the `chkconfig` binary is present

* `service_script_exist?(type, service)`

### Which/Where Helpers

* `which`
* `where`

### Path Sanity Helpers

* `sanitized_path`

## Calling Conventions

The modules here should be included into a DSL class in order to be used directly.  To avoid 



## Getting Involved

We'd love to have your help developing Chef Infra. See our [Contributing Document](./CONTRIBUTING.md) for more information on getting started.

## License and Copyright

Copyright 2008-2019, Chef Software, Inc.

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
