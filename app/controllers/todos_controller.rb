# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :set_todo, only: %i[show edit update destroy edit_field]

  # GET /todos or /todos.json
  def index
    @pagy, @todos = pagy(Todo.all)

    respond_to do |format|
      format.html { render :index }
      format.turbo_stream
      format.json { render json: @todos }
    end
  end

  # GET /todos/1 or /todos/1.json
  def show; end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit; end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_url(format: :turbo_stream), notice: 'Todo was successfully created.' }
      else
        format.turbo_stream
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_url(format: :turbo_stream), notice: 'Todo was successfully created.' }
      else
        format.turbo_stream
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy!

    respond_to do |format|
      format.html { redirect_to todos_url(format: :turbo_stream), notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    @pagy, @todos = pagy(Todo.all.order(params[:sort] => params[:direction]), page: params[:page] || 1)
  end

  def search
    @pagy, @todos = pagy(Todo.where('title LIKE ?', "%#{params[:search]}%")
                 .or(Todo.where('description LIKE ?', "%#{params[:search]}%")))
  end

  def edit_field
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("edit_#{params[:field]}_todo_#{@todo.id}",
                                                  partial: 'todos/edit_field',
                                                  locals: { todo: @todo, field: params[:field] })
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = Todo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def todo_params
    params.require(:todo).permit(:title, :description, :status)
  end
end
