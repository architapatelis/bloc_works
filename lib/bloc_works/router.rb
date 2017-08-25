# env is just a hash. Rack itself and various middlewares add values into it.
# https://stackoverflow.com/questions/17396611/what-is-the-env-variable-in-rack-middleware
# if PATH_INFO = "/books/welcome"

# the  env[PATH_INFO].split("/", 4) => ["", "books", "welcome"]
# url is split at '/' and '4' is the limit of elements that are returned in the array
# controller = "books"
# action = "welcome"
module BlocWorks
  class Application
    def controller_and_action(env)
      _, controller, action, _ = env["PATH_INFO"].split("/", 4)
      controller = controller.capitalize
      controller = "#{controller}Controller" #BooksController
      # Because of const_get, the first array element will be a reference to the  BooksController class, not just the string 'BooksController'.
      if controller != "Controller"
        [Object.const_get(controller), action]
      else
        return nil
      end
    end

=begin
    def fav_icon(env)
      if env['PATH_INFO'] == '/favicon.ico'
        # For now, this route will return an empty HTML page, with the status code 404.
        return [404, {'Content-Type' => 'text/html'}, []]
      end
    end
=end
  end
end
