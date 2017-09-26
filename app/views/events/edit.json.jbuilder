if @event
	json.event do
	  json.signup_required @event.signup_required
	end
end