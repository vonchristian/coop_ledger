module Accounting
  module Balances
    module Balancers
      class Default
        attr_reader :amounts

        def self.execute(args = {})
          obj = new(args)
          obj.run
        end

        def initialize(args = {})
          @amounts = args.fetch(:amounts)
        end

        def run
          compute
        end

        def compute
          amounts.total
        end
      end
    end
  end
end
