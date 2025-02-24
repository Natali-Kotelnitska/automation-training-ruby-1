# frozen_string_literal: true

module Web
  module Pages
    class CartPage < BasePage
      element :cart_with_products, 'div.cart.cart-se.ng-star-inserted'
      element :empty_cart, 'div[data-testid="empty-cart"]'
      element :dropdown_menu_button, :xpath, ".//button[contains(@id, 'cartProductActions')]"
      element :delete_button, :xpath, "//rz-trash-icon/button"
      element :close_button, 'rz-modal-close-btn button'
      elements :cart_items, 'ul.cart-list > li.cart-list__item'
      elements :product_titles, '[data-testid="title"] .cart-product__title'

      def remove_item(product_name)
        wait_until_cart_items_visible
        item_index = product_titles.find_index { |title| title.text.strip == product_name}

        within(cart_items[item_index]) do
          dropdown_menu_button.click
          delete_button.click
        end
      end

      def close_modal
        close_button.click
      end

      def verify_item_in_cart(expected_name)
        product_titles_list = product_titles.map(&:text).map(&:strip) 
        verify_array_include(product_titles_list, expected_name)
      end

      def verify_cart_empty
        verify_truthy(cart_items.empty?, 'Cart is not empty')
      end
    end
  end
end
