class Quote
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :author, type: String
  field :about, type: String

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true, uniqueness: true

  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  def tag_names
    tags.pluck(:name)
  end
end
