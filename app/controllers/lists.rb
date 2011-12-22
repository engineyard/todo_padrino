TodoPadrino.controllers :lists do
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

  post :index do
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = 'Your list was created.'
    else
      flash[:alert] = 'There was an error creating your list.'
    end
    redirect url_for(:tasks, :index, :list_id => @list)
  end
  
  get :destroy, :with => :id do
    @list = List.find(params[:id])
    @list.destroy
    redirect '/'
  end
end
