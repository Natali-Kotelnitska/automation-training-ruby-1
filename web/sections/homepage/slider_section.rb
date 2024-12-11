module Web
  module Sections
    class SliderSection < Web::Sections::BaseSection
      element :slider, 'rz-slider.slider'
      element :left_button, 'button.left-btn.button'
      element :right_button, 'button.right-btn.button'
      elements :slides, 'div.container > div.item', visible: false
      element :container, 'rz-slider.slider div.container'

      def slider_size
        slides.size
      end

      def has_next_slide?(visible: false)
        slides[1].visible? if slides.size > 1
      end

      def has_previous_slide?(visible: false)
        slides[0].visible? if slides.size > 1
      end
    end
  end
end
