class GlossariesController < ApplicationController
  before_action :set_glossary, only: [:show, :destroy]
  respond_to :html, :js, :json
  
  def index
    @glossary = Glossary.new
    @glossaries = Glossary.all
  end

  def show
    @terms = @glossary.terms
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
    @glossary.destroy
  end

  private

    def glossary_params
      params.require(:glossary).permit(:title)
    end

    def set_glossary
      @glossary = Glossary.find(params[:id])
    end
end