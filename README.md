# Trainee project with framework ROR
Веб приложение для соц сети, использующее архитектуру MVC, позволяющее обрабатывать REST запросы пользователей и обращаться к базе данных. Фронт часть написана на HTML+ JS.
Rails web app with authorization and user roles + a couple of google apis.
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
## Скриншоты
