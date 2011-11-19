class FancyRenderer < WillPaginate::ActionView::LinkRenderer

  def prepare(collection, options, template)
    @gap_marker = options.delete(:gap)
    super
  end
  
  def visible_page_numbers
    inner_window, outer_window = @options[:inner_window].to_i, @options[:outer_window].to_i
    window_from = current_page - inner_window
    window_to = current_page + inner_window
    
    # adjust lower or upper limit if other is out of bounds
    if window_to > total_pages
      window_from -= window_to - total_pages
      window_to = total_pages
    end
    if window_from < 1
      window_to += 1 - window_from
      window_from = 1
      window_to = total_pages if window_to > total_pages
    end
    
    visible = (1..total_pages).to_a #start with all of them...
    
    left_gap = right_gap = (2 + outer_window)...(total_pages - outer_window)
    visible -= left_gap.to_a if left_gap.last - left_gap.first > 1
    visible -= right_gap.to_a if right_gap.last - right_gap.first > 1

    visible
  end
end
