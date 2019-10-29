#
# Copyright:: Copyright 2018-2019, Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require_relative "internal"

module ChefUtils
  module Platform
    include Internal

    #
    # NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
    #
    # When adding platforms which are the same name as the platform_family
    # please add them to the platform_family helpers.  Resolve the namespace
    # collision by adding a `_platform?` suffix here.  So we have the
    # debian? platform_family helper and the debian_platform?, ubuntu? and
    # linuxmint? platform helpers.
    #
    # This encourages the use of the platform family via the shorter name and
    # is backwards compatible with the chef-sugar usage.
    #
    # This encourages the use of the platform_family helpers where after adding
    # a new platform to a platform_family the existing code MAY work unchanged,
    # while with the use of a platform matcher the existing code will ALWAYS
    # be guaranteed to fail and must be updated.
    #

    # Determine if the current node is linux mint.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def linuxmint?(node = __getnode)
      node["platform"] == "linuxmint"
    end
    # chef-sugar backcompat methods
    alias_method :mint?, :linuxmint?
    alias_method :linux_mint?, :linuxmint?
    alias_method :linuxmint_platform?, :linuxmint?

    # Determine if the current node is ubuntu.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def ubuntu?(node = __getnode)
      node["platform"] == "ubuntu"
    end
    alias_method :ubuntu_platform?, :ubuntu?

    # Determine if the current node is raspbian.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def raspbian?(node = __getnode)
      node["platform"] == "raspbian"
    end
    alias_method :raspbian_platform?, :raspbian?

    # Determine if the current node is debian.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def debian_platform?(node = __getnode)
      node["platform"] == "debian"
    end

    # Determine if the current node is amazon linux.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def amazon_platform?(node = __getnode)
      node["platform"] == "amazon"
    end

    # Determine if the current node is redhat enterprise.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def redhat?(node = __getnode)
      node["platform"] == "redhat"
    end
    # chef-sugar backcompat methods
    alias_method :redhat_enterprise?, :redhat?
    alias_method :redhat_enterprise_linux?, :redhat?
    alias_method :redhat_platform?, :redhat?

    # Determine if the current node is centos.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def centos?(node = __getnode)
      node["platform"] == "centos"
    end
    alias_method :centos_platform?, :centos?

    # Determine if the current node is oracle linux.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def oracle?(node = __getnode)
      node["platform"] == "oracle"
    end
    # chef-sugar backcompat methods
    alias_method :oracle_linux?, :oracle?
    alias_method :oracle_platform?, :oracle?

    # Determine if the current node is scientific linux.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def scientific?(node = __getnode)
      node["platform"] == "scientific"
    end
    # chef-sugar backcompat methods
    alias_method :scientific_linux?, :scientific?
    alias_method :scientific_platform?, :scientific?

    # Determine if the current node is clearos.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def clearos?(node = __getnode)
      node["platform"] == "clearos"
    end
    alias_method :clearos_platform?, :clearos?

    # Determine if the current node is fedora.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def fedora_platform?(node = __getnode)
      node["platform"] == "fedora"
    end

    # Determine if the current node is arch
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def arch_platform?(node = __getnode)
      node["platform"] == "arch"
    end

    # Determine if the current node is solaris2
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def solaris2_platform?(node = __getnode)
      node["platform"] == "solaris2"
    end

    # Determine if the current node is smartos
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def smartos_platform?(node = __getnode)
      node["platform"] == "smartos"
    end

    # Determine if the current node is omnios
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def omnios?(node = __getnode)
      node["platform"] == "omnios"
    end
    alias_method :omnios_platform?, :omnios?

    # Determine if the current node is openindiana
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def openindiana?(node = __getnode)
      node["platform"] == "openindiana"
    end
    alias_method :openindiana_platform?, :openindiana?

    # Determine if the current node is nexentacore
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def nexentacore?(node = __getnode)
      node["platform"] == "nexentacore"
    end
    alias_method :nexentacore_platform?, :nexentacore?

    # Determine if the current node is aix
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def aix_platform?(node = __getnode)
      node["platform"] == "aix"
    end

    # Determine if the current node is freebsd
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def freebsd_platform?(node = __getnode)
      node["platform"] == "freebsd"
    end

    # Determine if the current node is openbsd
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def openbsd_platform?(node = __getnode)
      node["platform"] == "openbsd"
    end

    # Determine if the current node is netbsd
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def netbsd_platform?(node = __getnode)
      node["platform"] == "netbsd"
    end

    # Determine if the current node is dragonflybsd
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def dragonfly_platform?(node = __getnode)
      node["platform"] == "dragonfly"
    end

    # Determine if the current node is MacOS.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def mac_os_x_platform?(node = __getnode)
      node["platform"] == "mac_os_x"
    end
    alias_method :macos_platform?, :mac_os_x_platform?

    # Determine if the current node is gentoo
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def gentoo_platform?(node = __getnode)
      node["platform"] == "gentoo"
    end

    # Determine if the current node is slackware.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def slackware_platform?(node = __getnode)
      node["platform"] == "slackware"
    end

    # Determine if the current node is SuSE.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def suse_platform?(node = __getnode)
      node["platform"] == "suse"
    end

    # Determine if the current node is OpenSuSE.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def opensuse?(node = __getnode)
      node["platform"] == "opensuse"
    end
    alias_method :opensuse_platform?, :opensuse?

    # Determine if the current node is Windows.
    #
    # @param [Chef::Node] node
    #
    # @return [Boolean]
    #
    def windows_platform?(node = __getnode)
      node["platform"] == "windows"
    end

    # FIXME FIXME FIXME: all the rest of the platforms
    extend self
  end
end
