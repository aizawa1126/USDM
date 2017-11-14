class Specification < ApplicationRecord
  belongs_to :project
  has_many :chapters, dependent: :destroy
  validates :title, presence: true, uniqueness: true

  after_initialize :set_default_value_if_nil

  private
  def set_default_value_if_nil
    self.version = 1 if self.version.nil?
  end
end
