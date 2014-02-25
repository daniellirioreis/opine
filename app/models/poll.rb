class Poll < ActiveRecord::Base
  belongs_to :proposal

  has_many :poll_users

  has_enumeration_for :status_poll

  validates :proposal_id, :status_poll, presence: true
  validates :proposal_id,  uniqueness: true

  delegate :user, :description, :name, to: :proposal

  def to_s
  "#{created_at.day}/#{created_at.month}/#{created_at.year} -  #{proposal}"
  end

  def amount_of_approvals
    poll_users.find_all_by_status(0).count

  end

  def amount_of_not_approvals
    poll_users.find_all_by_status(1).count
  end

  def like(user_id)
    pu = poll_users.find_by_user_id(user_id)
    if pu.present?
      pu.update_attribute(:status, 0 )
    else
      pu = PollUser.new(:poll_id => id, :user_id => user_id, :status => 1)
      pu.save
    end
  end

  def unlike(user_id)
    pu = poll_users.find_by_user_id(user_id)
    if pu.present?
      pu.update_attribute(:status, 1)
    else
      pu = PollUser.new(:poll_id => id, :user_id => user_id, :status => 1)
      pu.save
    end
  end

end
