class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  has_attached_file :picture,
                    :styles => {s: "200x>", m: "320x>", l: "750x>", xl: "1280x>"},
                    :default_style => :s,
                    :path => ":rails_root/public/system/:class/:id/:attachment/:style.:extension",
                    :url => "/system/:class/:id/:attachment/:style.:extension",
                    :default_url => "missing"

  validates_attachment :picture, content_type:{
    content_type: /\Aimage\/.*\z/ }, size: { in: 0..3.megabytes
  }
end
