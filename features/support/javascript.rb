# verified against log_in.feature for blake
# https://github.com/jnicklas/capybara/issues/1443
# turn on webkit driver debug
$use_webkit = true
$use_chrome_instead_of_firefox = false
$webkit_debug = false
$wait_time = 5

def webkit_driver
  if $webkit_debug
    return :webkit_debug
  else
    return :webkit
  end
end

def webkit?
  [:webkit, :webkit_debug].include? Capybara.current_driver
end

def selenium?
  Capybara.javascript_driver == :selenium
end

if $use_chrome_instead_of_firefox
  # Register chrome browser for the :selenium driver, can be triggered below with the combination of @javascript @show
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
end


# try to get a unique port, important for parallels tests
# if ENV['TEST_ENV_NUMBER']
test_env_number = ENV['TEST_ENV_NUMBER']
test_env_number ||= 1
test_port = 9887 + test_env_number.to_i
#test_port += 1 while is_port_open?(@port) and not is_running_on_port?(@port)

puts "Capybara::Server.port: #{test_port} for test process: #{test_env_number}"
Capybara.server_port = test_port
# end


if $headless_server.nil?

  # Unnecessary on mac, see https://github.com/leonid-shevtsov/headless/issues/31#issuecomment-8933108
  if !OS.mac?
    require 'headless'
    # allow display autopick (by default)
    # allow each headless to destroy_at_exit (by default)
    # allow each process to have their own headless by setting reuse: false
    # $headless_server = Headless.new(reuse: false)
    $headless_server = Headless.new(reuse: true, destroy_at_exit: false)
    $headless_server.start

    puts "Process[#{Process.pid}] started headless server display: #{$headless_server.display}"
  end
end

at_exit do
  unless $headless_server.nil?
    puts "Process[#{Process.pid}] destroying headless server on display: #{$headless_server.display}"
    $headless_server.destroy
  end
end


# first time around, we need this set.
if $use_webkit
  Capybara.default_driver = webkit_driver
  # Capybara.current_driver = webkit_driver
  # Capybara.javascript_driver = webkit_driver
end


#
# If the @show tag is present on a non-mac environment, ignore it,
#   otherwise allow the combination of @javascript @show to trigger the
#   :selenium driver (which is :chrome browser as configured above)
#
Before do |scenario|

  if $use_webkit
    Capybara.current_driver = webkit_driver
    Capybara.javascript_driver = webkit_driver
  end

  # problem on @show with backgrounds: https://github.com/cucumber/cucumber/issues/52
  if should_show(scenario)

    # for some reason, just using the `using_driver` doesn't get us all the way there, so set/reset the `javascript_driver` as necessary.
    Capybara.current_driver = :selenium
    Capybara.javascript_driver = :selenium # needed for @show with chrome, as it doesn't seem to explicitly set the javascript driver
  end
  # puts "Using #{Capybara.current_driver}/#{Capybara.javascript_driver}/#{Capybara.default_driver}"
end


After do |scenario|

  # problem on @show with backgrounds: https://github.com/cucumber/cucumber/issues/52
  # puts "Done #{Capybara.current_driver}/#{Capybara.javascript_driver}/#{Capybara.default_driver}"
  Capybara.use_default_driver
end

def should_show(scenario)
  OS.mac? && (has_tag(scenario, '@show') || has_tag(scenario, '@leave_browser_open') || has_tag(scenario, '@single_step'))
end

def has_tag(scenario, tag)
  (scenario.source_tags.map do |tag|
    tag.name
  end).include? tag
end

# Increase wait time for ajax retries
Capybara.default_wait_time = $wait_time

Before do |scenario|
  @scenario = scenario
  # reset to wait time in case something in the scenario upped it as it was long running
  Capybara.default_wait_time = $wait_time
end


# webkit javascript check only
AfterStep do
  if webkit?
    begin

      #puts "All Javascript errors: #{page.driver.error_messages}"
      # puts "All console messages: #{page.driver.console_messages}"
      real_error_messages = page.driver.error_messages
      #real_error_messages = []
      #page.driver.error_messages.each_with_index do |e, i|
      #  # first two messages appear to be bogus, always.
      #  if (e[:line_number] == 0) && (e[:source].eql? 'undefined') && (e[:message].eql? 'TypeError: \'null\' is not an object') && i <= 1
      #    # discard message
      #  else
      #    real_error_messages << e
      #  end
      #end
      if real_error_messages.length > 0
        unless real_error_messages.first[:source].include?('https://a.stripecdn.com/manage/assets/application.manage')
          raise "Javascript errors: #{real_error_messages}"
        end
      end
    rescue
      puts "Failed to check javascript error messages."
    end
  end
end

After do |scenario|
  if (scenario.failed?)
    print_console_messages scenario
  end
end

def print_console_messages(scenario)
  return unless webkit?
  begin
    messages =  page.driver.console_messages

    if messages.presence && messages.size > 0
      print "\n--------------------------------------------------------------------------------------------------------------------------------------------"
      print "\nConsole: #{scenario_unique_name(scenario)}: "
      print "\n---------------------------------------------------------------------------\n"
      messages.each do |console_message|
        print "\n"
        print console_message[:message]
      end
      print "\n--------------------------------------------------------------------------------------------------------------------------------------------"
    else
      print "\n--------------------------------------------------------------------------------------------------------------------------------------------"
      print "\nNo Console messages for: #{scenario_unique_name(scenario)}: "
      print "\n--------------------------------------------------------------------------------------------------------------------------------------------"
    end
    $stdout.flush
  rescue
    puts "Failed to write console messages."
  end
end