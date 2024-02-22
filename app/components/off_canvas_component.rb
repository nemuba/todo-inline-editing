# frozen_string_literal: true

# OffCanvasComponent - Bootstrap 5 off-canvas component
class OffCanvasComponent < ViewComponent::Base
  attr_reader :title

  def initialize(title:)
    @title = title
    super
  end
end
