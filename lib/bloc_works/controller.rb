# to understand why we use self.class read - https://www.jimmycuadra.com/posts/self-in-ruby/
# controllers must call render when all data is ready and the view should display the results
require "erubis"

module BlocWorks
  class Controller
    def initialize(env)
      @env = env
    end

    def render(view, locals = {})
      # resulting filename should be - app/views/books/{view}.html.erb
      filename = File.join("app", "views", controller_dir, "#{view}.html.erb")
      template = File.read(filename)
      eruby = Erubis::Eruby.new(template)
      eruby.result(locals.merge(env: @env))
    end

    # self refers to explicit object calling it, e.g. - BooksController
    def controller_dir
      klass = self.class.to_s #klass = "BooksController"
      klass.slice!("Controller") #klass = Books
      BlocWorks.snake_case(klass) # books
    end
  end
end
