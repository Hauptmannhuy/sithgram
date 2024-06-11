module FileTypeValidator
  extend ActiveSupport::Concern

  included do
    validate :file_type
    
  def file_type
    return unless (self.respond_to?(:image) && self.image.attached?) || (self.respond_to?(:avatar) && self.avatar.attached?)
    object = self.respond_to?(:image) ? self.image : self.avatar 

    allowed_types = %w(image/jpeg image/png image/gif)
    unless object.content_type.in?(allowed_types)
      self.errors.add(:image, 'Your file must be an image type!')
    end
  end

  end
end
