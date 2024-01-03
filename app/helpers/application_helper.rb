module ApplicationHelper

    # adds active class based on specific conditions
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

    # returns full title if present, else returns base title
    def full_title(page_title="")
        base_title = "Grills by Lashe"
        if page_title.blank?
            base_title
        else
            "#{page_title} | #{base_title}"
        end
    end
end
