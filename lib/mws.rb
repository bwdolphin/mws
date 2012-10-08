autoload :Base64, 'base64'
autoload :OpenSSL, 'openssl'

module Mws

  autoload :Apis, 'mws/apis'
  autoload :Connection, 'mws/connection'
  autoload :Query, 'mws/query'
  autoload :Serializer, 'mws/serializer'
  autoload :Signer, 'mws/signer'
  autoload :Utils, 'mws/utils'

  # The current version of this ruby gem
  VERSION = '0.0.1'

  def self.connect(options)
    Connection.new options
  end

end
