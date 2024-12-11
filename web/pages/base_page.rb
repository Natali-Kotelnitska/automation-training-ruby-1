# frozen_string_literal: true

module Web
  module Pages
    class BasePage <SitePrism::Page

      def verify_navigation_to_page(expected_path_pattern, current_path: nil)
        current_path ||= Capybara.current_path
        current_path.match?(expected_path_pattern)
      end

      def wait_until(timeout: 10)
        Timeout.timeout(timeout) do
        sleep(0.5) until yield
      end
      rescue Timeout::Error
        raise "Timeout: Condition not met within #{timeout} seconds"
      end

      def wait_for_element_to_be_visible(element, timeout: 10)
        wait_until(timeout: timeout) { element.visible? }
      end
    end
  end
end
