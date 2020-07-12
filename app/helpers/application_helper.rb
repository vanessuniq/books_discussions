module ApplicationHelper
    def page_title(title='')
        base = 'Book Caffe'
        if title.empty?
            base
        else
           title + ' | ' + base 
        end
    end
end
