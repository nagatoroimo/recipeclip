module ErrorMessageHelper
    def post_error_message(attribute)
        @post.errors[attribute].map{|error|"<p class=\"error_message\">" + error + "</p>"}.join("<br>").html_safe
    end

    def temp_error_message(attribute)
        @temp.errors[attribute].map{|error|"<p class=\"error_message\">" + error + "</p>"}.join("<br>").html_safe
    end
    
    def category_error_message(attribute)
        @category.errors[attribute].map{|error|"<p class=\"error_message\">" + error + "</p>"}.join("<br>").html_safe
    end
    
    def time_error_message(attribute)
        @time.errors[attribute].map{|error|"<p class=\"error_message\">" + error + "</p>"}.join("<br>").html_safe
    end
    
    def material_error_message(attribute)
        @material.errors[attribute].map{|error|"<p class=\"error_message\">" + error + "</p>"}.join("<br>").html_safe
    end
    
    def step_error_message(attribute)
        @step.errors[attribute].map{|error|"<p class=\"error_message\">" + error + "</p>"}.join("<br>").html_safe
    end

    def blog_error_message(attribute)
        @blog.errors[attribute].map{|error|"<p class=\"error_message\">" + error + "</p>"}.join("<br>").html_safe
    end
end
