class Phone
  def phone_numbers(number)
    num_array = ["+1 (613)", "(613)", "1", "613 ", "613."]
    num_array.each do |num|
      if number == num
        puts "YES"
        puts number
      else
        puts "NO"
        puts number
      end
    end
  end
end

num = Phone.new()
num.phone_numbers("+1 (613)")
