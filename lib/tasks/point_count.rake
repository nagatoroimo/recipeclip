namespace :point_count do
    task blogs: [:environment] do
        @blog = Blog.all
        @ip = 1

        @blog.each do |blog|
            @day_in_point = DayInPoint.new(
                ip: @ip,
                blog_id: blog.id
            )
            @day_in_point.save
                
            @week_in_point = WeekInPoint.new(
                ip: @ip,
                blog_id: blog.id
            )
            @week_in_point.save
        end
    end
end
