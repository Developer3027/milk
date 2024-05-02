require 'octokit'

class PagesController < ApplicationController

  def home
    client = Octokit::Client.new( access_token: ENV['PERSONAL_ACCESS_TOKEN'] )
    commit = client.commits('Developer3027/milk').first
    commit_message = commit.commit.message
    commit_date = commit.commit.author.date
    time_zone = 'Eastern Time (US & Canada)'
    formatted_date = commit_date.in_time_zone(time_zone).strftime("%B %d, %Y %H:%M")

    @commit_info = "#{commit_message} - #{formatted_date}"
  end

  def feature
  end

  def erudition
  end

  def hermit
  end

  def salt_and_oak
  end

  def thatch
  end

end
