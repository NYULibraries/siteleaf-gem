libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'siteleaf/version'
require 'siteleaf/client'
require 'siteleaf/entity'
require 'siteleaf/asset'
require 'siteleaf/job'
require 'siteleaf/page'
require 'siteleaf/post'
require 'siteleaf/server'
require 'siteleaf/site'
require 'siteleaf/theme'
require 'siteleaf/user'
require 'rbconfig'
require 'figs'

# Loads up key and secret from the environment variables using figs otherwise it reads from the settings file
module Siteleaf
  @api_base = 'https://api.siteleaf.com/v1'

  class << self
    attr_accessor :api_key, :api_secret, :api_base
  end

  def self.api_url(url = '')
    "#{@api_base}/#{url}"
  end

  def self.settings_file
    File.expand_path('~/.siteleaf')
  end

  def self.load_key_secret(key, secret)
    fail ArgumentError, 'Key and Secret are both required parameters' if key.empty? || secret.empty?
    self.api_key    = key
    self.api_secret = secret
  end

  def self.load_env_vars
    return false unless File.exist?('./Figsfile')
    Figs.load
    load_key_secret(ENV['API_KEY'], ENV['API_SECRET'])
    true
  end

  def self.load_settings
    return if load_env_vars
    return unless File.exist?(settings_file)
    config = Marshal.load(File.open(settings_file))
    load_key_secret(config[:api_key], config[:api_secret]) if config.key?(:api_key) && config.key?(:api_secret)
  end
end
