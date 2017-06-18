module Messaging
    def get_messages(page_number)
        if page_number >= 0
            response = self.class.get('/message_threads', body: { "page": "#{page_number}" }, headers: { "authorization" => @auth_token })
        else page_number <=0 || nil
            response = self.class.get('/message_threads', headers: {"authorization" => @auth_token })
        end
        
        JSON.parse(response.body).to_a
    end
    
    def create_message(sender, receipient_id, token, subject, stripped)
        response = self.class.post('/messages', body: {
            "sender": sender, 
            "receipient_id": receipient_id, 
            "token": token, 
            "subject": subject, 
            "stripped-text": stripped
            
        },
        
        headers: {"authorization" => @auth_token })
    end
end