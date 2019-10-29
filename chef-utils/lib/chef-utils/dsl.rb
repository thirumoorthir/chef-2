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

# NOTE: NOT EVERYTHING GOES IN HERE!  THIS GETS INJECTED EVERYWHERE!
#
# - ChefUtils::Service is not intended to be injected into the DSL, do not add it.
#
# - Any other helpers should NOT be added here until they are proven.
#

require_relative "internal"
require_relative "architecture"
require_relative "os"
require_relative "platform_family"
require_relative "platform"
require_relative "introspection"
require_relative "which"
require_relative "path_sanity"

module ChefUtils
  #
  # This is the Core Chef DSL which can be included or extended into a class to
  # duplicate Core Chef's API.  If Users do not need 100% compatibility with Core
  # Chef they are encouraged to create their own.
  #
  # This module does not support being called with class methods.
  #
  module DSL
    include ChefUtils::Architecture
    include ChefUtils::OS
    include ChefUtils::PlatformFamily
    include ChefUtils::Platform
    include ChefUtils::Introspection
    include ChefUtils::Internal
    # FIXME: include ChefUtils::Which in Chef 16.0
    # FIXME: include ChefUtils::PathSanity in Chef 16.0
    # ChefUtils::Service is deliberately excluded
  end
end
