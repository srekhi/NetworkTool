class Reminder < ActiveRecord::Base
	belongs_to :contact
	has_many :occasions
	default_scope -> { order(created_at: :desc) }
	validates :contact_id, presence: true
	OCCASIONS = ['birthday', 'job anniversary', 'holiday', 'just reaching out', 'wedding anniversary']


end
