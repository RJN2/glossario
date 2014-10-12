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
		options[:link] ||= root_path

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
end
