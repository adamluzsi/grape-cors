grape-cors
==========

Ruby Grape Api extension with Cross-origin resource sharing

### Example:

```ruby

  class API < Grape::API
    #> some grape stuff here
  end

  Grape::CORS.apply!
  #> and ready to use!

```