# class Ckeditor::Asset < ActiveRecord::Base
#   include Ckeditor::Orm::ActiveRecord::AssetBase
#   include Ckeditor::Backend::Paperclip
# end
require 'active_storage'

module Ckeditor
  class Asset < ActiveRecord::Base
    include Ckeditor::Orm::ActiveRecord::AssetBase
    include Ckeditor::ActiveStorage
  end
end