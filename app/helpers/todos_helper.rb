# frozen_string_literal: true

module TodosHelper
  def render_error(resource)
    return unless error?(resource)

    render partial: 'todos/errors', locals: { todo: resource }
  end

  def error?(resource)
    resource.errors.any?
  end

  def field_error?(resource, field)
    error?(resource) && resource.errors[field].present?
  end

  def class_error(resource, field)
    field_error?(resource, field) ? 'form-control is-invalid' : 'form-control'
  end
end
