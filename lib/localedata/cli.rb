require "thor"

module Localedata
  class Cli < Thor
    desc "install [PROJECT_ID]", "Create a default configuration file"
    def install(project_id=nil)
      installer = Localedata::Installer.new
      installer.install(project_id)
    end

    desc "pull [LOCALES]", "Download the configured locales"
    def pull(*locales)
      downloader = Localedata::Downloader.new
      downloader.download(locales)
    end

    desc "version", "Print the current version"
    def version
      puts "Localedata #{Localedata::VERSION}"
    end
  end
end
