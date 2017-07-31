
class DayoneToQuiver::DayoneEntry < DayoneToolbox::Entry

  def self.to_quiver_uuid(entry_uuid)
    new_uuid = entry_uuid.dup
    new_uuid.insert(-25, '-').insert(-21, '-').insert(-17, '-').insert(-13, '-')
    new_uuid
  end


  def self.to_quiver_title(entry_text)
    entry_text.each_line {|l| return l.chomp }
  end


  def self.to_quiver_unixtime(time)
    Time.parse("#{time}").to_i
  end


  def q_tags
    tags
  end


  def q_title
    self.class.to_quiver_title(entry_text)
  end


  def q_uuid
    self.class.to_quiver_uuid(uuid)
  end


  def q_created_at
    self.class.to_quiver_unixtime(creation_date)
  end


  def q_updated_at
    q_created_at
  end


  def q_cells(type='markdown')
    [{
      'type' => type,
      'data' => entry_text
    }]
  end


  def to_quiver_hash
    {
      ::QuiverToolbox::Note::KEY_CREATED_AT => q_created_at,
      ::QuiverToolbox::Note::KEY_TAGS => q_tags,
      ::QuiverToolbox::Note::KEY_TITLE => q_title,
      ::QuiverToolbox::Note::KEY_UPDATED_AT => q_updated_at,
      ::QuiverToolbox::Note::KEY_UUID => q_uuid,
      ::QuiverToolbox::Note::KEY_CELLS => q_cells
    }
  end

end
