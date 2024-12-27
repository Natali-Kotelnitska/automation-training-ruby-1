# frozen_string_literal: true

module PageHelpers
  def search_results_page
    @search_results_page ||= Web::Pages::SearchResultsPage.new
  end
end

World(PageHelpers)
