require 'aruba/cucumber'

ENV['RESTY_TMP_CONF_HOME'] = '/tmp/resty-cucumber'
ENV['XDG_CONFIG_HOME']     = ENV['RESTY_TMP_CONF_HOME'] + '/xdg_config_home'
ENV['XDG_DATA_HOME']       = ENV['RESTY_TMP_CONF_HOME'] + '/xdg_data_home'
