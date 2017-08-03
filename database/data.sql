BEGIN;

INSERT INTO users(email, hashed_password, name, is_imperial, height, weight, gender, 
                    target_weight, target_calories, permission_level, salt)
VALUES ('info@gmail.com', 'vdayO0T4PosMZHBZYU4smA==', 'Real Person', 'T', 195, 200.00, 'Binary', 
            165.00, 2000, 1, 'vW1/HWyxZ+xKSuUWH2YcmhUfFt0yC9N8JWxWkdh2Z476Gn7suwQPECwmUZfO7KrRUojVQLoQVmuREkWXDxbKjufJAaWPQuDfNMHMyoiEc+5ac3U/u2lV7+AOneA0dVtxJ7iNuhaXR5x9YNCpaUDfYkKy3Rpo+R8WN1/gJruB1Ic=');
INSERT INTO users(email, hashed_password, name, is_imperial, height, weight, gender, 
                    target_weight, target_calories, permission_level, salt)
VALUES ('noinfo@gmail.com', 'nxSb+vyAuMMie7ca7W3xvQ====', null, 'F', null, null, null, 
            null, null, 2, 'vW1/HWyxZ+CZuyxlOmoAJUQ1M9xC/+4rI4Tu9xhhW89OXEsuUbcv7ayS4IlCLpIi2ZLELG3rgo0be+y7dK+8y/qlrcXgk1wA+IuqWR3GwstgfjYCYCAQ7lW0W5YZWLFd85KChndkyjwdYrxWw4UjE+Kaj/sEuVxMptAKrUbkqAxwtiWlzC3pQ=+5ac3U/u2lV7+AOneA0dVtxJ7iNuhaXR5x9YNCpaUDfYkKy3Rpo+R8WN1/gJruB1Ic=');
            
            
INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pancake', 175, 350, 2, '2017-08-03');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Maple Syrup', 216, 216, 1, '2017-08-03');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Orange Juice', 112, 112, 1, '2017-08-03');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Salad', 136, 136, 1, '2017-08-03');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pot Roast', 184, 552, 3, '2017-08-03');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Coke', 155, 155, 1, '2017-08-03');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Mashed Potatoes', 237, 237, 1, '2017-08-03');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pancake', 175, 350, 2, '2017-08-02');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Maple Syrup', 216, 216, 1, '2017-08-02');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Orange Juice', 112, 112, 1, '2017-08-02');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pot Roast', 184, 552, 3, '2017-08-02');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Coke', 155, 155, 1, '2017-08-02');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Mashed Potatoes', 237, 237, 1, '2017-08-02');
            
INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pancake', 175, 350, 2, '2017-08-01');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Maple Syrup', 216, 216, 1, '2017-08-01');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Orange Juice', 112, 112, 1, '2017-08-01');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Salad', 136, 136, 1, '2017-08-01');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pot Roast', 184, 552, 3, '2017-08-01');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Coke', 155, 155, 1, '2017-08-01');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Mashed Potatoes', 237, 237, 1, '2017-08-01');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pancake', 175, 350, 2, '2017-07-31');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Maple Syrup', 216, 216, 1, '2017-07-31');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Orange Juice', 112, 112, 1, '2017-07-31');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Salad', 136, 136, 1, '2017-07-31');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pot Roast', 184, 552, 3, '2017-07-31');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Coke', 155, 155, 1, '2017-07-31');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Mashed Potatoes', 237, 237, 1, '2017-07-31');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pancake', 175, 350, 2, '2017-07-30');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Maple Syrup', 216, 216, 1, '2017-07-30');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Orange Juice', 112, 112, 1, '2017-07-30');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Salad', 136, 136, 1, '2017-07-30');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pot Roast', 184, 552, 3, '2017-07-30');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Coke', 155, 155, 1, '2017-07-30');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Mashed Potatoes', 237, 237, 1, '2017-07-30');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pancake', 175, 350, 2, '2017-07-29');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Maple Syrup', 216, 216, 1, '2017-07-29');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Orange Juice', 112, 112, 1, '2017-07-29');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Salad', 136, 136, 1, '2017-07-29');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pot Roast', 184, 552, 3, '2017-07-29');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Coke', 155, 155, 1, '2017-07-29');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Mashed Potatoes', 237, 237, 1, '2017-07-29');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pancake', 175, 350, 2, '2017-07-28');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Maple Syrup', 216, 216, 1, '2017-07-28');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Orange Juice', 112, 112, 1, '2017-07-28');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Salad', 136, 136, 1, '2017-07-28');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pot Roast', 184, 552, 3, '2017-07-28');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Coke', 155, 155, 1, '2017-07-28');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Mashed Potatoes', 237, 237, 1, '2017-07-28');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pancake', 175, 350, 2, '2017-07-27');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Maple Syrup', 216, 216, 1, '2017-07-27');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Orange Juice', 112, 112, 1, '2017-07-27');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Salad', 136, 136, 1, '2017-07-27');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pot Roast', 184, 552, 3, '2017-07-27');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Coke', 155, 155, 1, '2017-07-27');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Mashed Potatoes', 237, 237, 1, '2017-07-27');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pancake', 175, 350, 2, '2017-07-26');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Maple Syrup', 216, 216, 1, '2017-07-26');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Orange Juice', 112, 112, 1, '2017-07-26');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Salad', 136, 136, 1, '2017-07-26');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Pot Roast', 184, 552, 3, '2017-07-26');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Coke', 155, 155, 1, '2017-07-26');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'Mashed Potatoes', 237, 237, 1, '2017-07-26');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'The Monthly Meal', 40000, 40000, 1, '2017-07-15');

INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (1, 'The Yearly Meal', 450000, 450000, 1, '2017-03-15');

COMMIT;