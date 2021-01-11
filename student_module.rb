 $LOAD_PATH << '.'
require 'admin'
require 'book_request'

class Student_module
	
	def self.register			
		puts "Enter Your Full Name"
		s_name = gets.chomp

		puts "Enter the Password"
		psw = gets.chomp
		enroll, header = fetch_enroll		
		student = {
			Enroll: enroll,
			Student_Name: s_name,
			Password: psw  
		}
		CSV.open("student_list.csv", "ab") do |csv|  
      csv << ['Enroll number', 'Name', 'Password'] if header
      csv << student.map { |key, value| value }                 
    end 
		puts "---------------------Registeration successful-------------------------------"
		puts student
	end

	def self.fetch_enroll
    table = CSV.parse(File.read("student_list.csv"), headers: true)
    return table.length + 1, table.headers.empty?
  end

	def self.login	
		puts "enter the enroll number"
		e_no = gets.chomp.to_i				
		puts "enter the Password"
		password = gets.chomp

		table = CSV.parse(File.read("student_list.csv"), headers: true)
    table.each_with_index do |data, index|     	
			if index == e_no-1 && table[index]["Password"] == password			  		
				puts "----------------------login successful------------------------"
    		while true
					puts "Press 1: To see available books"
					puts "Press 2: Request to issue book"
					puts "Press 3: Request to return book"
					puts "Press 4: exit"
					s_inp = gets.chomp
					case s_inp
						when "1"								
							Admin.view
						when "2"
							Admin.view
							Book_request.issue_request																	  
						when "3"
							puts "------------Generate return request------------"
							Book_request.return_request
						when "4"
						  break	    		    	
					end		    			    	
  	    end					
  		else
  			puts "First register yourself"''
  			break	    	
  		end #enroll if			  	
	  end		  
	end #method ending	
end   