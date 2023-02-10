# Trainee project with framework ROR 
Its social app with posts and comments creation, abitily to edit your profile, connect with email or google auth. Uses MVC code architectire, HTML written pages and postgreSQL db.
## Main functions
- User registration and authorization (gems Devise, Оmniauth);
- CRUD operations with posts and comments, own user profile;
- Users roles and restrictions (gem cancancan);
- Google map in profile;
- Storage of pictures (gem carrierwave);
- Grobal search, partial word search (gem pg_search);
- Ability to connect mobile client and generate json responces to REST requests;
- Auth with simple_token_authentication gem for mobile client. Client app: https://github.com/Adammui/Social_app_kursach
- Automatic tests with capybara and rspec;
## I used:
- IDE Ruby Mine;
- Database PostgreSQL;
- Local server Puma and remote deployment on Heroku;
- Gems : cancancan, rack-cors, carrierwave, therubyracer, omniauth-rails_csrf_protection, omniauth-google-oauth2, devise, simple_token_authentication, pg_search, simple_token_authentication, pg etc.
## Screenshots
### keep in mind that i'm not a designer. Main page with posts
![image](https://user-images.githubusercontent.com/53793144/218111127-e8582429-bb38-47a5-acb6-e67991a35d94.png)
### Registration page
![image](https://user-images.githubusercontent.com/53793144/218111576-180f073a-c574-452a-a5a6-cd07c9561336.png)
### Google api login automatically creates new or connects to excisting account 
![image](https://user-images.githubusercontent.com/53793144/218111426-e62f2747-b229-4b9f-967c-e55eb55933e7.png)
### post creation, we can add topic text and photo
![image](https://user-images.githubusercontent.com/53793144/218111639-23619cb2-a3f8-4e65-899b-214e6b18cbc9.png)
# ru
Веб приложение для соц сети, использующее архитектуру MVC, позволяющее обрабатывать REST запросы пользователей и обращаться к базе данных. Фронт часть написана на HTML+ JS.
### Основные функции:
- Регистрация и авторизация пользователей ( гемы Devise, Оmniauth для аутентификации через сервисы гугл);
- Обмен текстовыми постами и медиа с другими авторизированными пользователями + редактирование и удаление всего своего;
- Возможность оставить комментарии;
- Роли пользователей (гем cancancan);
- Оформление личного профиля пользователя c подключенной Google Map;
- Загрузка и хранение картинок в постах и профиле (гем carrierwave);
- Функция поиска по ключевым словам, в том числе по частичным словам (гем pg_search);
- Реализована возможность подключения мобильного клиента с помощью гема simple_token_authentication для авторизации с мобильного устройства, используя токен. Обмен данными с мобильным устройством осуществлялся используя HTTP запросы. Клиент: https://github.com/Adammui/Social_app_kursach
### При разработке приложения были использованы:
- IDE Ruby Mine
- Database PostgreSQL
- Локальный сервер Puma и выполнялся деплой на удаленный сервер Heroku
- Автоматические тесты с capybara;
- Гемы : cancancan, rack-cors, carrierwave, therubyracer, omniauth-rails_csrf_protection, omniauth-google-oauth2, devise, simple_token_authentication, pg_search, simple_token_authentication, pg и другие, можно посмотреть в Gemfile.
