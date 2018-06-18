# class Ckeditor::Picture < Ckeditor::Asset
#   has_attached_file :data,
#                     url: '/ckeditor_assets/pictures/:id/:style_:basename.:extension',
#                     path: ':rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension',
#                     styles: { content: '800>', thumb: '118x100#' }

#   validates_attachment_presence :data
#   validates_attachment_size :data, less_than: 2.megabytes
#   validates_attachment_content_type :data, content_type: /\Aimage/

#   def url_content
#     url(:content)
#   end
# end

module Ckeditor
  class Picture < Asset
    include Rails.application.routes.url_helpers

    has_one_attached :data

    def url_content
      rails_blob_url(blob)
    end

    class << self
      def default_url_options
        Rails.application.config.action_mailer.default_url_options
      end
    end
  end
end