#
# Copyright:: Copyright 2015-2019, Chef Software Inc.
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

require_relative "chef-utils/dsl"
require_relative "chef-utils/path_sanity"
require_relative "chef-utils/service"
require_relative "chef-utils/train_helpers"
require_relative "chef-utils/which"

#
# All helpers are loaded into the ChefUtils class.
#
module ChefUtils
  include ChefUtils::DSL
  include ChefUtils::PathSanity
  include ChefUtils::Service
  include ChefUtils::TrainHelpers
  include ChefUtils::Which

  CANARY = 1 # used as a guard for requires
  extend self
end
