BEGIN;

INSERT INTO users(email, hashed_password, name, height, weight, sex, 
                    target_weight, target_bmi, phone_number, permission_level)
VALUES ('email@email.com', 'hashword', 'Admin', 165, 68.03, 'M', 
            65.00, null, '555-555-5555', 1);
INSERT INTO users(email, hashed_password, name, height, weight, sex, 
                    target_weight, target_bmi, phone_number, permission_level)
VALUES ('nerd@nerd.com', 'hashword', 'User', 165, 68.03, 'F', 
            65.00, null, '554-555-5555', 2);

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (2, 'Carrot', 30.62, 30.62, 1, '2017-7-24');

COMMIT;