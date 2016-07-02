class Occasion < ActiveRecord::Base
	belongs_to :reminder
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	OCCASIONS = ['birthday', 'job anniversary', 'holiday', 'just reaching out', 'wedding anniversary']


end