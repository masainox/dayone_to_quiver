require 'spec_helper'

describe DayoneToQuiver::DayoneEntry do
  Timecop.freeze('2017-07-10')

  describe ".to_quiver_uuid" do
    context 'valid' do
      context 'valid params' do
        before { @target = DayoneToQuiver::DayoneEntry }
        it { expect(@target.to_quiver_uuid('DD950ADE4D9B4FFD88748FF825D50C99')).to eq 'DD950ADE-4D9B-4FFD-8874-8FF825D50C99' }
      end
    end
  end


  describe ".to_quiver_title" do
    context 'valid' do
      context 'valid params' do
        before do
          @text1 = "Test1\nTest2\nTest3"
          @text2 = "Test1\n\nTest2\n\nTest3"
          @text3 = "Test1 \n\nTest2 \n\nTest3"
          @text4 = "Test1"
          @target = DayoneToQuiver::DayoneEntry
        end

        it { expect(@target.to_quiver_title(@text1)).to eq 'Test1' }
        it { expect(@target.to_quiver_title(@text2)).to eq 'Test1' }
        it { expect(@target.to_quiver_title(@text3)).to eq 'Test1 ' }
        it { expect(@target.to_quiver_title(@text4)).to eq 'Test1' }
      end
    end
  end


  describe ".to_quiver_unixtime" do
    context 'valid' do
      context 'valid params' do
        before do
          @time1 = DateTime.now
          @target = DayoneToQuiver::DayoneEntry
        end

        it { expect(@target.to_quiver_unixtime(@time1).class).to eq Fixnum }
        it { expect(@target.to_quiver_unixtime(@time1)).to eq 1499612400 }
      end
    end
  end



  describe ".new" do
    context 'valid' do
      context 'valid entry file 01' do

        before do
          @entry = DayoneToQuiver::DayoneEntry.new(valid_entry_file_01)
        end

        let(:expect_cells) do
          [{
            'type' => 'markdown',
            'data' => 'This is valid file 01.'
          }]
        end

        it { expect(@entry.class).to eq DayoneToQuiver::DayoneEntry }
        it { expect(@entry.q_uuid).to eq 'DD950ADE-4D9B-4FFD-8874-8FF825D50C99' }
        it { expect(@entry.q_tags.size).to eq 1 }
        it { expect(@entry.q_tags[0]).to eq 'test' }
        it { expect(@entry.q_title).to eq 'This is valid file 01.' }
        it { expect(@entry.q_created_at).to eq 1500049276 }
        it { expect(@entry.q_updated_at).to eq 1500049276 }
        it { expect(@entry.q_cells).to eq expect_cells }

        after do
        end

      end
    end
  end


  describe "#to_quiver_hash" do
    context 'valid' do
      context 'valid entry file 01' do

        before do
          @entry = DayoneToQuiver::DayoneEntry.new(valid_entry_file_01)
          @target = @entry.to_quiver_hash
        end

        let(:expect_cells) do
          [{
            'type' => 'markdown',
            'data' => 'This is valid file 01.'
          }]
        end

        it { expect(@target.class).to eq Hash }
        it { expect(@target['uuid']).to eq 'DD950ADE-4D9B-4FFD-8874-8FF825D50C99' }
        it { expect(@target['tags'].size).to eq 1 }
        it { expect(@target['tags'][0]).to eq 'test' }
        it { expect(@target['title']).to eq 'This is valid file 01.' }
        it { expect(@target['created_at']).to eq 1500049276 }
        it { expect(@target['updated_at']).to eq 1500049276 }
        it { expect(@target['cells'].size).to eq 1 }
        it { expect(@target['cells']).to eq expect_cells }

        after do
        end

      end
    end
  end


end
