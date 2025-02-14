# frozen_string_literal: true

module Web
  module Pages
    class BasePage <SitePrism::Page
      include VerificationHelper

      element :logo, 'a.header__logo'
      element :search_field, 'input.search-form__input'
      element :search_button, 'button.search-form__submit'
      element :clear_button, 'button.search-form__clear'
      element :cart_icon_button, 'button.header-cart__button'
      elements :suggestion_items, 'ul.suggest-list li.search-suggest__item'
      element :empty_results_text, "div.search-nothing div h1"
      element :pre_loader, ".preloader_type_element"

      def type_in_search_field(query)
        wait_until_search_field_visible
        search_field.set(query)
      end

      def click_search_button
        search_button.click
      end

      def search_for_product(product_name)
        type_in_search_field(product_name)
        click_search_button
      end

      def verify_suggestions_contain_query(query)
        actual_suggestions = suggestion_items.map(&:text)
        verify_inclusion(actual_suggestions, query)
      end

      def wait_until_pre_loader_disappears
        has_no_pre_loader?
      end
    end
  end
end
