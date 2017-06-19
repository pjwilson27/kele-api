module Checkpoint
    def create_submission(enrollment_id, checkpoint_id, assignment_branch, assignment_commit_link, comment)
        response = self.class.get("/checkpoint_submissions", body: {
            "enrollment_id": enrollment_id,
            "checkpoint_id": checkpoint_id,
            "assignment_branch": assignment_branch,
            "assignment_commit_link": assignment_commit_link,
            "comment": comment
        },
        headers: { "authorization" => @auth_token})
        
        
        JSON.parse(response.body)
    end
end