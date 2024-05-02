require 'octokit'

class PagesController < ApplicationController

  def home
    client = Octokit::Client.new
    commit = client.commits('Developer3027/milk').first
    commit_message = commit.commit.message

    @commit_info = commit_message
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
