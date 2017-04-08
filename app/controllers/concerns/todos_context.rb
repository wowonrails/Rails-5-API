module TodoContext
  def todos
    @todos ||= current_user.todos
  end

  def set_todo
    @todo = todos.find(params[:todo_id] || params[:id])
  end
end
