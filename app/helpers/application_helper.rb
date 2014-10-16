module ApplicationHelper
	def full_title(page_title)
		base_title = "Glossar.io"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def footer_button(icon_id, icon_class, options = {})
		content_tag :li, id: icon_id do
			content_tag :a, href: options[:link] do
				content_tag :i, nil, id: "#{icon_id}-icon", class: "fa #{icon_class} fa-5x"
			end
		end
	end

	def modal(object)
		form = "#{object}Form"

		content_tag :div, id: form,
											class: 'modal fade modal-form',
											tabindex: '-1',
											role: 'dialog',
											:"aria-labelledby" => form,
											:"aria-hidden" => 'true' do
			content_tag :div, nil, id: "#{object}-form", class: 'container modal-dialog'
		end
	end

	def page_footer_buttons
		if params[:controller] == 'glossaries'
			if params[:action] == 'index'
				render partial: 'layouts/footer_tools', locals: { add: @glossary }
			elsif params[:action] == 'show'
				render partial: 'layouts/footer_tools', locals: { add: [@glossary, :term] }
			end
		end
	end
end
