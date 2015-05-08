class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all.order(created_at: :asc)
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_url }
      else
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_url }
      else
        format.html { render :edit }
      end
    end
  end

  def update_many
    @todos = Todo.where(id: params[:ids])
    respond_to do |format|
      if @todos.update(todo_params)
        format.html { redirect_to todos_url }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:title, :is_completed)
    end
end
