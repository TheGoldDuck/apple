class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @Skills = Skill.all
  end

  def about
  end

  def contact
  end
end
