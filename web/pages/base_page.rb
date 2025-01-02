# frozen_string_literal: true

module Web
  module Pages
    class BasePage <SitePrism::Page
      element :logo, 'a.header__logo'
      element :search_field, 'input.search-form__input'
      element :search_button, 'button.search-form__submit'
      element :clear_button, 'button.search-form__clear'
      element :cart_icon_button, 'button.header-cart__button'
      elements :suggestion_items, 'ul.suggest-list li.search-suggest__item'
      element :empty_results_text, "div.search-nothing div h1"

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

      def suggestions_match_query?(query)
        suggestion_items.all? { |item| item.text.include?(query) }
      end
    end
  end
end
