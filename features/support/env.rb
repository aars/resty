require 'aruba/cucumber'

ENV['RESTY_TMP_CONF_HOME'] = '/tmp/resty-cucumber'
ENV['XDG_CONFIG_HOME']     = ENV['RESTY_TMP_CONF_HOME'] + '/xdg_config_home'
ENV['XDG_DATA_HOME']       = ENV['RESTY_TMP_CONF_HOME'] + '/xdg_data_home'

require 'webrick'
class TestAPI
  @resources = {}

  def self.resource(method, path, body, options = {})
    @resources["#{method}:#{path}"] = { body: body, options: options }
  end

  def self.clear
    @resources = {}
  end

  def self.start(port)
    server = WEBrick::HTTPServer.new(
      Port: port,
      Logger: WEBrick::Log.new('/dev/null'),
      AccessLog: [nil, nil]
    )

    server.mount_proc '/' do |req, res|
      resource = @resources["#{req.request_method}:#{req.path}"]

      unless resource
        res.status = 404
      else
        options = resource[:options]

        if options[:status]
          res.status = options[:status]
        end

        if options[:headers]
          options[:headers].split(',').each{|h|
            res[h.split(':')[0].strip] = h.split(':')[1].strip
          }
        end

        res.body = resource[:body]
      end
    end

    Thread.new do
      server.start
    end
  end
end
