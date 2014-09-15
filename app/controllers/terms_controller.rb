class TermsController < ApplicationController
	before_filter :set_glossary
	before_action :all_terms, only: [:create, :update, :destroy]
	before_action :set_terms, only: [:edit, :update, :destroy, :show]
	respond_to :html, :js

	def show
	end

	def new
		@term = @glossary.terms.new
	end

	def create
		@term = @glossary.terms.create(term_params)

		# flash[:notice] = "Term created." if @term.save
		# respond_with( @term, :layout => !request.xhr? )
	end

	def edit
  end

	def update
		@term.update_attributes(term_params)
	end

	def destroy
		@term.destroy
	end

	private

		def all_terms
			@terms = @glossary.terms.order('term ASC')
		end

		def set_terms
			@term = @glossary.terms.find(params[:id])
		end

		def term_params
			params.require(:term).permit(:term, :definition)
		end

		def set_glossary
			@glossary = Glossary.find(params[:glossary_id])
		end

end