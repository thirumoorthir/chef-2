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

module ChefUtils
  module Internal
    extend self

    #
    # This contains a lot of glue code to automagically wire up Cheffy things from chef-client.
    #
    # It should not be assumed that any of this code runs from within chef-client and that the
    # Chef class or run_context, etc exists.
    #
    # This gem may be used by gems like mixlib-shellout which can be consumed by external non-Chef utilities,
    # so including brittle code here which depends on the existence of the chef-client will cause broken
    # behavior downstream.  You must practice defensive coding.  The existing tests may not catch all possible coding
    # errors here.
    #

    private

    # @api private
    def __getnode
      return node if respond_to?(:node) && node

      return run_context&.node if respond_to?(:run_context) && run_context&.node

      nil
    end

    # @api private
    def __env_path
      if __transport_connection
        __transport_connection.run_command("echo $PATH").stdout
      else
        ENV["PATH"]
      end
    end

    # @api private
    def __transport_connection
      return Chef.run_context.transport_connection if defined?(Chef) && Chef.respond_to?(:run_context) && Chef&.run_context&.transport_connection

      nil
    end

  end
end
