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

require "chef-utils/internal"

module ChefUtils
  # NOTE: these are mixed into the service resource+providers specifically and deliberately not
  # injected into the global namespace
  module Service
    include Internal
    extend self

    def debianrcd?(node = __getnode)
      ::File.exist?("/usr/sbin/update-rc.d")
    end

    def invokercd?(node = __getnode)
      ::File.exist?("/usr/sbin/invoke-rc.d")
    end

    def upstart?(node = __getnode)
      ::File.exist?("/sbin/initctl")
    end

    def insserv?(node = __getnode)
      ::File.exist?("/sbin/insserv")
    end

    def redhatrcd?(node = __getnode)
      ::File.exist?("/sbin/chkconfig")
    end

    def service_script_exist?(type, script)
      case type
      when :initd
        ::File.exist?("/etc/init.d/#{script}")
      when :upstart
        ::File.exist?("/etc/init/#{script}.conf")
      when :xinetd
        ::File.exist?("/etc/xinetd.d/#{script}")
      when :etc_rcd
        ::File.exist?("/etc/rc.d/#{script}")
      when :systemd
        ::File.exist?("/etc/init.d/#{script}") ||
          ChefUtils::Introspection.has_systemd_service_unit?(script) ||
          ChefUtils::Introspection.has_systemd_unit?(script)
      else
        raise ArgumentError, "type of service must be one of :initd, :upstart, :xinetd, :etc_rcd, or :systemd"
      end
    end
  end
end
