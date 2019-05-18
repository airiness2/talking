module TalksHelper
    def choose_new_or_edit
        if action_name == 'new' || action_name == 'confirm'
            confirm_talks_path
        elsif action_name == 'edit'
            talk_path
        end
    end
end
