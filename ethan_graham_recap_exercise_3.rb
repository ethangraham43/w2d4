require "byebug"

def no_dupes?(arr)
    ret_arr = []
    arr.each_with_index do |ele, idx|
        # debugger
        arr.delete_at(idx) 
        if !arr.include?(ele)
            ret_arr << ele
        end
    end
    ret_arr
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    ret_arr = []
    arr.each_with_index do |ele, idx|
        # debugger
        if arr[idx] == arr[idx+1]
            return false
        end
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new {|h, k| h[k] = []}
    str.each_char.with_index {|let, i| hash[let] << i}
    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

# def longest_streak(str)
#     hash = Hash.new(0)
#     (0..(str.length-1)).each_with_index do |let, idx|
#         count = 1
#         if str[idx] != str[idx+1]
#             hash[let] = count
#             test_ct = 1
#             (idx..(str.length-1)).each_with_index do |let, idx|
#                 if str[idx] == str[idx+1]
#                     test_ct += 1
#                 else
                    
#             end
#         else
#             count += 1
#         end
#     end
# end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def prime?(n)
    return false if n < 2
    (2...n).each do |fact|
        return false if n % fact == 0
    end
    true
end

def bi_prime?(n)
    (1...n).each do |fact1|
        (1...n).each do |fact2|
            if fact1 * fact2 == n && prime?(fact1) && prime?(fact2)
                return true
            end
        end
    end
    false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(str, arr)
    alphabet = ("a".."z").to_a
    new_arr = []
    new_str = ""
    while new_arr.length < str.length + 1
        new_arr << arr
    end
    new_arr = new_arr.flatten
    str.each_char.with_index do |let, idx|
        old_idx = alphabet.index(let)
        # debugger
        new_idx = (old_idx + new_arr[idx]) % 26
        new_str += alphabet[new_idx]
    end
    new_str
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = "aeiou"
    vow_arr = []
    idx_arr = []
    new_arr = []
    str.each_char.with_index do |let, idx|
        if vowels.include?(let)
            vow_arr << let
            idx_arr << idx
        end
    end
    vow_arr.each_with_index do |vow, i|
        new_i = (i + 1) % vow_arr.length
        new_arr << vow_arr[new_i]
    end
    new_arr
end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"