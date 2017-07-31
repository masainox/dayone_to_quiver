require 'spec_helper'

describe DayoneToQuiver::API::DayoneJournalToQuiverNotebook do

  describe '.new' do
    describe 'valid' do
      context 'valid entry file' do
        before do
          @output = 'spec/tmp/api/'
          @options = { output: @output }
          @api = DayoneToQuiver::API::DayoneJournalToQuiverNotebook.new(valid_journal_file_01, @options)
        end

        it { expect(@api.result).to eq '' }

        after do
        end

      end
    end
  end


  describe '#exec' do
    describe 'valid' do
      context 'valid entry file' do
        before do
          @output = 'spec/tmp/api/'
          @name = 'api-quiver-notebook'
          @options = { output: @output, name: @name }

          @api = DayoneToQuiver::API::DayoneJournalToQuiverNotebook.new(valid_journal_file_01, @options)
          @target = @api.exec
          @expect_notebook = @target.instance_variable_get('@notebook')
        end

        it { expect(@target.class).to eq DayoneToQuiver::API::DayoneJournalToQuiverNotebook }
        it { expect(@expect_notebook.class).to eq QuiverToolbox::Notebook }
        it { expect(@expect_notebook.name).to eq @name }

        after do
          FileUtils.rm_rf(@output)
        end

      end
    end
  end

end
