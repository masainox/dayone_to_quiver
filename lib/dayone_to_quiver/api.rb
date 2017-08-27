
module DayoneToQuiver::API
end


class DayoneToQuiver::API::DayoneEntryToQuiverNote
  attr_reader :result
  def initialize(dayone_file, output_path)
    @input_file = dayone_file
    @output_path = output_path
  end

  def exec
    @entry = ::DayoneToQuiver::DayoneEntry.new(@input_file)
    @note = ::QuiverToolbox::Note.new(@entry.to_quiver_hash)
    @note.notebook_path = @output_path

    @converter = ::DayoneToQuiver::Converter.new(@entry, @note)
    @result = @converter.note.file_name_with_path if @converter.store
    self
  end
end


class DayoneToQuiver::API::DayoneJournalToQuiverNotebook

  attr_reader :result
  def initialize(journal_file, options)
    @input_file = journal_file
    @journal = ::DayoneToolbox::Journal.new(journal_file)
    @notebook = QuiverToolbox::Notebook.new do |n|
      n.name = options[:name]
      n.store_path = options[:output]
    end
    @result = ''
  end


  def exec
    @notebook.store
    @journal.entries.each do |entry|
      entry_obj = ::DayoneToQuiver::DayoneEntry.new(entry)
      note = @notebook.build_note(entry_obj.to_quiver_hash)
      converter = ::DayoneToQuiver::Converter.new(entry_obj, note)

      @result << "#{converter.note.file_name_with_path}\n" if converter.store
    end
    self
  end
end
