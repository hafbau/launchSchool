class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_string)
    @rows = matrix_string.split(/\n/).map { |token| token.split.map(&:to_i) }
    @columns = rows.transpose
  end

  def saddle_points
    rows.each_with_index
        .with_object([]) do |(row, rid), saddle|
          columns.each_with_index {|col, cid| saddle << [rid, cid] if row.max == col.min }
    end
  end
end