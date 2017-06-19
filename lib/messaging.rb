module Messaging
    def get_messages(page_number)
        if page_number >= 0
            response = self.class.get('/message_threads', body: { "page": "#{page_number}" }, headers: { "authorization" => @auth_token })
        else page_number <=0 || nil
            response = self.class.get('/message_threads', headers: {"authorization" => @auth_token })
        end
        
        JSON.parse(response.body).to_a
    end
    
    def create_message(user_id, receipient_id, subject, stripped)
        response = self.class.post("/messages", body: {
            "user_id": user_id, 
            "receipient_id": receipient_id,
            "subject": subject, 
            "stripped": stripped
            
        },
        
        headers: {"authorization" => @auth_token })
    end
end