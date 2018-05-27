module MemoryHelper
  include CloudinaryHelper

  def thumb_background(uploader)
    "background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), url(\"#{image_path uploader.url(:thumb)}\");background-size: cover;"
  end
end
