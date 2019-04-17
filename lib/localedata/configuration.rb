require "erb"
require "yaml"

module Localedata
  class Configuration
    attr_reader :access_token
    attr_reader :projects

    def initialize
      @access_token = ENV["LOCALEDATA_ACCESS_TOKEN"]
      @projects = []
    end

    def load_config_file
      validate_config_file!

      file_content = File.read(config_file_path)
      yaml_data = ERB.new(file_content).result
      config_data = YAML.load(yaml_data)

      @access_token = (config_data["access_token"] || @access_token)
      @projects = (config_data["projects"] || @projects)

      validate_configuration!
    end

    def relative_config_file_path
      File.join("config", "localedata.yml")
    end

    def config_file_path
      File.expand_path(relative_config_file_path)
    end

  private

    def validate_config_file!
      unless File.exist?(config_file_path)
        puts "Error: #{relative_file_path} does not exist."
        exit 1
      end

      unless File.readable?(config_file_path)
        puts "Error: #{relative_file_path} is not readable."
        exit 1
      end
    end

    def validate_configuration!
      if @access_token.to_s.strip.empty?
        puts "Error: \"access_token\" is missing."
        exit 1
      end

      unless @projects.kind_of?(Array)
        puts "Error: \"projects\" is not an array."
        exit 1
      end

      @projects.each do |project|
        if project["id"].to_s.strip.empty?
          puts "Error: \"id\" in \"projects\" is missing."
          exit 1
        end

        unless project["locales"].kind_of?(Hash)
          puts "Error: \"locales\" in \"projects\" is not a hash."
          exit 1
        end

        project["locales"].each do |language_code, relative_file_path|
          file_path = File.expand_path(relative_file_path)

          unless File.exist?(file_path)
            puts "Error: #{relative_file_path} does not exist."
            exit 1
          end

          unless File.readable?(file_path)
            puts "Error: #{relative_file_path} is not readable."
            exit 1
          end

          unless File.writable?(file_path)
            puts "Error: #{relative_file_path} is not writable."
            exit 1
          end
        end
      end
    end
  end
end
