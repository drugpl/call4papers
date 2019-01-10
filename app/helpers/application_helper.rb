module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, space_after_headers: true, fenced_code_blocks: true, no_intra_emphasis: true)
    markdown.render(h(text)).html_safe
  end

  def twitter_link(handle)
    handle = h(handle.to_s.sub(/\A@/, ''))
    link_to(truncate(handle, length: 20), "https://twitter.com/#{handle}") unless handle.blank?
  end

  def github_link(handle)
    handle = h(handle.to_s.sub(/\A@/, ''))
    link_to(truncate(handle, length: 20), "https://github.com/#{handle}") unless handle.blank?
  end

  def gravatar_avatar_url(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def twitter_avatar_url(handle)
    "https://avatars.io/twitter/#{handle}"
  end

  def avatar_url(user, size = 64)
    return twitter_avatar_url(user.twitter_handle) if user.twitter_handle
    gravatar_avatar_url(user, size)
  end

  def vote_button(paper)
    if paper.upvoted_by? current_user
      link_to 'Take upvote', downvote_admin_paper_path(paper), class: 'btn btn-danger', method: :post
    else
      link_to 'Give upvote', upvote_admin_paper_path(paper), class: 'btn btn-success', method: :post
    end
  end
end
