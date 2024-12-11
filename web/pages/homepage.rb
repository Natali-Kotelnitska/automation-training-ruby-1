# frozen_string_literal: true

module Web
  module Pages
    class HomePage < BasePage
      set_url '/'

      element :language_dropdown_menu, 'div.lang__menu > ul'
      element :cart_modal, 'rz-modal-layout .header.empty-none'
      element :main_content, 'main.content.content_type_main'

      section :header, Web::Sections::HeaderSection, 'header'
      section :slider, Web::Sections::SliderSection, 'main > rz-main-page-content > rz-top-slider'
      section :featured_goods, Sections::FeaturedGoodsSection, 'main > rz-main-page-content > rz-goods-sections-best'
      section :sidebar, Web::Sections::SidebarSection, 'div.layout_with_sidebar aside.sidebar_type_main'

      def verify_sidebar_visible
        wait_for_element_to_be_visible(sidebar)
      end

      def verify_computers_notebooks_navigation
        expected_page_pattern = %r{\/(ua\/)?computers-notebooks(/.*)?}
        verify_navigation_to_page(expected_page_pattern)
      end
    end
  end
end
