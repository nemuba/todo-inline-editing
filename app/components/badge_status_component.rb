# frozen_string_literal: true

# BadgeStatusComponent is a ViewComponent that displays a badge with the status of a todo.
class BadgeStatusComponent < ViewComponent::Base
  attr_reader :todo

  def initialize(todo:)
    @todo = todo
    super
  end

  def content
    content_tag(:span, todo.status.capitalize, class: class_name)
  end

  def class_name
    todo.completed? ? 'badge badge-success bg-success m-0' : 'badge badge-warning bg-warning m-0'
  end
end
