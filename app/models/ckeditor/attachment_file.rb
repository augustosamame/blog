class Ckeditor::AttachmentFile < Ckeditor::Asset
  mount_uploader :data, Blog::CkeditorAttachmentFileUploader, mount_on: :data_file_name

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
