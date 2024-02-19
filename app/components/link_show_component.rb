# frozen_string_literal: true

class LinkShowComponent < ViewComponent::Base
  attr_reader :link, :options

  def initialize(link:, options: {})
    @link = link
    @options = options
    super
  end

  def classes
    'btn btn-sm btn-info'
  end

  def icon
    content_tag(:i, '', class: 'bi bi-search')
  end
end
