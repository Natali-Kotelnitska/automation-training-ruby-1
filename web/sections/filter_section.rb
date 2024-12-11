# frozen_string_literal: true

module Web
  module Sections
    class FilterSection < BaseSection
      element :header, 'span.sidebar-block__inner'
      element :toggle_button, 'button.sidebar-block__toggle'
      element :content, 'div.sidebar-block__inner'
      elements :filter_options, 'ul.checkbox-filter li'

      def select_option(option_text)
        toggle_button.click unless content.visible?
        option = filter_options.find { |opt| opt.text.include?(option_text) }
        raise "Option '#{option_text}' not found in filter '#{header.text}'" unless option

        option.click
      end
    end
  end
end
