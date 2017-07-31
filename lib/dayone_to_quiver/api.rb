
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
    @result = @note.file_name_with_path if @note.store
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
      note = @notebook.build_note(::DayoneToQuiver::DayoneEntry.new(entry).to_quiver_hash)
      @result << "#{note.file_name_with_path}\n" if note.store
    end
    self
  end
end
