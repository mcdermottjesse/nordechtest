class Phone
  def phone_numbers(number)
    allowed_nums_array = ["+1 (613)", "+1(613)", "(613)", "1 613", "1613", "613"]
    blacklisted_nums_array = ["2014687508", "1111111111", "2222222222", "1234567890"]
    blacklisted_area_code_array = ["+1 (901)", "+1(901)", "(901)", "1 901", "1901", "901"]
    
    allowed_nums_array.each do |num|
      if number.start_with?(num)
        puts number
      end
    end
    blacklisted_nums_array.each do |num|
      if number == num
        puts "BLACKLISTED NUMBER"
      end
    end
    blacklisted_area_code_array.each do |num|
      if number.start_with?(num)
        puts "BLACKLISTED AREA CODE (901)"
      end
    end
  end
end

num = Phone.new()
num.phone_numbers("+1(613)1234")

num.phone_numbers("2014687508")

num.phone_numbers("+1(901)1234")
