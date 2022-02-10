def no_dupes?(arr)
    hash = Hash.new(0)
    new_arr = []

    arr.each do |n|
        hash[n] += 1
    end

    hash.each do |k, v|
        new_arr.push(k) if v == 1
    end

    new_arr
end

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        return false if arr[i] == arr[i + 1]
    end

    true
end

def char_indices(str)
    hash = Hash.new{ |h, k| h[k] = []}

    str.each_char.with_index do |char, i|
        hash[char].push(i)
    end

    hash
end

def longest_streak(str)
    new_str = ""
    index = 0

    (0..str.length).each do |i|
        if str.length < 2
            new_str = str
        elsif str[i] != str[index]
            new_str = str[index...i] if str[index...i].length >= new_str.length
            index = i
        elsif i == str.length
            new_str = str[index..-1] if str[index..-1].length >= new_str.length
        end
    end

    new_str
end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    arr = []

    (2..Math.sqrt(num)).each do |n|
        if num % n == 0
            arr.push(n)
            arr.push(num / n)
        end
    end

    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] * arr[j] == num && is_prime?(arr[i]) && is_prime?(arr[j])
        end
    end

    false
end

def is_prime?(num)
    return false if num < 2

    (2...num).each do |i|
        return false if num % i == 0
    end

    true
end
   
def vigenere_cipher(str, arr)
    new_str = ""
    alphabet = "abcdefghijklmnopqrstuvwxyz"

    str.each_char.with_index do |char, i|
        n = i % arr.length
        j = (alphabet.index(char) + arr[n]) % 26
        new_str += alphabet[j]
    end

    new_str
end

def vowel_rotate(str)
    indices = []
    arr = []
    vowels = "aeiou"
    new_str = ""

    str.each_char.with_index do |char, i|
        if vowels.include?(char)
            indices.push(i)
            arr.push(char)
        end
        new_str += char
    end

    arr = arr.rotate(-1)

    indices.each_with_index do |n, i|
        new_str[n] = arr[i]
    end

    new_str
end

class String
    def select(&prc)
        new_str = ""

        return new_str if prc == nil

        self.each_char do |char|
            new_str += char if prc.call(char)
        end

        new_str
    end

    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end

        self
    end
end

def multiply(a, b)
    if b == 0
        0
    elsif b > 0
        a + multiply(a, b - 1)
    else
        -a + multiply(a, b + 1)
    end
end

def lucas_sequence(num)
    arr = []

    (1..num).each do |i|
        arr.push(lucas(i))
    end

    arr
end

def lucas(num)
    if num == 1
        2
    elsif num == 2
        1
    else
        lucas(num - 2) + lucas(num - 1)
    end
end

def prime_factorization(num)
    arr = []

    (2..num).each do |n|
        if num % n == 0 && is_prime?(n)
            arr = [prime_factorization(num / n), n]
        end
    end

    arr.flatten()
end