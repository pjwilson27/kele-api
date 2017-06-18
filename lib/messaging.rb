module Messaging
    def get_messages(page_number = 0)
        response = self.class.get('/message_threads', headers: { "authorization" => @auth_token })
        
        JSON.parse(response.body).to_a
    end
    
    def create_message
        if message_token
            response = self.class.post('/messages', body: {"sender": sender, "receipient_id": receipient_id, "token": message_token, "subject": subject, "stripped-text": stripped-text })
        else
            response = self.class.post('/message', body: {"sender": sender, "receipient_id": receipient_id, "subject": subject, "stripped-text": stripped-text })
        end
    end
end