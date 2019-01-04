require "./handler"

module HTTPMethodEmulator
  VERSION = "0.1.0"

  def self.config(&block)
    yield Hanlder::INSTANCE
  end
end
