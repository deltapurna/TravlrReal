class JournalsController < ApplicationController
  before_action :logged_in_user

  def create
    @journal = current_user.journals.
      build(journal_params)
    
    if @journal.save
      # render partial: 'journal', locals: { journal: @journal }
      # redirect_to root_url
    else
      redirect_to root_url, alert: 'Something wrong'
    end
  end

  private

  def journal_params
    params.require(:journal).permit(:title, :content, :picture)
  end
end
