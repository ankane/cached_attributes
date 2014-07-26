# Cached Attributes

Super simple caching for Ruby

```ruby
class Product
  attr_cached :orders_count

  def orders_count
    # ...
  end

end
```

Choose when to use the cached value

```ruby
product.orders_count        # not cached
product.cached_orders_count # cached
```

Force a re-cache

```ruby
product.cache_orders_count!
```

## Installation

Add this line to your application’s Gemfile:

```ruby
gem 'cached_attributes'
```

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ankane/cached_attributes/issues)
- Fix bugs and [submit pull requests](https://github.com/ankane/cached_attributes/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features
