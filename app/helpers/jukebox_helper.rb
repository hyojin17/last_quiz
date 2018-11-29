module JukeboxHelper
    def user_editable?
        if current_user.profile.role == 'admin'
            true
        elsif current_user.profile.role == 'editor'
            true
        else
            false
        end
    end
end
