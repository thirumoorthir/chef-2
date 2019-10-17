require "spec_helper"
require "fauxhai"

def reports_true_for(*args)
  args.each do |method|
    it "reports true for #{method}" do
      expect(described_class.send(method, node)).to be true
    end
  end
  (PLATFORM_HELPERS - args).each do |method|
    it "reports false for #{method}" do
      expect(described_class.send(method, node)).to be false
    end
  end
end

RSpec.describe ChefUtils::Platform do
  let(:node) { Fauxhai.mock(options).data }

  PLATFORM_HELPERS = (described_class.methods - Module.methods).freeze

  ( HELPER_MODULES - [ described_class ] ).each do |klass|
    it "does not have methods that collide with #{klass}" do
      expect((klass.methods - Module.methods) & PLATFORM_HELPERS).to be_empty
    end
  end

  PLATFORM_HELPERS.each do |helper|
    it "has the #{helper} in the ChefUtils module" do
      expect(ChefUtils).to respond_to(helper)
    end
  end

  context "on ubuntu" do
    let(:options) { { platform: "ubuntu" } }

    reports_true_for(:ubuntu?)
  end

  context "on raspbian" do
    let(:options) { { platform: "raspbian" } }

    reports_true_for(:raspbian?)
  end

  context "on linuxmint" do
    let(:options) { { platform: "linuxmint" } }

    reports_true_for(:mint?, :linux_mint?, :linuxmint?)
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

    reports_true_for(:centos?)
  end

  context "on clearos" do
    let(:options) { { platform: "clearos" } }

    reports_true_for(:clearos?)
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

    reports_true_for(:mac_os_x_platform?)
  end

  context "on openbsd" do
    let(:options) { { platform: "openbsd" } }

    reports_true_for(:openbsd_platform?)
  end

  context "on opensuse" do
    let(:options) { { platform: "opensuse" } }

    reports_true_for(:opensuse?)
  end

  context "on oracle" do
    let(:options) { { platform: "oracle" } }

    reports_true_for(:oracle?, :oracle_linux?)
  end

  context "on redhat" do
    let(:options) { { platform: "redhat" } }

    reports_true_for(:redhat?, :redhat_enterprise_linux?, :redhat_enterprise?)
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
end
