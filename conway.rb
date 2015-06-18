#backup
def start(row, col)
  
  
  matrix = Array.new(row){Array.new(col)}
  for i in 0..row-1
    for j in 0..col-1
      temp = rand(0..1)
      if temp == 0
        matrix[i][j] = "X"
        puts "X goes in #{i}, #{j}"
      else 
        matrix[i][j] = ' '
        puts "' ' goes in #{i}, #{j}"
      end
    end
  end


  matrix.each do |var| 
    p var
  end 
  return matrix

end

def draw_matrix(matrix, changes)

  puts "\e[H\e[2J"

  changes.each do |place|
    temp = place.split(" ")

    if matrix[temp[0].to_i][temp[1].to_i] == 'X'
      matrix[temp[0].to_i][temp[1].to_i] = ' '
    elsif matrix[temp[0].to_i][temp[1].to_i] = ' '
      matrix[temp[0].to_i][temp[1].to_i] = 'X'
    end
  end

  matrix.each do |var|
    p var
  end 
  sleep 0.15
  return matrix
end


def check_neighbors (matrix)
  iterations = 0

  loop do  
    x = 0
    y = 0
    tests1 = [[-1, -1],[0, -1], [0, +1], [-1, +1], [-1, 0]]
    tests2 = [[+1, 0],[+1, -1], [+1, +1]]
    neighbors = 0
    changes = []

    matrix.each_with_index do |a, x|
      a.each_with_index do |b, y|
        tests1.each do |var1, var2|
          if matrix[x+var1][y+var2] == 'X'
            neighbors += 1
          end
        end
        if x < a.size-1
          tests2.each do |var1, var2|
            if matrix[x+var1][y+var2] == 'X'
              neighbors += 1
            end
          end
        end
      if matrix[x][y] == ' ' && neighbors == 3
        changes << "#{x} #{y}"
      elsif matrix[x][y] == 'X' && neighbors < 2
        changes << "#{x} #{y}"
      elsif matrix[x][y] == 'X' && neighbors > 3
        changes << "#{x} #{y}"
      end
      neighbors = 0
      end   
    end

    matrix = draw_matrix(matrix, changes)
    iterations += 1
  break if changes.size == 0
end
  puts "You iterated #{iterations} times"

end

print "How many rows? "
x = gets.chomp.to_i
print "How many Columns? "
y = gets.chomp.to_i

matr = start(x, y)
check_neighbors(matr)

