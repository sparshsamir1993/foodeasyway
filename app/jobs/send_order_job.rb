class SendOrderJob < ApplicationJob
  queue_as :default

  Bulksms.config do |c|
    c.username = 'sparshsamir'
    c.password = 'blackdimples.13'
  end

  # single config options
  def perform(*args)
      Bulksms.deliver(:message => 'Hello, I hope you like my message!', :recipient => '918056100208')
  end
end
