# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    min = [num_1, num_2].min
    gcf = 1

    (2..min).each do |n|
        gcf = n if num_1 % n == 0 && num_2 % n == 0 && n > gcf
    end

    num_1 * num_2 / gcf
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)
    max = 0
    bigram = ""

    (0...str.length - 1).each do |i|
        hash[str[i..i+1]] += 1
    end

    hash.each do |k, v|
        if v > max
            max = v
            bigram = k
        end
    end

    bigram
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hash = Hash.new(0)

        self.each do |k, v|
            hash[v] = k 
        end

        hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0

        (0...self.length).each do |i|
            (i+1...self.length).each do |j|
                count += 1 if self[i] + self[j] == num
            end
        end

        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        sorted = false

        while !sorted
            sorted = true
            if prc == nil
                (0...self.length - 1).each do |i|
                    if self[i] > self[i + 1]
                        self[i], self[i + 1] = self[i + 1], self[i]
                        sorted = false
                    end
                end
            else 
                (0...self.length - 1).each do |i|
                    if prc.call(self[i], self[i + 1]) == 1
                        self[i], self[i + 1] = self[i + 1], self[i]
                        sorted = false
                    end
                end
            end
        end

        self
    end
end
