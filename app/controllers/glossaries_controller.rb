class GlossariesController < ApplicationController
  respond_to :html, :js, :json
  
  def index
    @glossary = Glossary.new
    @glossaries = Glossary.all
  end

  def show
  	@glossary = Glossary.find(params[:id])
    @terms = @glossary.terms

    gon.glossary = glossary_path
  end

  def new
    @glossary = Glossary.new
  end

  def create
    @glossary = Glossary.new(glossary_params)
    if @glossary.save
      render :js => "window.location = '#{glossary_path(@glossary)}'"
    end
  end

  def destroy
  end

  private

    def glossary_params
      params.require(:glossary).permit(:title)
    end
end
