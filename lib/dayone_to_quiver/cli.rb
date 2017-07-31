
require 'thor'

class DayoneToQuiver::CLI < Thor
  class << self
    def exit_on_failure?
      true
    end
  end

  attr_reader :api

  desc "entry DAYONE_ENTRY_FILE [OPTIONS]", "Convert Day one entry file to Quiver note file"
  option :output, :default => './', :aliases => :o
  def entry(input)
    @api = ::DayoneToQuiver::API::DayoneEntryToQuiverNote.new(input, options[:output])
    @api.exec
    puts @api.result
    self
  end


  desc "journal DAYONE_JOURNAL_FILE [OPTIONS]", "Convert Day one journal file to Quiver notebook file"
  option :output, :default => './', :aliases => :o
  option :name, :default => 'dayone-to-quiver', :aliases => :n
  def journal(input)
    @api = ::DayoneToQuiver::API::DayoneJournalToQuiverNotebook.new(input, options)
    @api.exec
    puts @api.result
    self
  end
end
