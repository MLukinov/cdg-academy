Как работает код в router.rb ?

1. Все начинается с инициализации модуля Resources, класса PostsController и класса Router, после чего создается экземпляр класса Router
2. Запускается метод resources(PostsController, 'posts')
    2.1 Создается экземпляр класса PostsController и сохраняется в переменную controller
    2.2 Далее происходит объявление возможных маршрутов 'GET', 'POST', 'PUT', 'DELETE'
3. Пользователь выбирает одну из команд - 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
    3.1 При выборе команды 1 - Posts создается экземпляр класса PostsController, который вызывает метод .connection и передает на вход данные (@routes['posts'])
        3.1.1 Метод .connection не находится в классе PostsController, но так как этот класс имеет срочку "extend Resource", то он может обращаться к методам модуля Resource
        3.1.2 Происходит проверка входных данных. Если они пусты, то возвращается "No route matches for #{self}"
        3.1.3 Выводится сообщение 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
        3.1.4 Пользователь вводит необходимую команду "verb"
            3.1.4.1 Объявляется переменная action = nil. 
            3.1.4.2 При выборе команды q метод завершается и программа возвращается к 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
            3.1.4.3 При вводе "GET" выводится сообщение print 'Choose action (index/show) / q to exit: '
                3.1.4.2.1 При вводе index значение ввода записывается в переменную action. Далее происходит проверка, action = nil?
                    a. Если action == nil, то в переменную (@routes[]) записывается значение введенной команды verb и происходит вызов метода @routes[verb] с помощью метода .call
                        a1. @routes[POST] вызывает метод controller.method(:create)
                        a2. @routes[PUT] вызывает метод controller.method(:update)
                        a3. @routes[DELETE] вызывает метод controller.method(:destroy)
                    b. Если action != nil, то в переменную (@routes[][]) записывается значение введенной команды verb, а также сам action, после чего происходит вызов метода @routes[verb][action] с помощью метода .call
                        b1. @routes[GET][index] вызывает метод controller.method(:index)
                        b2. @routes[GET][show] вызывает метод controller.method(:show)
                3.1.4.2.2 После выполнения одного из методов программа возвращается к циклу 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
    3.2 При выборе команды 2 - Comments или любой другой команды, кроме q ничего не происходит. Цикл loop повторяется, так как нет обработки ввода для этих данных
    3.3 При выборе команды q - Exit выполнение кода завершается


Resource является модулем. Он расширяет функционал класса PostsController. В случае необходимости, мы можем использовать этот модуль в любом другом классе