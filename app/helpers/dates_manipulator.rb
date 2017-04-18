class DatesManipulator

	def date_list_from_multiple_ranges_string(date_string)
		ranges = date_string.split(/&/)
		dates = ranges.map { |range| date_list_from_string_range(range)}
		ranges.flatten	
	end

	private

	def date_list_from_string_range(date_range)
		regex = /20[01][0-9]-[0-9]{2}-[0-9]{2}/
		result = date_range.scan(regex)
		start_date = Date.parse(result[0])
		return start_date if result.size == 1
		end_date = Date.parse(result[1])
		date = start_date
		date_tab = []
		while date <= end_date do 
			date_tab.insert(-1, date)
			date = date + 1.day
		end
		date_tab
	end

end