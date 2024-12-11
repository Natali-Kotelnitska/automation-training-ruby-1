module Web
  module Sections
    class SidebarSection < Web::Sections::BaseSection
      element :menu, 'div.menu-wrapper > ul.menu-categories'
      elements :menu_items, 'div.menu-wrapper > ul.menu-categories > li.menu-categories__item'

      def click_first_menu_item
        menu_items.first.click
      end

      def has_menu_item?(item_text)
        menu_items.any? { |item| item.text.include?(item_text) }
      end
    end
  end
end
