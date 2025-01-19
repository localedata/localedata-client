# LocaleData Client

The `localedata` gem provides a command line interface for the Ruby on Rails translation management platform LocaleData on https://www.localedata.com.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "localedata", group: :development
```

Execute the following command:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install localedata
```

Finally, create the default configuration file:

```bash
$ bundle exec localedata install
```

## Configuration

You need to configure your access token on your development machine. Add the folowing line into your `.bashrc` (or `.zshrc`) file:

```bash
export LOCALEDATA_ACCESS_TOKEN="YOUR-SECRET-ACCESS-TOKEN"
```

You can edit the configuration in `config/localedata.yml`:

```yaml
projects:
  - id: "YOUR-PROJECT-ID"
    locales:
      en: "config/locales/en.yml"
      sk: "config/locales/sk.yml"
```

You can find the project ID and your access token on your LocaleData project page.

## Usage

```bash
localedata pull       # downloads all your locales
localedata pull en de # downloads only the en and de locales
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
