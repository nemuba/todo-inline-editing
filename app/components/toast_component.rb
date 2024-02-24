# frozen_string_literal: true

class ToastComponent < ViewComponent::Base
  attr_reader :message, :type

  TYPES = {
    success: ''
  }.freeze

  def initialize(message:, type: 'success')
    @message = message
    @type = type
    super
  end

  def class_name; end
end
