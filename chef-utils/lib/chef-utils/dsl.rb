
# NOTE: NOT EVERYTHING GOES IN HERE!  THIS GETS INJECTED EVERYWHERE!
#
# - ChefUtils::Service is not intended to be injected into the DSL, do not add it.
#
# - Any other helpers should NOT be added here until they are proven.
#

require "chef-utils/internal"
require "chef-utils/architecture"
require "chef-utils/os"
require "chef-utils/platform_family"
require "chef-utils/platform"
require "chef-utils/introspection"
require "chef-utils/which"
require "chef-utils/path_sanity"

module ChefUtils
  module DSL
    include ChefUtils::Architecture
    include ChefUtils::OS
    include ChefUtils::PlatformFamily
    include ChefUtils::Platform
    include ChefUtils::Introspection
    include ChefUtils::Internal
    # FIXME: include ChefUtils::Which
    # FIXME: include ChefUtils::PathSanity
    # ChefUtils::Service is deliberately excluded
  end
end
