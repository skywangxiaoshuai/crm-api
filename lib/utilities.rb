module Utilities

  # Adapt to base64 image
 def adapt_to_base64(data)
   image = Paperclip.io_adapters.for(data)
   image.original_filename = 'file' + Rack::Mime::MIME_TYPES.invert[data[/[-\w]+\/[-\w\+\.]+/]]
   image
 end
end
