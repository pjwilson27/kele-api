require 'httparty'
require 'json'

class Kele
    
    include HTTParty
    
    base_uri "https://www.bloc.io/api/v1/"
    
    def initialize(email, password)
        response = self.class.post("/sessions", body: {
            "email": email,
            "password": password
        })
        
        raise 'Incorrect Email or Password...Try again.' if response.code != 200
        
        @auth_token = response["auth_token"]
    end
    
    def get_me
        response = self.class.get('/users/me', headers: { "authorization" => @auth_token })
        
        JSON.parse(response.body)
    end
    
    def get_mentor_availability(mentor_id)
        @mentor_id = mentor_id
        
        response = self.class.get("/mentors/2290632/student_availability", headers: {"authorization" => @auth_token})
        
        JSON.parse(response.body).to_a
    end
    
end