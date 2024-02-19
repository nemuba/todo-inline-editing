class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy edit_field ]

  # GET /todos or /todos.json
  def index
    @todos = Todo.all.order(title: :asc)
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.turbo_stream
        format.html { redirect_to todos_url, notice: "Todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.turbo_stream
        format.html { redirect_to todos_url, notice: "Todo was successfully updated." }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to todos_url, notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def sort
    @todos = Todo.all.order(params[:sort] => params[:direction])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update(:todos, partial: 'todos/todo', collection: @todos),
          turbo_stream.update(:sort_button, partial: 'todos/table_header', locals: { direction: params[:direction], selected: params[:sort] })
        ]
      end
    end
  end

  def search
    @todos = Todo.where('title LIKE ?', "%#{params[:search]}%")
                 .or(Todo.where('description LIKE ?', "%#{params[:search]}%"))

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.update(:todos, partial: 'todos/todo', collection: @todos) }
    end
  end

  def edit_field
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("edit_#{params[:field]}_todo_#{@todo.id}", partial: 'todos/edit_field', locals: { todo: @todo, field: params[:field] }) }
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
