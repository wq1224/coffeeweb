class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :creator, :class_name => 'Member', :foreign_key => 'creator_id'
  mount_uploader :image, ImageUploader
  #after_save :abstract_image

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
