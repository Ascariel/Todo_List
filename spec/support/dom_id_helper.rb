module RailsDomIdHelper

	def dom_id_for(model)
		["#", ActionView::RecordIdentifier.dom_id(model)].join #IM GETTING TH SPCIFIC DOM ID PATTERN FOR THE PASSED MODEL AND JIIING I T WITHA  PREFIXED # SO THAT ITS AN ID IDENTIFIER.
	end


end