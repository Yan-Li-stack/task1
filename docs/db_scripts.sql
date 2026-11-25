-- 1. Таблица Клиенты
CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- 2. Таблица Туры
CREATE TABLE tours (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    base_price DECIMAL(10, 2) NOT NULL
);

-- 3. Таблица Брони
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(id),
    tour_id INT REFERENCES tours(id),
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Ожидает'
);

-- 4. Таблица Платежи
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES bookings(id),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE DEFAULT CURRENT_DATE
);

-- ДОБАВЛЯЕМ ДАННЫЕ
INSERT INTO clients (first_name, last_name, email) VALUES
('Иван', 'Иванов', 'ivan@mail.ru'),
('Анна', 'Смирнова', 'anna@mail.ru'),
('Петр', 'Сидоров', 'petr@mail.ru');

INSERT INTO tours (title, base_price) VALUES
('Турция, Все включено', 120000.00),
('Египет, 5 звезд', 90000.00),
('Сочи, 3 звезды', 45000.00);

INSERT INTO bookings (client_id, tour_id, total_price, status) VALUES
(1, 1, 120000.00, 'Оплачено'),
(1, 3, 45000.00, 'Оплачено'),
(2, 2, 90000.00, 'Ожидает'),
(3, 1, 120000.00, 'Отменено');

INSERT INTO payments (booking_id, amount, payment_date) VALUES
(1, 120000.00, '2023-10-01'),
(2, 45000.00, '2023-10-05'),
(3, 30000.00, '2023-10-10');