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
    end
  end
end
