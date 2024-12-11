# frozen_string_literal: true

module Web
  module Sections
    class HeaderSection < Web::Sections::BaseSection
      element :logo, 'a.header__logo'
      element :search_field, 'input[name="search"]'
      element :search_button, 'button.search-form__submit'
      element :clear_button, 'button.search-form__clear'
      element :language_button, 'ul.header-actions li.header-actions__item--language button'
      element :cart_icon, 'ul.header-actions li.header-actions__item--cart button.header-cart__button'

      def type_in_search_field(query)
        wait_until_search_field_visible
        search_field.set(query)
      end

      def click_search_button
        search_button.click
      end

      def clear_search_field
        clear_input_field(search_field)
      end

      def search_for_product(query)
        clear_search_field
        type_in_search_field(query)
        click_search_button
      end
    end
  end
end
