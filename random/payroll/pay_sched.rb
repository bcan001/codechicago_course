require 'date'
require 'json'


class Converter
	def week_convert(new_weekday)
		if new_weekday == 0
			new_weekday = 'Sunday'
		elsif new_weekday == 1
			new_weekday = 'Monday'
		elsif new_weekday == 2
			new_weekday = 'Tuesday'
		elsif new_weekday == 3
			new_weekday = 'Wednesday'
		elsif new_weekday == 4
			new_weekday = 'Thursday'
		elsif new_weekday == 5
			new_weekday = 'Friday'
		elsif new_weekday == 6
			new_weekday = 'Saturday'
		end
	end
	def month_convert(new_month)
		if new_month == 1
			new_month ='January'
		elsif new_month == 2
			new_month = 'February'
		elsif new_month == 3
			new_month = 'March'
		elsif new_month == 4
			new_month = 'April'
		elsif new_month == 5
			new_month = 'May'
		elsif new_month == 6
			new_month = 'June'
		elsif new_month == 7
			new_month = 'July'
		elsif new_month == 8
			new_month = 'August'
		elsif new_month == 9
			new_month = 'September'
		elsif new_month == 10
			new_month = 'October'
		elsif new_month == 11
			new_month = 'November'
		elsif new_month == 12
			new_month = 'December'
		end
	end
	def print_out(w,m,d,y)
		each_date = w + ', ' + m + ' ' + d + ', ' + y
		puts each_date
		puts
	end
end

class OneDate
  attr_accessor :year, :month, :day, :weekday, :date
	def initialize(year,month,day)
		@date = Date.new(year,month,day)
		@year = date.year
		@month = date.mon
		@day = date.mday
		@weekday = date.wday
	end
end

class PaymentSchedule
	attr_accessor :pay_date, :frequency, :choice, :months, :year, :month, :monthday, :weekday, :year_lock, :hol_input, :hol_lib, :month_counter
	def initialize(pay_date,frequency,choice,year_lock,hol_input,hol_lib)
		@pay_date = pay_date
		@year = pay_date.year
		@month = pay_date.month
		@monthday = pay_date.day
		@weekday = pay_date.weekday
		@frequency = frequency
		@new_date_counter = 0
		@choice = choice
		@months = [1,2,3,4,5,6,7,8,9,10,11,12]
		@year_lock = year_lock
		@hol_input = hol_input
		@hol_lib = hol_lib

	end

	def print_dates

		month_counter = 0
		if choice == true
			puts
			p 'You will be paid on these dates:'
			puts

			new_date_counter = frequency * 7
		
			until pay_date.date.year != year_lock
				pay_date.date += new_date_counter
				new_date = pay_date.date

				if hol_lib.include?(new_date)
					puts "You\'ve avoided a public holiday! Date moved:"
					puts

					hol_wday = new_date.wday
					if hol_wday == 0
						new_date += 5
					elsif hol_wday == 1
						new_date += 4
					elsif hol_wday == 2
						new_date += 3
					elsif hol_wday == 3
						new_date += 2
					elsif hol_wday == 4
						new_date += 1
					elsif hol_wday == 5
						new_date += 7
					end		
				end

				if (new_date.wday == 0)
					puts "You\'ve avoided a weekend date! Date moved:"
					puts
					new_date += 5
				end
				if (new_date.wday == 6)
					puts "You\'ve avoided a weekend date! Date moved:"
					puts
					new_date += 6
				end


				final_date = Converter.new

				new_month = final_date.month_convert(new_date.mon)
				new_weekday = final_date.week_convert(new_date.wday)

				new_day = new_date.mday.to_s
				new_year = new_date.year.to_s

				each_date = final_date.print_out(new_weekday,new_month,new_day,new_year)

			end

		elsif choice == false
			puts
			puts 'You will be paid on these dates:'
			puts
			months.each do |m|
				until Date.valid_date?(pay_date.date.year,m,pay_date.date.day) == true
					pay_date.date -= 1
				end

				new_date = Date.new(pay_date.date.year,m,pay_date.date.day)

				if hol_lib.include?(new_date)
					puts "You\'ve avoided a public holiday! Date moved:"
					puts
					hol_wday = new_date.wday

					if hol_wday == 0
						new_date += 5
					elsif hol_wday == 1
						new_date += 4
					elsif hol_wday == 2
						new_date += 3
					elsif hol_wday == 3
						new_date += 2
					elsif hol_wday == 4
						new_date += 1
					elsif hol_wday == 5
						new_date += 7
					end		
				end

				if (new_date.wday == 0)
					puts "You\'ve avoided a weekend date! Date moved:"
					puts
					new_date += 5
				end
				if (new_date.wday == 6)
					puts "You\'ve avoided a weekend date! Date moved:"
					puts
					new_date += 6
				end

				month_counter += 1

				if new_date.month != month_counter
					until (new_date.month == month_counter) && (new_date.wday != (0||6))
						new_date -= 1
					end
				end

				final_date = Converter.new

				new_month = final_date.month_convert(new_date.mon)
				new_weekday = final_date.week_convert(new_date.wday)

				new_day = new_date.mday.to_s
				new_year = new_date.year.to_s

				each_date = final_date.print_out(new_weekday,new_month,new_day,new_year)
			end
		end
	end
end

class Generate
	attr_accessor :day, :freq, :include_holiday
	def initialize
		@day = day
		@freq = freq
		@include_holiday = include_holiday
	end
	def run
		x = 0
		while x == 0
			puts
			puts "Would you like to be paid on a specific day each month(type 'date') or in week frequencies(type 'frequency')?"
			user_input = gets.chomp
			if user_input == 'date'
				day = true
				freq = false
				x = 1
			elsif user_input =='frequency'
				day = false
				freq = true
				x = 1
			else
				x = 0
			end
		end
		
		if (freq == true) && (day == false)
			p = 0
			while p == 0
				puts 'Please enter a date to start getting paid at (ex. 2001-12-30)'
				date_input = gets.chomp

				year = date_input[0..3]
				month = date_input[5..6]
				days = date_input[8..9]

				if date_input[5] == '0'
					month = date_input[6]
				end
				if date_input[8] == '0'
					days = date_input[9]
				end

				y = year.to_i
				m = month.to_i
				d = days.to_i

				valid_start = Date.valid_date?(y,m,d)

				if (valid_start == true)
					p = 1
				elsif valid_start == false
					puts 'Invalid Date!'
					p = 0
				end
			end
			z = 0
			while z == 0
				puts 'Please enter a frequency to get paid in weeks (1,2,4, or 13)'
				freq_input = gets.chomp
				freq_input = freq_input.to_i
				if (freq_input == 1) || (freq_input == 2) || (freq_input == 4) || (freq_input == 13)
					z = 1
				else
					z = 0
				end
			end

			new_date = OneDate.new(y,m,d)

		elsif (day == true) && (freq == false)
			x = 0
			while x == 0
				puts 'please enter a 4 digit year (ex. 1999)'
				year_input = gets.chomp

				if (year_input.is_a?(String) == true) && (year_input.length == 4)
					year_input = year_input[0..3].to_i
				else
					year_input = year_input.to_i
				end
				
				year_valid = Date.valid_date?(year_input,1,1)

				if (year_valid == false) || (year_input == 0) || (year_input.to_s.length != 4) || (year_input <= 0)
					puts 'Invalid year!'
					x = 0
				else
					y = year_input.to_i
					x = 1
				end
			end
			s = 0
			while s == 0
				puts 'Please enter a day of the month (from 1 to 31)'
				day_input = gets.chomp

				day = day_input[0..1]

				if day_input[0] == '0'
					day = day_input[1]
				end

				d = day.to_i
				day_valid = Date.valid_date?(y,3,d)

				if (day_valid == false) || (d <= 0)
					puts 'Invalid day!'
					s = 0
				else
					s = 1
				end
			end
			m = 1
			new_date = OneDate.new(y,m,d)
			freq_input = 0
		end

			g = 0
			while g == 0
				puts "Would you like to avoid being paid on public holidays? ('yes' or 'no')"
				hol_input = gets.chomp
				hol_input = hol_input.to_s
				if hol_input == 'no'
					hol_lib = []
					g = 1
				elsif hol_input == 'yes'

					file = open("./public_holidays.json")
					data = file.read

					data_hash = JSON.parse(data)
					data_hash = data_hash['public_holidays']

					hol_lib = []
					data_hash.each do |k,v|
						one_day = k['date']
						one_day[4] = '-'

						if one_day[6] == '/'
							one_day.insert(5,'0')
						end

						one_day[7] = '-'

						if one_day.length == 9
							one_day.insert(8,'0')
						end

						one_day = Date.parse(one_day)
						hol_lib << one_day
					end
					g = 1
				else
					puts "Invalid entry, please enter: 'yes' or 'no'"
					g = 0
				end
			end
		year_lock = y
		sched = PaymentSchedule.new(new_date,freq_input,freq,year_lock,hol_input,hol_lib)
		sched.print_dates
	end
end

calc = Generate.new
calc.run