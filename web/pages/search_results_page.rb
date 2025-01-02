# frozen_string_literal: true

module Web
  module Pages
    class SearchResultsPage < BasePage
      element :results_container, 'section.content_type_catalog'
      elements :search_result_items, 'div.goods-tile__inner'

      def results_present?
        has_results_container?
      end

      def has_results_match?(search_term)
        search_result_items.any? do |item|
          item.text.downcase.include?(search_term.downcase)
        end
      end

      def select_first_item
        wait_until_search_result_items_visible
        search_result_items.first.click
      end
    end
  end
end
