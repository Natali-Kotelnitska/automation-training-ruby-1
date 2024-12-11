module Web
  module Pages
    class SearchResultsPage < BasePage
      set_url 'ua/search{?query*}'
      set_url_matcher (/rozetka.com.ua(\/[a-z]{2})?\/search\?.*/)

      element :results_container, 'section.content_type_catalog'
      elements :search_items, 'div.search-item'
      element :results_message, 'div.no-results'
      element :empty_results, "div.search-nothing div h1"
      element :search_suggest, 'div.search-suggest p.search-suggest__item-content_type_no-results'
      elements :suggestion_items, 'ul.suggest-list li.search-suggest__item'
      element :pagination_controls, 'div.pagination'
      element :filters_container, 'aside > rz-filter-stack'
      elements :filter_blocks, 'div.sidebar-block[data-filter-name]'
      elements :filter_options, 'div.sidebar-block[data-filter-name] ul > li:nth-child(1) > rz-indexed-link '

      section :header, Web::Sections::HeaderSection, 'header'
      sections :filters, Web::Sections::FilterSection, 'aside > rz-filter-stack > div.sidebar-block'

      def get_suggestions
        wait_until_suggestion_items_visible
        suggestion_items.map { |item| item['data-name'] }.compact
      end

      def no_results_message
        search_suggest.text if has_search_suggest?
      end

      def find_filter(filter_name)
        filters.find { |filter| filter.root_element[:'data-filter-name'] == filter_name }
      end
    end
  end
end
