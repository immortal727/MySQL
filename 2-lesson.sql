# список БД
SHOW DATABASES;
# Создание базы данных
# IF NOT EXISTS если не существует
CREATE DATABASE IF NOT EXISTS web_mysql;
# Удаление БД если существует
#DROP DATABASE IF EXISTS web_mysql;

# выбор БД для дальнейшего использования
USE web_mysql;
# Создание таблицы если не существует
CREATE TABLE IF NOT EXISTS cource(
	id_cource INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    # дополнительная информация
    # UNSIGNED не минусы
    duration TINYINT UNSIGNED NOT NULL,
    pic VARCHAR(250) DEFAULT 'curse.png',
    date_start DATE NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
SHOW TABLES; # список таблиц
DESC cource; # описание структуры таблицы

# ДОБАВЛЕНИЕ ЗАПИСЕЙ В ТАБЛИЦУ
# перечисляем в круглых скобках столбцы, в которых будем перечислять данные
INSERT INTO cource(title,duration,pic, date_start)
VALUES ('WEB Developer', 4, 'web.png', '2020-10-04'),
('Phuton', 2, 'python.png', '2020-05-25');
# Если поле имеет NOT NULL мы обязаны его описать при добавлении значений
# Важна очередность полей
INSERT INTO cource(title,duration, date_start)
VALUES
('Node JS', 4, '2020-11-15');
INSERT INTO cource(title,duration, date_start)
VALUES
('JAVA', 3, '2020-11-10');

# ПОЛУЧЕНИЕ ВСЕХ ЗАПИСЕЙ ИЗ ТАБЛИЦЫ
# * - все столбцы
# если конкретные столбцы должны получить, то вставлем между SELECT и FROM
SELECT * FROM cource;

# ОБНОВЛЕНИЕ ДАННЫХ В ТАБЛЦЕ
UPDATE cource SET pic='java.png' WHERE id_cource=4;

# УДАЛЕНИЕ ЗАПИСИ
DELETE FROM cource WHERE id_cource=2;

# ПОЛУЧЕНИЕ ПО ОПРЕДЕЛЕННЫМ СТОЛБЦАМ
SELECT title, duration FROM cource;

# ОПЕРАТОРЫ = != < > <= >=
SELECT * FROM cource WHERE id_cource=1;
SELECT * FROM cource WHERE title='WEB Developer';
SELECT * FROM cource WHERE duration>3;

# ОПЕРАТОРЫ AND OR NOT
SELECT * FROM cource WHERE duration>3 AND title='JAVA';

# ДИАПАЗОНЫ BETWEEN AND
# NOW() возвращает текущую дату, работает только с типом даты и времени
SELECT * FROM cource
	WHERE date_start
    BETWEEN NOW() AND '2020-11-30';

# IN(value1, value2, value3)
SELECT * FROM cource
	WHERE duration IN(3,6,10);

# LIKE (маска по символам, в конце, в середине, в начале)
# JA%
# %er
# %o%
SELECT * FROM cource
	WHERE title LIKE '%o%';

# СОРТИРОВКА (сортирует только результат)
# ORDER BY DESC - по убыванию
# ORDER BY ASC - по возрастанию (по умолчанию ORDER BY)

SELECT * FROM cource ORDER BY title DESC;
SELECT * FROM cource ORDER BY date_start;

# по нескольким столбцам
SELECT * FROM cource 
	ORDER BY duration ASC, title DESC;

# ИНДЕКСЫ
CREATE INDEX title -- имя индекса
ON cource(title); -- название столбца в таблице

# СОСТАВНЫЕ ИНДЕКСЫ
# CREATE INDEX duration_date
#	ON cource(duration, date_start);

SHOW INDEX FROM cource; -- инфоормация по всем созданным индексам в таблице
EXPLAIN SELECT * FROM cource WHERE title='JAVA';

DROP INDEX title ON cource; -- удаляем индекс (title - название индекса, не столбец)

# LIMIT - кол-во результатов (записей)
# Выбор первых 10 записей из таблицы
SELECT * FROM cource LIMIT 10;

# Выбрать с 10 по 20 записи из таблицы
# Разница между 10 и 20-тью 10 значений, поэтому второе число 10
SELECT * FROM cource LIMIT 11,10;

# Верхний регистр: функция UPPER(UCASE)
SELECT *, UPPER(title) as title FROM cource;
SELECT UPPER(title) FROM cource;

# Нижний регистр: LCASE (LOWER)
SELECT *, LCASE(title) as title FROM cource;
SELECT LOWER(title) FROM cource;
