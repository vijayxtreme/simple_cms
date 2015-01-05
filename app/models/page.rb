class Page < ActiveRecord::Base

	belongs_to :subject
	# allows us to have a foreign key that relates to the subject table

	has_and_belongs_to_many :editors, :class_name => "AdminUser"
end
