# Blog Post model sets up table in database
# This logic used when creating record in the database
class BlogPost < ApplicationRecord
  # A article can have a cover image
  has_one_attached :cover_image
  # link the article to a user
  belongs_to :user
  # Article needs to be changed to admin instead of user
  # belongs_to :admin
  belongs_to :category
  # set up rich text for the article
  has_rich_text :content

  # validates that these attributes are present
  validates :title, presence: true
  validates :content, presence: true
  validates :category_id, presence: true

  # set up scopes for sorted, scheduled, published, and draft
  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  # helper methods for schduled, published, and draft, even memory
  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end
