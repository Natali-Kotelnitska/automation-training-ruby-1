# frozen_string_literal: true

module Web
  module Pages
    class SearchResultsPage < BasePage
      element :results_container, 'section.content_type_catalog'
      element :filters_container, 'aside > rz-filter-stack'
      element :settings_selection_section, 'div.catalog-selection'
      element :min_price_input, 'input[formcontrolname="min"]'
      element :max_price_input, 'input[formcontrolname="max"]'
      element :price_filter_button, 'button.slider-filter__button'
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

      # Methods for filter functionality
      def apply_filter(filter_name, option_text)
        filter = find("div[data-filter-name='#{filter_name}']")
        checkbox = filter.find(".checkbox-filter__link[data-id='#{option_text}']", visible: false)
        checkbox.click
      end

      def apply_price_range(min_price, max_price)
        min_price_input.set(min_price)
        max_price_input.set(max_price)
      end

      def verify_products_within_price_range?(min_price, max_price)
        wait_until_pre_loader_disappears

        search_result_items.all? do |item|
          price_text = item.find('div.goods-tile__price span.goods-tile__price-value', wait: 10).text.strip
          price = price_text.gsub(/[^\d]/, '').to_i
          price.between?(min_price,max_price)
        end
      end
    end
  end
end
