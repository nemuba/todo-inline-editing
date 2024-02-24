# frozen_string_literal: true

class Todo < ApplicationRecord
  enum status: { pending: 'pending', completed: 'completed' }

  validates :title, :description, presence: true

  def created_at_f
    created_at.strftime('%d/%m/%Y')
  end

  def updated_at_f
    updated_at.strftime('%d/%m/%Y')
  end
end
