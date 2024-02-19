# frozen_string_literal: true

class LinkEditComponent < ViewComponent::Base
  attr_reader :link, :options

  def initialize(link:, options: {})
    @link = link
    @options = options
    super
  end

  def classes
    'btn btn-sm btn-success'
  end

  def icon
    content_tag(:i, '', class: 'bi bi-pencil')
  end
end
