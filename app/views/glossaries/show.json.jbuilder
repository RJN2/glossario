json.array!(@terms) do |term|
	json.term 			term.term
	json.edit_path 	edit_glossary_term_path(@glossary, term)
	json.show_path 	glossary_term_path(@glossary, term)
end