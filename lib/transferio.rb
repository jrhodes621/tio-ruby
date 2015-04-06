require 'transferio/config'
require 'transferio/transactions'
require 'rest_client'

module TransferIO
  class << self
    include TransferIO::Configure

    def transactions
      @transactions = TransferIO::Transactions.new
    end

  end
end
