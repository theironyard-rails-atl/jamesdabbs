class Counter
  def initialize corpus
    @corpus = corpus
  end

  def counts separator
    result = {}
    @corpus.split(separator).each do |token|
      result[token] ||= 0
      result[token]  += 1
    end
    result
  end
end
