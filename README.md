# http_method_emulator

Simple HTTP method emulator for form submitted data.

## Installation

1. Add the dependency to your `shard.yml`:
```yaml
dependencies:
  http_method_emulator:
    github: imdrasil/http_method_emulator
```
2. Run `shards install`

## Usage

HTML form supports only `GET` and `POST` method. To bring other methods support you can use this shard. This shard will be useful for a web frameworks/libs that have no such functionality (like Kemal or Spider-Gazelle).

```crystal
require "http_method_emulator"

# Add handler to your middlewares
# like for Kemal

add_handler HTTPMethodEmulator::Handler::INSTANCE
```

Also require `"lib/http_method_emulator/assets/http_method_emulator.js"` in your js assets.

Now you can just create `POST` form with hidden field `_method` holding required method.

```html
<form method="POST" action="/some/path">
  <input type="hidden" name="_method" value="PATCH">
  <button type="submit">Make Request</button>
</form>
```

JS catches submit event and add query parameter based on form `_method` field (or do nothing if it isn't exist). Handler modifies `POST` request method setting value sent in query `_method` field.

### Configuration

You can specify field name to be used for holding method name. This should be done in two places - crystal and JS.

```crystal
HTTPMethodEmulator.config do |conf|
  conf.key = "http_method"
end
```

```js
// Anywhere after js being imported
window.HTTPMethodEmulator.key = "http_method"
```

## Contributing

1. Fork it (<https://github.com/imdrasil/http_method_emulator/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Roman Kalnytskyi](https://github.com/imdrasil) - creator and maintainer
