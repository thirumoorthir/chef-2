require "spec_helper"
require "fauxhai"

def reports_true_for(*args)
  args.each do |method|
    it "reports true for #{method} on the module given a node" do
      expect(described_class.send(method, node)).to be true
    end
    it "reports true for #{method} when mixed into a class with a node" do
      expect(thing_with_a_node.send(method, node)).to be true
    end
    it "reports true for #{method} when mixed into a class with a run_context" do
      expect(thing_with_a_run_context.send(method, node)).to be true
    end
    it "reports true for #{method} when mixed into a class with the dsl" do
      expect(thing_with_the_dsl.send(method, node)).to be true
    end
    it "reports true for #{method} on the main class give a node" do
      expect(ChefUtils.send(method, node)).to be true
    end
  end
  (PLATFORM_HELPERS - args).each do |method|
    it "reports false for #{method} on the module given a node" do
      expect(described_class.send(method, node)).to be false
    end
    it "reports false for #{method} when mixed into a class with a node" do
      expect(thing_with_a_node.send(method, node)).to be false
    end
    it "reports false for #{method} when mixed into a class with the dsl" do
      expect(thing_with_the_dsl.send(method, node)).to be false
    end
    it "reports false for #{method} on the main class give a node" do
      expect(ChefUtils.send(method, node)).to be false
    end
  end
end

RSpec.describe ChefUtils::Platform do
  let(:node) { Fauxhai.mock(options).data }

  class ThingWithANode
    include ChefUtils::Platform
    attr_accessor :node
    def initialize(node)
      @node = node
    end
  end

  class ThingWithARunContext
    include ChefUtils::Platform
    class RunContext
      attr_accessor :node
    end
    attr_accessor :run_context
    def initialize(node)
      @run_context = RunContext.new
      run_context.node = node
    end
  end

  class ThingWithTheDSL
    include ChefUtils::DSL
    attr_accessor :node
    def initialize(node)
      @node = node
    end
  end

  let(:thing_with_a_node) { ThingWithANode.new(node) }
  let(:thing_with_a_run_context) { ThingWithARunContext.new(node) }
  let(:thing_with_the_dsl) { ThingWithTheDSL.new(node) }

  ( HELPER_MODULES - [ described_class ] ).each do |klass|
    it "does not have methods that collide with #{klass}" do
      expect((klass.methods - Module.methods) & PLATFORM_HELPERS).to be_empty
    end
  end

  context "on ubuntu" do
    let(:options) { { platform: "ubuntu" } }

    reports_true_for(:ubuntu?, :ubuntu_platform?)
  end

  context "on raspbian" do
    let(:options) { { platform: "raspbian" } }

    reports_true_for(:raspbian?, :raspbian_platform?)
  end

  context "on linuxmint" do
    let(:options) { { platform: "linuxmint" } }

    reports_true_for(:mint?, :linux_mint?, :linuxmint?, :linuxmint_platform?)
  end

  context "on debian" do
    let(:options) { { platform: "debian" } }

    reports_true_for(:debian_platform?)
  end

  context "on aix" do
    let(:options) { { platform: "aix" } }

    reports_true_for(:aix_platform?)
  end

  context "on amazon" do
    let(:options) { { platform: "amazon" } }

    reports_true_for(:amazon_platform?)
  end

  context "on arch" do
    let(:options) { { platform: "arch" } }

    reports_true_for(:arch_platform?)
  end

  context "on centos" do
    let(:options) { { platform: "centos" } }

    reports_true_for(:centos?, :centos_platform?)
  end

  context "on clearos" do
    let(:options) { { platform: "clearos" } }

    reports_true_for(:clearos?, :clearos_platform?)
  end

  context "on dragonfly4" do
    let(:options) { { platform: "dragonfly4" } }

    reports_true_for(:dragonfly_platform?)
  end

  context "on fedora" do
    let(:options) { { platform: "fedora" } }

    reports_true_for(:fedora_platform?)
  end

  context "on freebsd" do
    let(:options) { { platform: "freebsd" } }

    reports_true_for(:freebsd_platform?)
  end

  context "on gentoo" do
    let(:options) { { platform: "gentoo" } }

    reports_true_for(:gentoo_platform?)
  end

  context "on mac_os_x" do
    let(:options) { { platform: "mac_os_x" } }

    reports_true_for(:mac_os_x_platform?, :macos_platform?)
  end

  context "on openbsd" do
    let(:options) { { platform: "openbsd" } }

    reports_true_for(:openbsd_platform?)
  end

  context "on oracle" do
    let(:options) { { platform: "oracle" } }

    reports_true_for(:oracle?, :oracle_linux?, :oracle_platform?)
  end

  context "on redhat" do
    let(:options) { { platform: "redhat" } }

    reports_true_for(:redhat?, :redhat_enterprise_linux?, :redhat_enterprise?, :redhat_platform?)
  end

  context "on smartos" do
    let(:options) { { platform: "smartos" } }

    reports_true_for(:smartos_platform?)
  end

  context "on solaris2" do
    let(:options) { { platform: "solaris2" } }

    reports_true_for(:solaris2_platform?)
  end

  context "on suse" do
    let(:options) { { platform: "suse" } }

    reports_true_for(:suse_platform?)
  end

  context "on windows" do
    let(:options) { { platform: "windows" } }

    reports_true_for(:windows_platform?)
  end

  context "on opensuseleap" do
    let(:node) { { "platform" => "opensuseleap", "platform_version" => "15.1", "platform_family" => "suse", "os" => "linux" } }

    reports_true_for(:opensuse_platform?, :opensuseleap_platform?, :opensuse?, :leap_platform?)
  end

  context "on opensuse" do
    let(:node) { { "platform" => "opensuse", "platform_version" => "11.0", "platform_family" => "suse", "os" => "linux" } }

    reports_true_for(:opensuse_platform?, :opensuseleap_platform?, :opensuse?, :leap_platform?)
  end

end
