$LOAD_PATH << '.'
require 'csv'
require 'byebug'
require 'book_request'
$data = []
class Admin   
  def self.add_books         
    puts "Enter the name of book"
    book_name = gets.chomp
    puts "Enter the quantity of books"
    quantity = gets.chomp
    id, header = fetch_book_id
    book = {
        book_id: id,
        Name: book_name.to_s,
        Quantity: quantity.to_i         
    }        
    CSV.open("demo.csv", "ab") do |csv|  
      csv << ['Book id', 'Name', 'Quantity'] if header
      csv << book.map { |key, value| value }                 
    end 
    puts "---------------------Record added successfully-------------------------------"
       puts book  
  end

  def self.fetch_book_id
    table = CSV.parse(File.read("demo.csv"), headers: true)
    return table.length + 1, table.headers.empty?
  end

  def self.remove_books       
    view
    puts "enter book_id to delete record" 
    ind = gets.chomp.to_i 
    table = CSV.parse(File.read("demo.csv"), headers: true)
    table.each_with_index do |data, index|     
      if index == ind
        table.delete(ind)        
        File.open("demo.csv", 'w') do |f|
          f.write(table.to_csv)
          puts "Record deleted successfully" 
        end
      end
    end            
  end 

  def self.view
    puts '------------------Available Book------------------------'
    $data = CSV.read("demo.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})
    puts "Book id      Name    Quantity"
      $data.each do |hash|              
        print hash          
      end  
  end          #-----------------------------end of method-------------------------------
end 