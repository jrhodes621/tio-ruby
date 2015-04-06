Gem::Specification.new do |s|
  s.name        = 'transferio'
  s.version     = '0.1.0'
  s.date        = '2015-04-02'
  s.summary     = "TransferIO api gem"
  s.description = "A simple to use ruby wrapper for TransferIO API."
  s.authors     = ["James Rhodes"]
  s.email       = 'james@somehero.com'
  s.files       = ["lib/transferio.rb", "lib/transferio/config.rb", "lib/transferio/transactions.rb"]
  s.homepage    =
    'https://github.com/jrhodes621/transferio'
  s.license       = 'MIT'
  s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "json"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
