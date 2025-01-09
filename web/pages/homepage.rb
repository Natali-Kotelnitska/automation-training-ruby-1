# frozen_string_literal: true

module Web
  module Pages
    class HomePage < BasePage
      element :goods_sections, 'rz-goods-sections.goods-sections'

      def wait_for_page_load
        has_goods_sections?
      end

      def navigate_to_home_page
        logo.click
      end
    end
  end
end
