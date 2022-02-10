# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    arr = []

    words.each_with_index do |n, i|
        new_str = ""
        has_a = false
        has_e = false
        has_i = false
        has_o = false
        has_u = false

        has_a = true if n.include?("a")
        has_e = true if n.include?("e")
        has_i = true if n.include?("i")
        has_o = true if n.include?("o")
        has_u = true if n.include?("u")
        (i+1...words.length).each do |j|
            has_a = true if words[j].include?("a")
            has_e = true if words[j].include?("e")
            has_i = true if words[j].include?("i")
            has_o = true if words[j].include?("o")
            has_u = true if words[j].include?("u")

            if has_a && has_e && has_i && has_o && has_u
                new_str = n + " " + words[j]
                arr.push(new_str)
                new_str = ""
            end
            
            has_a = false if words[j].include?("a") && !n.include?("a")
            has_e = false if words[j].include?("e") && !n.include?("e")
            has_i = false if words[j].include?("i") && !n.include?("i")
            has_o = false if words[j].include?("o") && !n.include?("o")
            has_u = false if words[j].include?("u") && !n.include?("u")
        end

    end

    arr
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    !(is_prime?(num))
end

def is_prime?(num)
    return false if num < 2

    (2...num).each do |i|
        return false if num % i == 0
    end

    true
end

# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    arr = []
    
    bigrams.each do |bigram|
        (0...str.length - 1).each do |i|
            arr.push(bigram) if str[i..i+1] == bigram 
        end
    end
    
    arr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        hash = Hash.new(0)

        if prc == nil
            self.each do |k, v|
                hash[k] = v if k == v
            end
        else 
            self.each do |k, v|
                hash[k] = v if prc.call(k, v)
            end
        end

        hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        arr = []

        if length == nil
            (0...self.length).each do |i|
                (i...self.length).each do |j|
                    arr.push(self[i..j])
                end
            end
        else 
            (0..self.length - length).each do |i|
                arr.push(self[i..i+length-1])
            end
        end

        arr
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    
    def caesar_cipher(num)
        new_str = ""
        alphabet = "abcdefghijklmnopqrstuvwxyz"

        self.each_char.with_index do |char, i|
            if alphabet.include?(char)
                j = (alphabet.index(char) + num) % 26
                new_str += alphabet[j]
            end
        end

        new_str
    end
end
