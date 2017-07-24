BEGIN;

DROP TABLE IF EXISTS food_events;
DROP SEQUENCE IF EXISTS seq_food_event_id;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id;

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_user_id'),
    email VARCHAR(255) NOT NULL,
    hashed_password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    height INTEGER,
    weight DECIMAL(5,2),
    sex CHAR(1),
    target_weight DECIMAL(5,2),
    target_BMI DECIMAL(3,1),
    phone_number VARCHAR(255),
    permission_level INTEGER
);

CREATE SEQUENCE seq_food_event_id;

CREATE TABLE food_events (
    food_event_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_food_event_id') NOT NULL,
    user_id INTEGER,
    food_name VARCHAR(255) NOT NULL,
    food_calories DECIMAL(8,2) NOT NULL,
    event_calories DECIMAL(8,2) NOT NULL,
    amount_of_servings DECIMAL(5,2) NOT NULL,
    date_eaten DATE NOT NULL
);

ALTER TABLE food_events ADD CONSTRAINT FK_food_events_user_id FOREIGN KEY (user_id) REFERENCES users(user_id);

COMMIT;