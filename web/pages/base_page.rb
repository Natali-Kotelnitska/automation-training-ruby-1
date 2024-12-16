# frozen_string_literal: true

module Web
  module Pages
    class BasePage <SitePrism::Page
      element :logo, 'a.header__logo'
    end
  end
end
