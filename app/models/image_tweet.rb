class ImageTweet < ActiveRecord::Base
	has_many :tweets, as: :content
	has_attached_file :image, 
										styles: {
											thumb: '100x100>'
										}, 
										:storage => :s3,
										:s3_protocol => 'https',
									  :s3_credentials => {
									    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
									    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
									  },
									  :bucket => ENV['S3_BUCKET_NAME']

	def index
		self.image_file_name
	end
end
