# frozen_string_literal: true

module Web
  module Pages
    class HomePage < BasePage
      element :slider, 'main rz-top-slider'
      element :goods_section, 'rz-goods-sections.goods-sections'
      element :sidebar, 'aside.sidebar_type_main'
    end
  end
end
