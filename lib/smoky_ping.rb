require 'smoky_ping/version'

module SmokyPing
  # Application sets stuff up
  class App
    def initialize
      @db = Store.new
      hosts.each do |host|
        puts "Checking: #{host}"
        Monitor.new(host, @db).call
      end
      puts 'done.'
    end

    private

    def hosts
      ENV.fetch('SMOKY_HOSTS').split(',')
    end
  end

  # Store logs data to influx
  class Store
    require 'influxdb'

    def initialize
      @influx = InfluxDB::Client.new db, host: host, port: port
    end

    def write(hostname, loss, min, avg, max)
      @influx.write_point(
        table,
        values: { min: min, avg: avg, max: max, loss: loss },
        tags: { host: hostname }
      )
    end

    private

    def host
      ENV.fetch('DB_HOST', 'localhost')
    end

    def port
      ENV.fetch('DB_HOST', '8086')
    end

    def db
      ENV.fetch('DB_NAME', `whoami`.strip)
    end

    def table
      ENV.fetch('DB_TABLE', 'smoky_ping')
    end
  end

  # Monitor interacts with fping and stores data
  class Monitor
    require 'net/fping'

    def initialize(host, store)
      @host = host
      @store = store
    end

    attr_reader :host, :store

    def call
      store.write(*data_point)
    end

    def data_point
      [host] + Net::Fping.latency(host, 68, 6, 1000)
    end
  end
end
