require 'git'

class PagesController < ApplicationController

  def home
    git_log = Git.open(Rails.root).log.first
    commit_message = git_log.message
    author_name = git_log.author.name
    author_date = git_log.author.date.strftime('%Y-%m-%d %H:%M:%S')

    @commit_info = "#{commit_message} - #{author_name}, #{author_date}"
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
