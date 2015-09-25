atom_feed do |feed|
	feed.title "Romp International News & Updates"
	feed.description "News and updates related the Romp International kadooment band, located in barbados"
	feed.updated @events.maximum(:created_at)

	@events.each do |event|
		feed.entry event, {published: event.created_at, updated: event.updated_at} do |entry|
			entry.title(event.name)
			entry.content(event.description)
			entry.author("Sonia Outram")
			entry.url event_url(event)
		end
	end
end
