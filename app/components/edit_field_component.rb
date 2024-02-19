# frozen_string_literal: true

# EditFieldComponent
class EditFieldComponent < ViewComponent::Base
  attr_reader :todo, :field

  def initialize(todo:, field:)
    @todo = todo
    @field = field
    super
  end

  def content
    cell do
      field == :status ? button { render BadgeStatusComponent.new(todo:) } : button
    end
  end

  def cell(&block)
    content_tag :td, id: dom_id(todo, "edit_#{field}") do
      block.call
    end
  end

  def button(&block)
    if block_given?
      button_to edit_field_todo_path(todo, field:), class: 'btn btn-link text-decoration-none' do
        block.call
      end
    else
      button_to todo.send(field), edit_field_todo_path(todo, field:), class: 'btn btn-link text-decoration-none'
    end
  end
end
