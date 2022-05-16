class Advertisement < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  include PgSearch::Model
  pg_search_scope :search_by_adv, against: [:text],
                                  using: {
                                    tsearch: {
                                      prefix: true,
                                      highlight: {
                                        start_sel: '<b>',
                                        stop_sel: '</b>'
                                      }
                                    }
                                  }

end
