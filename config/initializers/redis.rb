puts "Setting up Redis Initializer"

Redis.class_eval do
  def self.connect_to_redis!
    uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://localhost:6379")
    puts "REDIS"
    p uri
    $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  end
end

Redis.connect_to_redis!
