## Trying to make heads or tails of the Grape Framework

### Usage

To run the app, run
```bash
rackup config.rg
```
but there's not much of interest in this app itself, it's more about the comments inside

### Inspection

If you go into `irb` and `require './app' you'll have access to all the grape
routes and entities.

You can inspect on these entities using, for example:

```ruby
App.routes
```

This returns an array of all known routes. Grab one and look at it's path, params
etc to see why I'm confused about a few things (below)

For example

```ruby
y App.routes.last
```

Will yield the following:
```yaml
--- !ruby/object:Grape::Route
options:
  :params:
    something:
      :required: true
      :type: String
    else:
      :required: false
      :type: String
      :documentation:
        :example: Something Else
    page:
      :required: false
      :type: Integer
    per_page:
      :required: false
      :type: Integer
    all:
      :required: false
  :description: another way of creating
  :prefix: :special
  :version: v1
  :namespace: "/wingdings"
  :method: POST
  :path: "/w/special/wingdings/thangs(.:format)"
  :compiled: !ruby/regexp /\A\/w\/special\/wingdings\/thangs(?:\.(?<format>[^\/.?]+))?\Z/
```
The params themselves are clearly wrong, I didn't specify anything but 'all' for
this route

### Confusion

Things I find confusing:

1. There are numerous ways to define routes, namespace prefixes
  - prefix in main app is *different* than prefix in a nested route
  - see comment there, prefix in app ends up being a suffix if you uncomment it
2. There are numerous ways to define params
  - You can use the desc method with a hash that has a key of params
  - You can use the desc method with a block and provide params
  - You can use the params block
3. Params seem to leak into subsequent routes
  - See wingdings endpoint, the top 'something' and 'else' params apply to ALL routes in that file
