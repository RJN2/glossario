class TermsController < ApplicationController
	before_filter :get_glossary

	def create
		@term = @glossary.terms.build(term_params)
		if @term.save
			flash[:success] = "Term created"
			redirect_to glossary_url(@glossary)
		else
			@terms = @glossary.terms.order('term ASC')
			render 'glossaries/show'
		end
	end

	private

		def term_params
			params.require(:term).permit(:term, :definition)
		end

		def get_glossary
			@glossary = Glossary.find(params[:glossary_id])
		end
end