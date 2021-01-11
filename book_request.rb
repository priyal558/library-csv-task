$LOAD_PATH << '.'
# gem 'lolize'
# require 'lolize/auto'
require 'admin'
require 'manage_stu'
require 'student_module'

$book_request = []
$issued_books = []
$return_book = []
class Book_request

	def self.issue_request
		puts "------------Select book which you want to issue----------"		
		b_id = gets.chomp.to_i
		$book_arr.each do |hash| 	
				hash.each do |key,value| 					
						if key == :book_id && value == b_id							
									if !hash[:Quantity].nil?
										$book_request.push(b_id)						
										puts "Request sent successfully"
										break
									else
									  puts "Books are not available"						  				
									end	
						end																																	
				end
		end			
	end	

	def self.display_request		
		$book_request.each do |n|				
			puts "#{n}"			
		end	
		puts "------------enter book_id which you want to issue to student----------"		
		b_id = gets.chomp.to_i
		$book_request.each do |n| 			 
			if n == b_id					
				$issued_books.push(b_id)
				$book_request.delete(b_id)
				puts "book issued"
				break						
			else
		   puts "Request not found"
		   break		   
			end	

		end		
	end	 

	def self.return_request
		$book_request.each do |n|				
			puts "#{n}"			
		end	
		b_id = gets.chomp
		$book_request.each do |n| 			
			if n == b_id					
				$return_book.push(b_id)
				puts "Return request sent successfully"										
				break	
			else
		   puts "book not found"	
		   break
			end			
		end	
	end 
end	