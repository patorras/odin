require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'time'


def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

# clean phone numbers
def phone_number_cleaner(phone_number)
   # If the phone number is more than 11 digits, assume that it is a bad number
   # If the phone number is less than 10 digits, assume that it is a bad number
  if phone_number.count("[0-9]") < 10 || phone_number.count("[0-9]") > 11
    return "No phone number"

  # If the phone number is 11 digits and the first number is 1, trim the 1 and use the remaining 10 digits
  elsif phone_number.count("[0-9]") == 11 && phone_number[0] == 1
      return phone_number[1..11]

  # If the phone number is 11 digits and the first number is not 1, then it is a bad number
  elsif phone_number.count("[0-9]") == 11 && phone_number[0] != 1
    return "No phone number"

  # If the phone number is 10 digits, assume that it is good
  else
      return phone_number
  end
end


# prints the hour with more resistrations
def high_registration_hours(contents)


  hours = []
  count_hours = Hash.new(0)

  # fill the hours array with the hours from csv file
  contents.each do |row|
    time = row[:regdate]
    hours << Time.strptime(time, '%Y/%d/%m %k:%M').hour
  end

  # counts how many times each hour appears
  hours.each do |hour|
    count_hours[hour] += 1
  end

  p hours
  # returns the hours where more person registed
  coiso = count_hours.group_by { |_,value| value }.max_by { |key,_| key }.last.to_h

  puts "The hours we have most registrations are: "
  puts coiso.keys

end

def high_registration_day(contents)
  weekdays = {1 => "Monday", 2 => "Tuesday", 3 => "Wednesday", 4 => "Thursday", 5 => "Friday",
    6 => "Saturday", 7 => "Sunday"}
  count_weekdays = Hash.new(0)

  contents.each do |row|
    time = row[:regdate]
    count_weekdays[Time.strptime(time, '%Y/%d/%m').wday] += 1
  end

  count_days_week = count_weekdays.group_by { |_,value| value }.max_by { |key,_| key }.last.to_h

  day = count_days_week.keys

  puts "The day of the week we have most registrations is: "
  puts weekdays[day[0]]

end

puts 'EventManager initialized.'

def file_open()
  contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
  )
  return contents
end


template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter


file_open().each do |row|
  id = row[0]
  name = row[:first_name]
  phone_number = phone_number_cleaner(row[:homephone])
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id,form_letter)
end

high_registration_hours(file_open())
high_registration_day(file_open())