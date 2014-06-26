module MainsHelper
  def mains_tree_for(mains)
    mains.map do |first,nested|
      render(first) + (nested.size > 0 ? content_tag(:div, mains_tree_for(nested), class: "replies") : nil)
    end.join.html_safe
  end
end
