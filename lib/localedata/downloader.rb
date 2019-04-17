module Localedata
  class Downloader
    def download(locales)
      configuration = Localedata::Configuration.new
      configuration.load_config_file

      client = Localedata::Client.new(configuration.access_token)
      configuration.projects.each do |project|
        project["locales"].each do |language_code, relative_file_path|
          next if locales.any? && !locales.include?(language_code)

          print "Downloading #{language_code} into #{relative_file_path}..."
          data = client.pull(project["id"], language_code)
          if data[:success]
            file_path = File.expand_path(relative_file_path)
            File.write(file_path, data[:yaml])
            puts "Done."
          else
            puts "FAIL!"
            puts "Error #{data[:status_code]}: #{data[:error]}"
          end
        end
      end
    end
  end
end
