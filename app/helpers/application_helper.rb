module ApplicationHelper
    def html_class(user)
        user.dark? ? 'dark' : 'light'
    end
end
