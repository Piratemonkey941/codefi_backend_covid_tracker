class CLI
    attr_accessor :user

    def initialize
    end
    
    def run
        Scraper.scrape_information
        User.seed
        system('clear')
        login_or_signup
        greeting
        while menu != "exit"
        end
        end_program
    end
 
    def login_or_signup
        response = ''

        while response != 'login' && response != 'signup' 
            puts "Do you want to login or signup? Type 'login' or 'signup'"
            response = gets.chomp.downcase
        end

        if response == 'login'
            login
        else 
            signup
        end
    end

    def signup
        puts " Let's go ahead and signup"
        puts " Enter your username: "
        username = gets.chomp
        puts " Enter your password: "
        password = gets.chomp
        @user = User.new(username, password)
        login
    end
    
 
    
    def login
        authenticated = false
        while authenticated != true
            puts "please login"
            puts "> what is your username"
            username = gets.chomp.downcase
            puts "> what is your password"
            password = gets.chomp
            currentUser = Auth.authenticate_user(User.all, username, password)
            if currentUser
                puts "login successful"
                authenticated = true
                @user = currentUser
                greet_user
            else 
                puts "please try again, login failed"
            end
        end
    end
 
    
    def greeting                                        # Displays a greeting message when the program starts
     puts "Welcome #{@user.username} to the Covid-19 CLI tracker"
    end

    def greet_user                                      # Displays a greeting message when the program starts
     puts "Welcome #{@user.username}"
    end
 
  
 
    
    def menu  # Displays the menu options and gets the user's selection
        
        list_options                                    # Displays the available options
    
        
        puts "Which one do you prefer"                  # Asks the user which option they want to select
        input = gets.chomp
        
        choose_option(input)                            # Calls the choose_option method with the user's selection
        return input 
    end
 
    
    def list_options                                     # Method for displaying the available menu options
        puts "1. USA COVID Information"
        puts "2. USA All States - COVID Confirmed Cases"
        puts "3. USA States, Top 10 Highest"
        puts "4. USA States, Top 10 Lowest"
       
        puts "5. EXIT"
        
    end
 
      
    def choose_option(input)                             # Method for handling the user's menu selection
        case input
        when "1"
            puts "You selected option 1."
            usa = Country.all[0].name
            puts usa.name
            puts "Confirmed Cases: #{usa.confirmed_cases}"
            puts "Overall Deaths: #{usa.overall_deaths}"
            puts "Recoveries: #{usa.recoveries}"

        when "2"
            puts "You selected option 2."
            State.all.each_with_index do |state, i|
                puts "#{i + 1}, #{state.name} confirmed cases: #{state.confirmed_cases}"
            end
           
        when "3"
            puts "You selected option 3."
            State.all[0..9].each_with_index do |state, i|
                puts "#{i + 1}, #{state.name} confirmed cases: #{state.confirmed_cases}"
            end
        when "4"
            puts "You selected option 4."
            states = State.all.sort_by{|state| state.confirmed_cases}
            states[0..9].each_with_index do |state, i|
                puts "#{i + 1}, #{state.name} confirmed cases: #{state.confirmed_cases}"
            end
                            
        when "5"
            puts "Exiting... goodbye!"
            exit
        else
            puts "Invalid selection, please try again."
        end
    end
 
    def end_program                                     # Method that displays a message when the program ends
        puts "program ending, goodbye!"
    end
     
 end