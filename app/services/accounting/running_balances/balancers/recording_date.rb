module Accounting
  module RunningBalances
    module Balancers
      class RecordingDate
        attr_reader :recording_date,  :running_balances
        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args={})
          @running_balances = args.fetch(:running_balances)
          @recording_date   = args.fetch(:recording_date)
        end

        def run
          compute
        end

        def compute
          running_balances
            .includes(:entry)
            .where("entries.recording_date" => recording_date)
            .latest
            .balance
        end
      end
    end
  end
end