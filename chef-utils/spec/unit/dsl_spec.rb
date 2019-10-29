require "spec_helper"

RSpec.describe ChefUtils::DSL do
  class ThingWithDSL
    extend ChefUtils::DSL
  end

  (OS_HELPERS + ARCH_HELPERS + PLATFORM_HELPERS + PLATFORM_FAMILY_HELPERS + INTROSPECTION_HELPERS).each do |helper|
    it "has the #{helper} in the ChefUtils::DSL module" do
      expect(ThingWithDSL).to respond_to(helper)
    end
  end
end
