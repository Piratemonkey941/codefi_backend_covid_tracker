class CLI
   def run
    system('clear')
    greeting
    while 
        menu != "exit"
    end
    end_program
   end

   def greeting
    puts "Welcome to the Covid-19 CLI tracker"
   end
   def end_program
    puts "see you next time"
   end

   def menu
    # list options
    list_options

    #asks the user which one do they want
    puts "Which one do you prefer"
    input = gets.chomp
    choose_option(input)
    return input 
   end

   def list_options
    puts "1."
    puts "2."
    puts "3."
    # puts "."
   end

    def choose_option(input)
        case input
        when "1"
            puts "You selected option 1."
        when "2"
            puts "You selected option 2."
        when "3"
            puts "Exiting... goodbye!"
            exit
        else
            puts "Invalid selection, please try again."
        end
    end
end