class StaticPagesController < ApplicationController
  def help
    {
     help_path: '/help',
     help_url: 'http://localhost:3000/help'
    }
  end

  def home
    {
     root_path: '/',
     root_url: 'http://localhost:3000/'
    }
  end

  def about
    {
     about_path: '/about',
     about_url: 'http://localhost:3000/about'
    }
  end

  def links
    {
     links_path: '/links',
     links_url: 'http://localhost:3000/links'
    }
  end

  def contact
    {
     contact_path: '/contact',
     contact_url: 'http://localhost:3000/contact'
    }
  end
end
