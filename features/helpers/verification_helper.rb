# frozen_string_literal: true

module VerificationHelper
  include RSpec::Matchers

    def verify_object_equals(actual, expected, attribute = nil)
      expect(actual).to eql(expected), "Data mismatch #{attribute} should be equal to #{expected} but it is #{actual}"
    end

    def verify_inclusion(actual, expected)
      actual_check = Array(actual).any? { |item| item.include?(expected) }
      expect(actual_check).to be_truthy, "Expected '#{actual}' to include '#{expected}', but it did not."
    end
end
