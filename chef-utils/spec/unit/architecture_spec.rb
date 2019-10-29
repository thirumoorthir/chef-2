require "spec_helper"

def reports_true_for(*args)
  args.each do |method|
    it "reports true for #{method}" do
      expect(described_class.send(method, node)).to be true
    end
  end
  (ARCH_HELPERS - args).each do |method|
    it "reports false for #{method}" do
      expect(described_class.send(method, node)).to be false
    end
  end
end

RSpec.describe ChefUtils::Architecture do
  let(:node) { { "kernel" => { "machine" => arch } } }

  ( HELPER_MODULES - [ described_class ] ).each do |klass|
    it "does not have methods that collide with #{klass}" do
      expect((klass.methods - Module.methods) & ARCH_HELPERS).to be_empty
    end
  end

  ARCH_HELPERS.each do |helper|
    it "has the #{helper} in the ChefUtils module" do
      expect(ChefUtils).to respond_to(helper)
    end
  end

  context "on x86_64" do
    let(:arch) { "x86_64" }

    reports_true_for(:intel?, :_64_bit?)
  end

  context "on amd64" do
    let(:arch) { "amd64" }

    reports_true_for(:intel?, :_64_bit?)
  end
  context "on ppc64" do
    let(:arch) { "ppc64" }

    reports_true_for(:ppc64?, :_64_bit?)
  end
  context "on ppc64le" do
    let(:arch) { "ppc64le" }

    reports_true_for(:ppc64le?, :_64_bit?)
  end
  context "on s390x" do
    let(:arch) { "s390x" }

    reports_true_for(:s390x?, :_64_bit?)
  end
  context "on ia64" do
    let(:arch) { "ia64" }

    reports_true_for(:_64_bit?)
  end
  context "on sparc64" do
    let(:arch) { "sparc64" }

    reports_true_for(:_64_bit?)
  end
  context "on aarch64" do
    let(:arch) { "aarch64" }

    reports_true_for(:_64_bit?)
  end
  context "on arch64" do
    let(:arch) { "arch64" }

    reports_true_for(:_64_bit?)
  end
  context "on arm64" do
    let(:arch) { "arm64" }

    reports_true_for(:_64_bit?)
  end
  context "on sun4v" do
    let(:arch) { "sun4v" }

    reports_true_for(:sparc?, :_64_bit?)
  end
  context "on sun4u" do
    let(:arch) { "sun4u" }

    reports_true_for(:sparc?, :_64_bit?)
  end
  context "on i86pc" do
    let(:arch) { "i86pc" }

    reports_true_for(:i386?, :intel?, :_32_bit?)
  end
  context "on i386" do
    let(:arch) { "i386" }

    reports_true_for(:i386?, :intel?, :_32_bit?)
  end
  context "on i686" do
    let(:arch) { "i686" }

    reports_true_for(:i386?, :intel?, :_32_bit?)
  end
  context "on powerpc" do
    let(:arch) { "powerpc" }

    reports_true_for(:powerpc?, :_32_bit?)
  end
  context "on armhf" do
    let(:arch) { "armhf" }

    reports_true_for(:armhf?, :_32_bit?)
  end
  context "on s390" do
    let(:arch) { "s390" }

    reports_true_for(:s390?, :_32_bit?)
  end
end
