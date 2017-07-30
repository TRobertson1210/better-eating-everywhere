BEGIN;

INSERT INTO users(email, hashed_password, name, is_imperial, height, weight, gender, 
                    target_weight, permission_level, salt)
VALUES ('info@gmail.com', 'vdayO0T4PosMZHBZYU4smA==', 'Cronkis', 'T', 165, 68.03, 'Binary', 
            65.00, 1, 'vW1/HWyxZ+xKSuUWH2YcmhUfFt0yC9N8JWxWkdh2Z476Gn7suwQPECwmUZfO7KrRUojVQLoQVmuREkWXDxbKjufJAaWPQuDfNMHMyoiEc+5ac3U/u2lV7+AOneA0dVtxJ7iNuhaXR5x9YNCpaUDfYkKy3Rpo+R8WN1/gJruB1Ic=');
INSERT INTO users(email, hashed_password, name, is_imperial, height, weight, gender, 
                    target_weight, permission_level, salt)
VALUES ('noinfo@gmail.com', 'nxSb+vyAuMMie7ca7W3xvQ====', null, 'F', null, null, null, 
            null, 2, 'vW1/HWyxZ+CZuyxlOmoAJUQ1M9xC/+4rI4Tu9xhhW89OXEsuUbcv7ayS4IlCLpIi2ZLELG3rgo0be+y7dK+8y/qlrcXgk1wA+IuqWR3GwstgfjYCYCAQ7lW0W5YZWLFd85KChndkyjwdYrxWw4UjE+Kaj/sEuVxMptAKrUbkqAxwtiWlzC3pQ=+5ac3U/u2lV7+AOneA0dVtxJ7iNuhaXR5x9YNCpaUDfYkKy3Rpo+R8WN1/gJruB1Ic=');
            
            
INSERT INTO food_events(user_id, food_name, food_calories, event_calories,
                    amount_of_servings, date_eaten)
VALUES (2, 'Carrot', 30.62, 30.62, 1, '2017-7-30');

COMMIT;