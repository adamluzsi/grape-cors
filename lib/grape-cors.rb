module Grape
  module CORS

    module Config
      @headers  ||= ['Content-Type']
      @origin   ||= ['*']
      @methods  ||= %W[ HEAD OPTIONS GET POST PUT DELETE ]
      @acah     ||= 'Access-Control-Allow-Headers'
      @acao     ||= 'Access-Control-Allow-Origin'
      @acam     ||= 'Access-Control-Allow-Methods'
      class << self

        attr_reader :headers,:origin,:methods,
                    :acah,:acao,:acam

        def object
          {
              Config.acah => Config.headers,
              Config.acao => Config.origin,
              Config.acam => Config.methods
          }
        end;alias obj object

      end
    end

    class << self
      def apply

        ObjectSpace.each_object(Class).select { |klass| klass < Grape::API rescue false }.each do |api_class|
          api_class.class_eval do

            before do

              # CORS headers
              Grape::CORS::Config.object.each_pair do |header_key,header_value|
                header header_key, header_value.join(', ')
              end

            end

            self.routes.map { |route| route.route_path.to_s.sub(/\(\.:format\)$/,'') }.uniq.each do |path|

              #> CORS Option calls
              options path do
                Grape::CORS::Config.object.each_pair do |header_key,header_value|
                  header header_key, header_value.join(', ')
                end
              end

            end
          end
        end

        return nil

      end;alias apply! apply

    end
  end
end