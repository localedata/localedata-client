# frozen_string_literal: true

require 'test_helper'

class CliTest < Minitest::Test
  def test_install
    Localedata::Installer.any_instance.expects(:install).with(nil)
    Localedata::Cli.new.invoke(:install)
  end

  def test_install_with_project_id
    Localedata::Installer.any_instance.expects(:install).with('ID123')
    Localedata::Cli.new.invoke(:install, %w[ID123])
  end

  def test_pull
    Localedata::Downloader.any_instance.expects(:download).with([])
    Localedata::Cli.new.invoke(:pull)
  end

  def test_pull_with_locales
    Localedata::Downloader.any_instance.expects(:download).with(%w[sk en])
    Localedata::Cli.new.invoke(:pull, %w[sk en])
  end

  def test_version
    assert_output("Localedata #{Localedata::VERSION}\n") do
      Localedata::Cli.new.invoke(:version)
    end
  end
end
