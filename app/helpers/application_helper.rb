module ApplicationHelper
    def nav_link_active?(link_name)
        return "active" if controller_name == link_name
    end

    def category_list_page?(link_name)
        return "text-white" if controller_name == link_name
    end

    def category_link_page?(link_name, link_action)
        return "btn btn-dark" if controller_name == link_name && action_name == link_action
    end

    def render_turbo_stream_flash_messages
        turbo_stream.prepend "flash", partial: "layouts/flash"
    end
end
