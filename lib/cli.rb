class CLI
    attr_accessor :user                 # creating accessor for the user variable

    def initialize
    end
    
    def run
        Scraper.scrape_information  #scrape information
        User.seed                   # seed user data
        system('clear')             # clear terminal
        login_or_signup             # login or signup
        greeting                    # greeting the user
        while menu != "exit"        # while menu not equal to exit
        end
        end_program                 # end the program
    end
 
    def login_or_signup
        response = ''

        while response != 'login' && response != 'signup'                       # while response not equal login and signup
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
        puts " Let's go ahead and signup"       # Prompts the user to sign up
        puts " Enter your username: "           # Asks the user to enter a username
        username = gets.chomp                   # Asks the user to enter a password
        puts " Enter your password: "
        password = gets.chomp                   # creating new user
        @user = User.new(username, password)    # Creates a new user with the provided username and password
        login                                   # calling the login method after the signup process
    end
    
 
    
    def login
        authenticated = false
        while authenticated != true
            puts "please login"
            puts "> what is your username"
            username = gets.chomp.downcase
            puts "> what is your password"
            password = gets.chomp                                                   # authenticating user
            currentUser = Auth.authenticate_user(User.all, username, password)      # authenticating user using the Auth module and passing the all users, username, and password
            if currentUser
                puts "login successful"
                authenticated = true
                @user = currentUser                                                 # setting the user variable to the authenticated user
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
 
  
 
    
    def menu                                            # Displays the menu options and gets the user's selection       
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
 
      
    def choose_option(input)                                                                # Method for handling the user's menu selection
        case input
        when "1"                                                                            # option 1: display the data of the first country in the Country.all array
            puts "You selected option 1."
            usa = Country.all[0].name
            puts usa.name
            puts "Confirmed Cases: #{usa.confirmed_cases}"
            puts "Overall Deaths: #{usa.overall_deaths}"
            puts "Recoveries: #{usa.recoveries}"

        when "2"                                                                            # option 2: display the data of the states with index and confirmed cases     
            puts "You selected option 2."
            State.all.each_with_index do |state, i|
                puts "#{i + 1}, #{state.name} confirmed cases: #{state.confirmed_cases}"
            end
           
        when "3"                                                                            # option 3: display the data of the states with index and confirmed cases
            puts "You selected option 3."
            State.all[0..9].each_with_index do |state, i|
                puts "#{i + 1}, #{state.name} confirmed cases: #{state.confirmed_cases}"
            end
        when "4"
            puts "You selected option 4."                                                   # option 4: sort the states by confirmed cases and display the top 10
            states = State.all.sort_by{|state| state.confirmed_cases}
            states[0..9].each_with_index do |state, i|
                puts "#{i + 1}, #{state.name} confirmed cases: #{state.confirmed_cases}"
            end
                            
        when "5"                                                                            # option 5: exit the program
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