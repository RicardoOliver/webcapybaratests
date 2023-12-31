# Importa as gems
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'faker'
require 'ostruct'
require 'site_prism'
require_relative 'page_helper.rb'
require_relative 'helper.rb'

# Coloca as variaveis como global
World(Pages)
World(Helper)

# Variavel para o nome do ambiente
AMBIENTE = ENV['AMBIENTE']
# Variavel para o nome do browser
BROWSER = ENV['BROWSER']
# Configuracao para dizer o caminho do ambiente a se usar
CONFIG = YAML.load_file(File
  .dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")

# Configura o tipo de browser
Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome')
    option = ::Selenium::WebDriver::Chrome::Options.new(
      args: ['--start-fullscreen', '--disable-infobars']
    )
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: option)
  elsif BROWSER.eql?('firefox')
    Capybara::Selenium::Driver.new(
      app, browser: :firefox,
           desired_capabilities: Selenium::WebDriver::Remote::Capabilities
        .firefox(marionette: true)
    )
  end
end

# Configura o link principal e qual navegador vai usar
Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG['url_home']
end

# Configura o tempo maximo de espera
Capybara.default_max_wait_time = 60