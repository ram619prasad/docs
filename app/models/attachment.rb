class Attachment < ActiveRecord::Base

	# Paperclip helper for attaching media
	has_attached_file :media

	# Associations
	belongs_to :user

	# Valid content_types (file types which are allowed)
	DOCUMENT = [ "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        "application/vnd.oasis.opendocument.text", "application/doc",
        "application/vnd.openxmlformats-officedocument.wordprocessingml.", "application/vnd.ms-office", "application/zip", "application/gzip", 'application/x-7z-compressed']
  FLASH = ["application/x-shockwave-flash"]
  PDF = ["application/pdf"]
  SLIDESHOW = ["application/powerpoint", "application/presentation", "application/slideshow",
        "application/vnd.oasis.opendocument.presentation", "application/vnd.ms-powerpoint",
        "application/vnd.openxmlformats-officedocument.presentationml.presentation", "application/vnd.openxmlformats-officedocument.presentationml.pr"]
  FLV = ["application/x-flash-video", "video/flv", "video/x-flv"]
  AUDIO = ["audio/basic", "audio/mp4", "audio/mpeg", "audio/ogg", "audio/vorbis", "audio/x-ms-wma", "audio/x-ms-wax",
        "audio/vnd.wave", "audio/MP4A-LATM", "audio/mp4a-latm", "video/3gpp"]
  VIDEO = ["video/mpeg", "video/mp4", "video/ogg", "video/quicktime", "video/webm", "video/x-ms-wmv", "video/x-ms-asf",
        "application/mpeg", "application/mp4", "application/ogg", "application/quicktime", "application/webm", "application/x-ms-wmv"]
  IMAGE = ["image/gif", "image/jpeg", "image/png", "image/x-png", "image/pjpeg"]
  SPREADSHEET = ["application/vnd.oasis.opendocument.spreadsheet", "application/vnd.ms-excel",
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.openxmlformats-officedocument.spreadsheetml.she"]

  valid_content_types = [DOCUMENT, FLASH, PDF, SLIDESHOW, FLV, AUDIO, VIDEO, IMAGE, SPREADSHEET].flatten

	# Validations
	validates_attachment :media, presence: true, 
															 content_type: { content_type: valid_content_types },
  														 size: { in: 0..100.megabytes }
end
