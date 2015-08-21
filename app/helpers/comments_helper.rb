module CommentsHelper
  def date_commented(comment)
    d = comment.created_at
    suffix = case d.day % 10
               when 1 then 'st'
               when 2 then 'nd'
               when 3 then 'rd'
               else 'th'
             end
    format = "on %B %-d#{suffix}, %Y"
    d.strftime(format)
  end
end
