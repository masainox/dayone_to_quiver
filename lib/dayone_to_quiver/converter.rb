
class DayoneToQuiver::Converter

  attr_reader :entry, :note
  def initialize(entry, note)
    @entry = entry
    @note = note
    with_photo if @entry.photo?
  end


  def with_photo
    @note.src_resources = [@entry.photo]
    image_url = File.basename(@note.resources.first['dist'])
    link_str = "![#{image_url}](quiver-image-url/#{image_url})"
    @note.cells.last['data'] << "\n\n #{link_str}"
    self
  end


  def store
    @note.store
  end
end
