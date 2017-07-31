require 'spec_helper'

describe DayoneToQuiver::API::DayoneEntryToQuiverNote do

  describe '.new' do
    describe 'valid' do
      context 'valid entry file' do
        before do
          @path = './spec/tmp/api/'
          @api = DayoneToQuiver::API::DayoneEntryToQuiverNote.new(valid_entry_file_01, @path)
        end

        it { expect(@api.result).to be nil }

        after do
        end

      end
    end
  end


  describe '#exec' do
    describe 'valid' do
      context 'valid entry file' do
        let(:expect_note_file) { './spec/tmp/api/DD950ADE-4D9B-4FFD-8874-8FF825D50C99.qvnote' }

        before do
          @path = './spec/tmp/api/'
          @api = DayoneToQuiver::API::DayoneEntryToQuiverNote.new(valid_entry_file_01, @path)
          @target = @api.exec
          @expect_note = QuiverToolbox::Note.open(expect_note_file)
        end

        it { expect(@target.class).to eq DayoneToQuiver::API::DayoneEntryToQuiverNote }
        it { expect(@target.result).to eq expect_note_file }
        it { expect(@expect_note.class).to eq QuiverToolbox::Note }
        it { expect(@expect_note.meta_json_hash['uuid']).to eq 'DD950ADE-4D9B-4FFD-8874-8FF825D50C99' }
        it { expect(@expect_note.meta_json_hash['title']).to eq 'This is valid file 01.' }
        it { expect(@expect_note.meta_json_hash['tags']).to eq ['test'] }
        it { expect(@expect_note.meta_json_hash['created_at']).to eq 1500049276 }

        after do
          FileUtils.rm_rf(@path)
        end

      end
    end
  end


end
