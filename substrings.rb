require "pry-byebug"

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#   => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#   > substrings("below", dictionary)
#   => { "below" => 1, "low" => 1 }

def substrings(string, dic_arr)
string_arr = string.split(" ")
found_obj = dic_arr.map {|substring| 
    regex_sub = Regexp.new(substring, Regexp::EXTENDED | Regexp::IGNORECASE)
    string_arr.map {|word|
    word.match(regex_sub)
    }.compact
}

found_array = found_obj.flatten.map {|object| object[0]}

final_hash = Hash.new

found_array.map {|word| 
    unless final_hash.include?(word.downcase)
        final_hash[word.downcase] = 1
    else
        final_hash[word.downcase] += 1
    end
}
final_hash
end

p substrings("below it glows in me", dictionary)

p substrings("Howdy partner, sit down! How's it going?", dictionary)

# p substrings("going", dictionary)
