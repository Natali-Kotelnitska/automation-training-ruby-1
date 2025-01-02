# frozen_string_literal: true

module Web
  module Pages
    class ProductPage < BasePage
      element :buy_button, 'button.buy-button'
      element :product_title, 'div.product-about h1'

      def get_product_name
        wait_until_product_title_visible
        product_title.text.strip
      end

      def add_to_cart
        wait_until_buy_button_visible
        buy_button.click
      end
    end
  end
end
