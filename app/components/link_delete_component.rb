# frozen_string_literal: true

class LinkDeleteComponent < ViewComponent::Base
  attr_reader :link, :method, :options

  def initialize(link:, options: {})
    @link = link
    @method = :delete
    @options = options
    super
  end

  def classes
    'btn btn-sm btn-danger'
  end

  def icon
    content_tag(:i, '', class: 'bi bi-trash')
  end
end
