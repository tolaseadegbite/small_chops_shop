module ApplicationHelper
    def nav_link_active?(link_name)
        return "active" if controller_name == link_name
    end

    def category_list_page?(link_name)
        return "text-white" if controller_name == link_name
    end
end
