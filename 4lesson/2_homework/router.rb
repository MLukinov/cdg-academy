module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end


      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource
  def initialize
    @posts = []
  end

  def index
    @posts.each_with_index do |post, index|
      puts "#{index}. #{post}"
    end
  end

  def show
    begin
      print "Какой пост будем искать ? (Введите индекс поста) > "
      input = Integer(gets.chomp)
      @posts.each_with_index do |post, index|
        if input == index
          @value = "#{index}. #{post}"
          puts @value
        end
      end
      if @value == nil
        puts "Такой пост не найден"
      end
      @value = nil
    rescue ArgumentError => error
      puts "Введите число! Ошибка - #{error.message}"
    end
  end

  def create
    print "Введите название нового поста > "
    post = gets.chomp
    @posts<<post
    puts "#{@posts.index(post)}. #{post}"
  end

  def update
    begin
      print "Введите индекс поста, который хотите заменить > "
      id = Integer(gets.chomp)
      old_post = @posts[id]
      print "Введите новый текст поста > "
      new_post = gets.chomp
      @posts[id] = new_post
      puts "Значение поста с индексом #{id} заменено с #{old_post} на #{new_post}"
    rescue ArgumentError => error
      puts "Введите число! Ошибка - #{error.message}"
    end
  end

  def destroy
    begin
      print "Введите индекс поста, который хотите удалить > "
      id = Integer(gets.chomp)
      post_to_delete = @posts[id]
      @posts.delete_at(id)
      puts "Значение #{post_to_delete} удалено из массива"
    rescue ArgumentError => error
      puts "Введите число! Ошибка - #{error.message}"
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
