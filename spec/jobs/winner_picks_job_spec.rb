require 'rails_helper'

describe WinnerPicksJob, type: :job do
  let(:winner) { create(:winner, status: :winner) }
  let!(:picks) { create_list(:pick, 2, team: winner.team) }

  it 'uses the default queue' do
    ActiveJob::Base.queue_adapter = :test
    expect { WinnerPicksJob.perform_later(winner) }
      .to have_enqueued_job(WinnerPicksJob).on_queue('default')
  end

  describe '#perform' do
    before do
      allow(Pick).to receive(:where).and_return(Pick.all)
    end

    it 'finds picks and updates them' do
      expect(picks.map(&:status)).to eq([nil, nil])
      WinnerPicksJob.perform_now(winner)

      picks.each(&:reload)
      expect(picks.map(&:status)).to eq(["winner", "winner"])
    end
  end
end
