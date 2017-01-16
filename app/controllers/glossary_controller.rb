class GlossaryController < ApplicationController
  DEFAULT_LETTER = 'a'

  def index
    @letter = (params[:letter] || DEFAULT_LETTER)
    @terms = Term.by_letter(@letter)
    respond_to do |format|
      format.html
      format.js { render layout: nil, locals: { terms: @terms } }
    end
  end

  def search
  end
end
