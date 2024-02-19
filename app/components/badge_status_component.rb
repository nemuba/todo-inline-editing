# frozen_string_literal: true

# BadgeStatusComponent is a ViewComponent that displays a badge with the status of a todo. It is used in the TodoComponent to display the status of a todo. The component is initialized with a todo and uses the status of the todo to determine the class of the badge. The class_name method returns the class of the badge based on the status of the todo. The content method returns the badge with the status of the todo. The class_name method is used in the content method to determine the class of the badge. The content method is used in the TodoComponent to display the status of a todo.
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
