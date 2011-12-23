TodoPadrino.controllers :tasks do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index, :map => '/' do
    @todo  = Task.where(:done => false)
    @task  = Task.new
    @lists = List.all
    @list  = List.new
    render 'tasks/index'
  end

  post :create, :parent => :list do
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(params[:task])
    if @task.save
      flash[:notice] = 'Your task was created.'
    else
      flash[:alert] = 'There was an error creating your task.'
    end
    redirect url_for(:tasks, :index, :list_id => @list)
  end

  put :index, :parent => :list, :with => :id do
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect url_for(:tasks, :index, :list_id => @list)
    end
  end

  delete :index, :with => :id do
    @task = Task.find(params[:id])
    @task.destroy
    redirect '/'
  end
end
