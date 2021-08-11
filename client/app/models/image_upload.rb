# frozen_string_literal:true

require Rails.root.join('app', 'gen', 'api', 'image_uploader', 'image_uploader_pb')
require Rails.root.join('app', 'gen', 'api', 'image_uploader', 'image_uploader_services_pb')

class ImageUpload
  include ActiveModel::Model

  def self.chunked_upload(file_path)
    reqs = Enumerator.new do |yielder|
      filename = File.basename(file_path)
      file_meta = Image::Uploader::ImageUploadRequest::FileMeta.new(
        filename: name
      )
      puts "sent name = #{filename}"
      yielder << Image::Uploader::ImageUploadRequest.new(
        file_meta: file_meta
      )

      File.open(file_path, 'r') do |f|
        while(chunk = f.read(100.kilobytes))
          puts "sent #{chunk.size}"
          yielder << Image::Uploader::ImageUploadRequest.new(data: chunk)
        end
      end
    end

    puts 'upload start'
    res = stub.upload(reqs)

    {
      uuid: res.uuid,
      size: res.size,
      content_tupe: res.content_type,
      filename: res.filename
    }
  end

  def self.config_dsn
    '127.0.0.1:50051'
  end

  def self.stub
    Image::Uploader::ImageUploadService::Stub.new(
      config_dsn,
      :this_channel_is_insecure,
      timeout: 1,
    )
  end
end