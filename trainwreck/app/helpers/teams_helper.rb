module TeamsHelper

  #Returns the team view title on a per-page basis.
  def baseteam_title(page_title = '')
    base_title = "Team view of "
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
