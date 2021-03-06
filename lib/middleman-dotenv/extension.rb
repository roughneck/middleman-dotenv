module Middleman
  module Dotenv
    class Extension < ::Middleman::Extension
      option :env, '.env', 'environment file name'

      def initialize(app, options_hash = {}, &block)
        super

        env = options.env
        ::Dotenv.overload File.join(app.root, env)
        app.before do
          ::Dotenv.overload File.join(self.root, env)
        end
      end
    end
  end
end
