class TermsController < ApplicationController
	before_filter :set_glossary
	before_action :all_terms
	respond_to :html, :js

	def create
		@term = @glossary.terms.create(term_params)

		# flash[:notice] = "Term created." if @term.save
		# respond_with( @term, :layout => !request.xhr? )
	end

	def destroy
		@term = @glossary.terms.find(params[:id])
		@term.destroy
		flash.now[:notice] = "Term destroyed"
	end

	private

		def all_terms
			@terms = @glossary.terms.order('term ASC')
		end

		def term_params
			params.require(:term).permit(:term, :definition)
		end

		def set_glossary
			@glossary = Glossary.find(params[:glossary_id])
		end

end