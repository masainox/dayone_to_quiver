require 'spec_helper'

describe DayoneToQuiver::Converter do
  Timecop.freeze('2017-07-10')

  describe ".new" do
    context 'valid' do
      context 'valid entry file 01' do

        before do
          @entry = ::DayoneToQuiver::DayoneEntry.new(valid_entry_file_01)
          @note = :: QuiverToolbox::Note.new(@entry.to_quiver_hash)
          @target = DayoneToQuiver::Converter.new(@entry, @note)
        end

        it { expect(@target.class).to eq DayoneToQuiver::Converter }
        it { expect(@target.entry.class).to eq DayoneToQuiver::DayoneEntry }
        it { expect(@target.note.class).to eq ::QuiverToolbox::Note }

      end
    end
  end


  describe "#with_photo" do
    context 'valid' do
      context 'valid entry file 07' do

        before do
          @entry = ::DayoneToQuiver::DayoneEntry.new(valid_entry_file_07)
          @note = :: QuiverToolbox::Note.new(@entry.to_quiver_hash)
          @target = DayoneToQuiver::Converter.new(@entry, @note)
        end

        it { expect(@target.entry.photo?).to be true }
        it { expect(@target.note.resources.size).to eq 1 }

      end
    end
  end


end
