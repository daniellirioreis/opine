class Proposal < ActiveRecord::Base
  belongs_to :user
  validates :name, :type_proposal, :description, :user_id, presence: true

  has_enumeration_for :type_proposal

  def to_s
    name
  end
end
