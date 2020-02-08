class TodosController < ApplicationController

    def index
        @todos = Todo.all
    end

    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todos_params)
        if @todo.save
            redirect_to todos_path
        end
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        @todo.update(todos_params)
        redirect_to todos_path
    end
    
    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        redirect_to todos_path
    end

    def complete
        @todo = Todo.find(params[:id])
        @todo.completed = true
        @todo.save
        redirect_to todos_path
    end

    def list
        @todos = Todo.all
    end

private
    def todos_params
        params.require(:todo).permit(:description, :completed)
    end

end
