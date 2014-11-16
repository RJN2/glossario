class GlossariesController < ApplicationController
  before_action :all_glossaries, only: [:create, :update, :destroy]
  before_action :set_glossary, only:   [:edit, :update, :show, :destroy]
  respond_to :html, :js
  
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

  def edit
  end

  def update
    @glossary.update_attributes(glossary_params)
  end

  def destroy
    @glossary.destroy
  end

  private

    def glossary_params
      params.require(:glossary).permit(:title)
    end

    def all_glossaries
      @glossaries = Glossary.all
    end

    def set_glossary
      @glossary = Glossary.find(params[:id])
    end
end