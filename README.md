grape-cors
==========

Ruby Grape Api extension with Cross-origin resource sharing

### Example:

```ruby

  class API < Grape::API

    get :info do
      #> some logic here
    end

  end

  Grape::CORS.apply!
  #> and ready to use!

```

In case if you need to use the 'options' call, you should use by hand the following method:
* init_cors_headers!
because the apply method will not override the options enpoints (safety reasons)
And otherwise, that option call will lack the required headers

if you want change any of the cors object, you can do so in the following way:

```ruby

  #> Defaults
  Grape::CORS::Config.headers  #> [ 'Content-Type' ]
  Grape::CORS::Config.origin   #> [ '*' ]
  Grape::CORS::Config.methods  #> [ 'HEAD', 'OPTIONS', 'GET', 'POST', 'PUT', 'DELETE' ]

  Grape::CORS::Config.acah     #> 'Access-Control-Allow-Headers'
  Grape::CORS::Config.acao     #> 'Access-Control-Allow-Origin'
  Grape::CORS::Config.acam     #> 'Access-Control-Allow-Methods'

```

```ruby

  Grape::CORS::Config.origin.clear
  Grape::CORS::Config.origin.push(some_origin_site)

```

Happy coding! :)