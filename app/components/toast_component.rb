# frozen_string_literal: true

class ToastComponent < ViewComponent::Base
  attr_reader :message, :type

  TYPES = {
    success: 'bg-success text-white',
  }.freeze

  def initialize(message:, type: 'success')
    @message = message
    @type = type
    super
  end

  def class_name
    TYPES[type.to_sym]
  end
end
