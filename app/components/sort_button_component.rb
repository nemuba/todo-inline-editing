# frozen_string_literal: true

class SortButtonComponent < ViewComponent::Base
  attr_reader :column, :direction, :selected, :page

  def initialize(column:, direction:, selected:, page: 1)
    @column = column
    @direction = direction
    @selected = selected
    @page = page
    super
  end

  def arrow_default(icon:)
    content_tag(:div, class: 'mx-3') do
      content_tag(:i, '', class: icon)
    end
  end

  def title
    content_tag(:span, column.capitalize)
  end

  def button_sort(icon:, direction:)
    button_to sort_todos_path(sort: column.downcase, direction:, page:), data: { turbo_frame: 'todos' },
                                                                         class: 'btn btn-xs btn-link' do
      content_tag(:i, '', class: icon)
    end
  end

  def selected?
    column == selected
  end

  def asc?
    direction == 'asc'
  end

  def desc?
    direction == 'desc'
  end
end
