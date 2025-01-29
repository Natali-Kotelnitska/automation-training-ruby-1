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

      def select_first_item
        wait_until_search_result_items_visible(wait: 20)
        search_result_items.first.click
      end

      def verify_results_contain(search_term)
        actual_results_titles = search_result_items.map { |item| item.text.downcase}
        verify_inclusion(actual_results_titles, search_term.downcase)
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

      def click_price_filter_button
        price_filter_button.click
        wait_until_pre_loader_disappears
      end

      def verify_products_within_price_range?(min_price, max_price)
        search_result_items.all? do |item|
          price_text = item.find('div.goods-tile__price span.goods-tile__price-value', wait: 10).text.strip
          price = price_text.gsub(/[^\d]/, '').to_i
          price.between?(min_price,max_price)
        end
      end

      def verify_filtered_results(page, expexted_value)
        verify_inclusion(page.text, expexted_value)
        verify_inclusion(page.settings_selection_section.text, expexted_value)
      end
    end
  end
end
