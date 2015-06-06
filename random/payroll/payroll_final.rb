require 'date'
require 'json'
require 'pry'

#Date = Struct.new(:year, :day, :weekday)

# date = Date.new(2001,2,3)
# p date.year
# p date.day
# p date.month
# # 0-6, sunday is 0
# p date.wday


class PayrollCalculator
	attr_accessor :year, :month, :day, :year_over, :date, :week_freq, :use_holiday_file
	def initialize
		@year = 0
		@month = 0
		@day = 0
		@date = nil
		@year_over = false
		@week_freq = 0
		@day_freq = 0
		@use_holiday_file = false
	end

	def run
		#user chooses from these prompts at startup:
		@year = gets.chomp.to_i
		@month = gets.chomp.to_i
		@day = gets.chomp.to_i
		@date = Date.new(@year,@month,@day)
		@week_freq = 0#gets.chomp.to_i
		@day_freq = 1#1
		@use_holiday_file = true

		while @year_over == false
			get_date
			print_date
		end
		puts "Payroll Calculator Done Calculating"
	end

	def get_date
		if @week_freq != 0
			@date = @date + (@week_freq * 7)
		elsif @day_freq != 0
			@date = @date.next_month(@day_freq)
		end
	end

	def print_date
		if @date.year != @year
			@year_over = true
		else
			weekend_date?
			is_holiday? if @use_holiday_file == true
 			pretty_output_date(@date)
 		end
	end

	def is_holiday?
		file = open("./public_holidays.json")
		data = file.read
		data_hash = JSON.parse(data)
		data_hash = data_hash['public_holidays']
		#binding.pry
		## check whether the date is a holiday in the json file
		data_hash.each do |holiday|
			if holiday["date"] == "#{@date.year}/#{@date.month}/#{@date.day}"
				p "#{pretty_output_date(@date)} is #{holiday["name"]}, the date has been changed to:"
				if @date.wday == 5
					@date += 1
				end
				while (@date.friday? == false)
					@date += 1
				end
			end
		end
	end

	def pretty_output_date(date)
		p "#{pretty_days(@date.wday)}, #{pretty_months(@date.month)} #{@date.day}, #{@date.year}"
	end

	def pretty_months(month_num)
		case month_num
		when 1
			"January"
		when 2
			"February"
		when 3
			"March"
		when 4
			"April"
		when 5
			"May"
		when 6
			"June"
		when 7
			"July"
		when 8
			"August"	
		when 9
			"September"
		when 10
			"October"
		when 11
			"November"
		when 12
			"December"
		end
	end

	def pretty_days(day)
		case day
		when 0
			"Sunday"
		when 1
			"Monday"
		when 2
			"Tuesday"
		when 3
			"Wednesday"
		when 4
			"Thursday"
		when 5
			"Friday"
		when 6
			"Saturday"
		end
	end

	def weekend_date?
		if (@date.wday == 0)
			@date += 1
		elsif (@date.wday == 6)
			@date += 2
		end
	end
end


payroll = PayrollCalculator.new
payroll.run