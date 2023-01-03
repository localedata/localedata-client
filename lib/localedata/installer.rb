require 'fileutils'

module Localedata
  class Installer
    def install(project_id)
      configuration = Localedata::Configuration.new

      relative_config_file_path = configuration.relative_config_file_path
      config_file_path = configuration.config_file_path

      if File.exist?(config_file_path)
        puts "A #{relative_config_file_path} already exists."
        return
      end

      FileUtils.mkdir_p(File.dirname(config_file_path))
      File.write(config_file_path, default_config(project_id))

      puts congratulation(relative_config_file_path)
    end

  private

    def default_config(project_id)
      <<~YAML
        projects:
          - id: "#{project_id || 'YOUR-PROJECT-ID'}"
            locales:
              en: "config/locales/en.yml"
      YAML
    end

    def congratulation(config_file_path)
      <<~CONGRATS
        Congratulations! Localedata was successfully installed.
        We generated a config file containing some default settings:

          #{config_file_path}

      CONGRATS
    end
  end
end
