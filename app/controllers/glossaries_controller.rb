class GlossariesController < ApplicationController
  def index
    @glossary = Glossary.new
    @glossaries = Glossary.all
  end

  def show
  	@glossary = Glossary.find(params[:id])
    @terms = @glossary.terms
  end

  def create
    @glossary = Glossary.new(glossary_params)
    if @glossary.save
      flash[:success] = "Glossary created!"
      redirect_to glossaries_url
    else
      @glossaries = Glossary.all
      render 'index'
    end
  end

  def destroy
  end

  private

    def glossary_params
      params.require(:glossary).permit(:title)
    end
end
