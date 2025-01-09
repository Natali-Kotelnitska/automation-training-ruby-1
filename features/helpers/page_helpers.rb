# frozen_string_literal: true

module PageHelpers
  def search_results_page
    @search_results_page ||= Web::Pages::SearchResultsPage.new
  end

  def product_page
    @product_page ||= Web::Pages::ProductPage.new
  end

  def cart_page
    @cart_page ||= Web::Pages::CartPage.new
  end
end

World(PageHelpers)
