require 'spec_helper'

describe DayoneToQuiver::CLI do


  describe '.exit_on_failure?' do
    context 'valid file' do
      it do
        expect(DayoneToQuiver::CLI.exit_on_failure?).to be true
      end
    end
  end


  describe "#entry" do
    context 'valid' do
      context 'valid file' do
        before do
          @output = 'spec/tmp/cli/'
          @options = { output: @output }
          @target = DayoneToQuiver::CLI.new.invoke(:entry, [valid_entry_file_01], @options)
        end

        it { expect(@target.class).to eq DayoneToQuiver::CLI }
        it { expect(@target.api.class).to eq DayoneToQuiver::API::DayoneEntryToQuiverNote }

        after do
          FileUtils.rm_rf(@output)
        end

      end
    end
  end


  describe "#journal" do
    context 'valid' do
      context 'valid file' do
        before do
          @output = 'spec/tmp/cli/'
          @name = 'quiver_name'
          @options = { output: @output, name: @name }
          @target = DayoneToQuiver::CLI.new.invoke(:journal, [valid_journal_file_01], @options)
        end

        it { expect(@target.class).to eq DayoneToQuiver::CLI }
        it { expect(@target.api.class).to eq DayoneToQuiver::API::DayoneJournalToQuiverNotebook }

        after do
          FileUtils.rm_rf(@output)
        end

      end
    end
  end


end
