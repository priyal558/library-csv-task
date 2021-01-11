 $LOAD_PATH << '.'
# gem 'lolize'
# require 'lolize/auto'
require 'book_request'
$student_arr = []

class Manage_Student  
	def self.add_student						
		puts "Enter the name of Student"
		s_name = gets.chomp

		puts "Enter the Password"
		psw = gets.chomp

		puts "Enter the enrollment number"
		e_no = gets.chomp

		student_name = {
		  Enroll: e_no,
		  Student_Name: s_name,
		  Password: psw		  
		}
		$student_arr.push(student_name)  	
    puts "---------------------Record added successfully-------------------------------"
    $student_arr.each do |hash| 	  
			hash.each do |key,value| 
		  	print( (key.to_s + ': ' + value.to_s)	,"\t")
	    end
	    print("\n")
    end 	
	end

	def self.remove_Students
		view
		puts "enter enrollment number to delete record"					  
		$student_arr.delete_at(e_no.to_i)
		puts "----------------Record deleted successfully-----------------"
	end	

	def self.view
		puts '------------------Student List------------------------'
		$student_arr.each do |hash| 				  
			hash.each do |key,value| 
				print( (key.to_s + ': ' + value.to_s)	,"\t")
			end
		print("\n")	
		end 		
	end
end	
