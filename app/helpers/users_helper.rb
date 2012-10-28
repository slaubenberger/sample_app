module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { :size => 50 })
     #gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
     #gravatar_url = "https://secure.gravatar.com/avatars/#{gravatar_id}.png"
    gravatar_url = "http://www.laubenberger.net/res/img/me.jpg"
    image_tag(gravatar_url, alt: user.name, class: "gravatar", :gravatar => options)
  end
end
