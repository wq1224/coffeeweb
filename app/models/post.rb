class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :creator, :class_name => 'Member', :foreign_key => 'creator_id'
  mount_uploader :image, ImageUploader
  #after_save :abstract_image
  POST_STATUS_DRAFT = :post_status_draft
  POST_STATUS_PUBLISH = :post_status_publish
  enum status: [
    POST_STATUS_DRAFT,
    POST_STATUS_PUBLISH
  ]
  validates :title, presence: true
  validates :category_id, presence: true
  validates :status, presence: true
  
  def abstract_image
    html_doc = Nokogiri::HTML::DocumentFragment.parse(content)
    if img = html_doc.css('img').first
      Base64ImageParser.parse(img) do |*args|
        filename, file = args

        if file.present?
          self.image = file
          self.save!
        else                
          self.update_column :image, filename
        end
      end
    end
  end
  private :abstract_image #AR callback
end
