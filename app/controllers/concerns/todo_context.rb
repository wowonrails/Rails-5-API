module TodoContext
  def todos
    @todos ||= Todo.all
  end

  def set_todo
    @todo = todos.find(params[:todo_id] || params[:id])
  end
end
