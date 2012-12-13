class NewsController < ApplicationController
  def index
    @links = Link.order('id DESC') #sort it by id by descending order -- so, when we render it, then it will list the newest one first. 
  end
end