# README

FullStack проект на Rails

Чтобы запустить проект в режиме разработки, нужно выполнить команду ```bin/dev```.

Администратор создан по умолчанию:
* email: admin@example.com
* password: abcdF2!

Используемые технологии:
* stimulus-turbo
* sidekiq
* devise (auth)
* rubocop
* rolify
* action_policy
* tailwindcss
* pagy (pagination)
  
Админ создается после миграции базы данных с помощью seeds в admin.seeds.rb. 

Проект использует Redis и Sidekiq для фоновых заданий. Все требуемые зависимости можно найти в Brewfile.
