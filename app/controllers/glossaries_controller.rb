class GlossariesController < ApplicationController
  def index
    @glossaries = Glossary.all
  end

  def show
  	@glossary = Glossary.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end
end
