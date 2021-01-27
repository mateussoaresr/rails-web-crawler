class Author
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :author_about, type: String
  validates :name, presence: true, uniqueness: true
  validates :author_about, presence: true

  has_many :quotes
end
