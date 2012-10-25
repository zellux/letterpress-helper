class Solver
  class << self
    def search(letters)
      count = letters.scan(/\w/).each_with_object(Hash.new 0 ) { |e, a| a[e] += 1 }
      filtered = WordList.select do |e|
        e.count.all? { |k, v| count[k] >= v }
      end
      filtered.map(&:word).sort_by { |e| -e.length }
    end
  end
end
