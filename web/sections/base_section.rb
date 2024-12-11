# frozen_string_literal: true

module Web
  module Sections
    class BaseSection < SitePrism::Section
      def clear_input_field(element)
        element.set('')
      end
    end
  end
end
