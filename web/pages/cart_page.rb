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

      def item_in_cart?(product_name)
        product_titles.any? { |title| title.text.strip == product_name }
      end

      def remove_item
        wait_until_cart_items_visible

        within(cart_items.first) do
          dropdown_menu_button.click
          delete_button.click
        end
      end

      def close_modal
        close_button.click
      end
    end
  end
end
