module ProgramsHelper
	def self.title_length(title)
		title.length
	end

	def self.string_days_ago(date)
		"Aired #{days_ago(date)} days ago"
	end

	private

	def self.days_ago(date)
		today = Time.now
		(today - date).to_i / (60*60*24)
	end
end
