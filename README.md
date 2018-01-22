# SmokyPing

Small program that outputs the values form fping and stores them in an influxdb

## Installation

    $ gem install smoky_ping

## Usage
Set optional settings using ENV vars

| ENV setting   | default       |
| ------------- | ------------- |
| DB_HOST | localhost |
| DB_HOST | 8086 |
| DB_NAME | `whoami` |
| DB_TABLE | smoky_ping |

Run the logger using the following command

    SMOKY_HOSTS='4.2.2.2' smoky_ping

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gotbadger/smoky_ping.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
