require "bloc_works/version"
require "bloc_works/controller"
require "bloc_works/dependencies"
require "bloc_works/router"
require "bloc_works/utility"

# Note: we will get a NameError at /favicon.ico - wrong constant name Favicon.icoController. Because we haven't created a Favicon.icoController file

module BlocWorks
  # Your code goes here...
  class Application
    def call(env)
      controller_class, action_name = controller_and_action(env) # [BooksController, welcome]
      if env['PATH_INFO'] == '/favicon.ico'
        [404, {'Content-Type' => 'text/html'}, ["404 ERROR. No favicon currently available."]]
      elsif controller_class == nil || controller_class == false || action_name == nil
        [404, {'Content-Type' => 'text/html'}, ["404 ERROR. That path does not exist."]]
      # e.g. BooksController.method_defined?("welcome")
      elsif controller_class.method_defined?(action_name)
        controller = controller_class.new(env)
        response_body = controller.send(action_name)
        return [200, {'Content-Type' => 'text/html'}, [response_body]]
      else
        return [404, {'Content-Type' => 'text/html'}, ["404 ERROR. That path does not exist."]]
      end
    end
  end
end
