class Quote
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String

  validates :title, presence: true, uniqueness: true

  belongs_to :author
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :author

  delegate :name, to: :author, prefix: true
  delegate :author_about, to: :author

  def tag_names
    tags.pluck(:name)
  end
end
