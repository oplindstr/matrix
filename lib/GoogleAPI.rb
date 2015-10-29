
module GoogleAPI
  require 'google/api_client'
  require 'google/api_client/client_secrets'
  require 'google/api_client/auth/installed_app'
  require 'google/api_client/auth/storage'
  require 'google/api_client/auth/storages/file_store'
  require 'fileutils'

  APPLICATION_NAME = 'Google Calendar API Quickstart'
  CLIENT_SECRETS_PATH = 'client_secret.json'
  CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                               "calendar-quickstart.json")
  SCOPE = 'https://www.googleapis.com/auth/calendar.readonly'

  ##
  # Ensure valid credentials, either by restoring from the saved credentials
  # files or intitiating an OAuth2 authorization request via InstalledAppFlow.
  # If authorization is required, the user's default browser will be launched
  # to approve the request.
  #
  # @return [Signet::OAuth2::Client] OAuth2 credentials
  def authorize
    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

    file_store = Google::APIClient::FileStore.new(CREDENTIALS_PATH)
    storage = Google::APIClient::Storage.new(file_store)
    auth = storage.authorize

    if auth.nil? || (auth.expired? && auth.refresh_token.nil?)
      app_info = Google::APIClient::ClientSecrets.load(CLIENT_SECRETS_PATH)
      flow = Google::APIClient::InstalledAppFlow.new({
        :client_id => app_info.client_id,
        :client_secret => app_info.client_secret,
        :scope => SCOPE})
      auth = flow.authorize(storage)
      puts "Credentials saved to #{CREDENTIALS_PATH}" unless auth.nil?
    end
    auth
  end

  # Initialize the API
  client = Google::APIClient.new(:application_name => APPLICATION_NAME)
  client.authorization = authorize
  calendar_api = client.discovered_api('calendar', 'v3')

  def getEvents

  # Fetch the next 10 events for the user
    results = client.execute!(
      :api_method => calendar_api.events.list,
      :parameters => {
        :calendarId => 'primary',
        :maxResults => 10,
        :singleEvents => true,
        :orderBy => 'startTime',
        :timeMin => Time.now.iso8601 })

    puts "Upcoming events:"
    puts "No upcoming events found" if results.data.items.empty?
    results.data.items.each do |event|
      start = event.start.date || event.start.date_time
      puts "- #{event.summary} (#{start})"
      
    return results
  end
end
