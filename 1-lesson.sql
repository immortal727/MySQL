# Создание нового пользователя
CREATE USER 'Dmitriy'@'localhost' IDENTIFIED BY '8f00gb7b803';
# права доступа нового пользователя
# Первая * разрешает пользоваться любой БД
# вторая * с любой таблицей
GRANT ALL ON *.* TO 'Dmitriy'@'localhost';