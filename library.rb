 $LOAD_PATH << '.'
require 'admin'
require 'manage_stu'
require 'student_module'
require 'book_request'

class Library
	puts "-----------------------Library Management System-------------------------"
	while true
		puts "Press 1: Admin"
		puts "Press 2: Student"
		puts "Press 3: Exit"        
		input = gets.chomp
		case input
		when "1"
			puts "Enter password"
			a_pass = gets.chomp.to_i
			if a_pass == 123456
				puts "welcome to admin module\n"
				while true
					puts "-----------------------------Please select any one option----------------------"
					puts "Press 1: To manage books"
					puts "Press 2: To Manage students"
					puts "Press 3: <- back"
					admin_inp = gets.chomp
					case admin_inp
					when "1"
						while true 
							puts "----------------------------------Please select any one option--------------"
							puts "Press a: Add Books"
							puts "Press b: Remove Books"
							puts "Press c: View Available Books"
							puts "Press d: See Issue Books request"
							puts "Press e: Issue Books"
							puts "Press f: Return Books"
							puts "Press z: <- go back"
							user_inp = gets.chomp
							case user_inp
							when "a"
								Admin.add_books			                         
							when "b"					    	  
								Admin.remove_books
							when "c"					    	 
								Admin.view
							when "d"
								puts "--------------------issue book request by students-----------------"
								Book_request.display_request
							when "e"
								puts "book issue" 								
							when "f"
								puts "return books"  
							when "z"					     	 
								break					        	   
							end
						end
					when "2"
						while true
							puts "----------------------Select any one option----------------------"
							puts "Press p: To add Student"
							puts "Press q: To remove Student"
							puts "Press r: To view Student list"
							puts "Press s: To go back"
							inp = gets.chomp
							case inp
							when "p"					    			
								Manage_Student.add_student	
							when "q"					    			
								Manage_Student.remove_Students
							when "r"					    		  
								Manage_Student.view
							when "s"
								break
							end				    			  	
						end	
					when "3"
						break         		  	
					end				
				end  
			else
				puts "invalid password"	          
			end	
	# ---------------------------------------------------------- Student module code--------------------------------------------------------------------------------------
		when "2"
			while true
				puts "------------------------------------------Select any one option----------------------"
				puts "Press 1: login"
				puts "Press 2: Register"
				puts "Press 3: back" 
				s_inp = gets.chomp
				case s_inp
				when "1"
					puts "------------------------------------login here---------------------"
					Student_module.login
				when "2"
					puts "------------------------------------Register yourself------------------------"
					Student_module.register
				when "3"
					break 		     			
				end
			end 
		end
	end	
end