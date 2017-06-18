require 'httparty'

class Kele
    
    include HTTParty
    
    def initialize(email, password)
        response = self.class.post('https://www.bloc.io/api/v1/', body: {
            "email": email,
            "password": password
        })
        
        raise 'Incorrect Email or Password...Try again.' if response.code != 200
        
        @auth_token = response["auth_token"]
    end
    
end