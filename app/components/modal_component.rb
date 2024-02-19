# frozen_string_literal: true

# ModalComponent - View component for modal
class ModalComponent < ViewComponent::Base
  attr_accessor :title

  def initialize(title:)
    @title = title
    super
  end
end
