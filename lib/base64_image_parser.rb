#encoding: utf-8
#ੴ

module Base64ImageParser  
  module ClassMethods
    def files
      @files
    end

    def uploader
      @uploader
    end

    # assumes a post persisted to db
    def parse(image_node)
        if image_node.attributes["data-filename"].present?
          filename = image_node.attributes["data-filename"].value
          encoded_data = image_node.attributes["src"].value

          encoded_data[/base64,(.*)/]
          encoded_data = $1
          if encoded_data.present?
            begin
              decoded_data = Base64.decode64(encoded_data)
              #base_dir = ENV.fetch('FILE_STORE_DIR', "uploads")
              #if base_dir != "uploads"
              #  public_uploads = File.join(Rails.root, "public", "uploads")
              #  FileUtils.symlink(base_dir, public_uploads) unless File.symlink?(public_uploads)
              #  base_dir = public_uploads
              #end
              #dir = "#{base_dir}/#{Rails.env}/"
              #FileUtils::mkdir_p dir
              #tempfile = File.open(dir + filename, 'wb')
              tempfile = Tempfile.new([filename.gsub(File.extname(filename), ""), File.extname(filename)])
              tempfile.binmode
              
              tempfile.write(decoded_data)
              tempfile.rewind
              image_node["data-filename"] = filename
              image_node["src"] = yield filename, tempfile
            ensure
              tempfile.unlink
              tempfile.close
            end
          else          
            yield image_node.attributes["data-filename"].value, nil
          end
        end
    end
  end    
  self.extend(ClassMethods)
end