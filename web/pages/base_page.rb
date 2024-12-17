# frozen_string_literal: true

module Web
  module Pages
    class BasePage <SitePrism::Page
      element :logo, 'a.header__logo'
      element :search_field, 'input.search-form__input'
      element :search_button, 'button.search-form__submit'
      element :clear_button, 'button.search-form__clear'
      elements :suggestion_items, 'ul.suggest-list li.search-suggest__item'
      element :empty_results, "div.search-nothing div h1"
      element :search_suggest_no_results_msg, "p.search-suggest__item-content_type_no-results"
      element :search_suggest, 'div.search-suggest p.search-suggest__item-content_type_no-results'

      def type_in_search_field(query)
        wait_until_search_field_visible
        search_field.set(query)
      end

      def click_search_button
        search_button.click
      end

      def suggestions_match_query?(query)
        suggestion_items.all? { |item| item.text.include?(query) }
      end

      def no_results_message
        wait_until_search_suggest_visible
        search_suggest.text
      end

      def expected_no_results_message
        'По вашому запиту нічого не знайдено.'
      end
    end
  end
end
