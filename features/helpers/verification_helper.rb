# frozen_string_literal: true

module VerificationHelper
  include RSpec::Matchers

    def verify_truthy(condition, message = 'Condition is false')
      expect(condition).to be_truthy, message
    end

    def verify_array_include(actual, to_include)
      actual_check = Array(actual).any? { |item| item.include?(to_include) }
      expect(actual_check).to be_truthy, "Expected '#{actual}' to include '#{to_include}', but it did not."
    end
end
