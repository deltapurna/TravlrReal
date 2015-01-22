class StaticPagesController < ApplicationController
  def home
    @journal = Journal.new
    @journals = current_user.journals.
      order(created_at: :desc).limit(10) if current_user
  end

  def about
  end
end
