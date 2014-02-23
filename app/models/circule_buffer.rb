class CircleBuffer
  def initialize(size, data=[])
    @size = size
    @data = data
  end

  def unshift(element)
    @data = [element, *@data][0, @size]
    self
  end

  def each
    @data.each do |element|
      yield element
    end
  end

  def to_a; @data; end
end
