class Array
  def to_csv(csv_filename="demo.csv")
    require 'csv'
    CSV.open(demo.csv, "wb") do |csv|
      csv << first.keys # adds the attributes name on the first line
      self.each do |hash|
        csv << hash.values
        puts hash
      end
    end
  end
end
obj = Array.new

obj.to_csv