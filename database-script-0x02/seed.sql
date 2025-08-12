-- alx-airbnb-database/database-script-0x02/seed.sql

-- This script populates the database with sample data.
-- It's intended to be run after the schema.sql script has been executed.

-- We'll declare some variables to store UUIDs so we can reference them later.
-- This requires a PostgreSQL psql or similar environment that supports \set.
-- For a single script without an interactive shell, we can use a CTE or hardcode.
-- For a robust script, let's pre-define some UUIDs for clarity and portability.

-- Let's create some user IDs that we will use throughout the script.
-- Note: In a real application, you would not hardcode UUIDs like this.
-- We are doing it here for the sake of creating consistent relationships in this script.
-- Example UUIDs
-- Jane Doe (Host): 00000000-0000-0000-0000-000000000001
-- John Smith (Host): 00000000-0000-0000-0000-000000000002
-- Emily White (Guest): 00000000-0000-0000-0000-000000000003
-- David Chen (Guest): 00000000-0000-0000-0000-000000000004
-- Alice Johnson (Admin): 00000000-0000-0000-0000-000000000005

-- Insert sample data into the User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, role) VALUES
('00000000-0000-0000-0000-000000000001', 'Jane', 'Doe', 'jane.doe@example.com', 'hashed_password_1', 'host'),
('00000000-0000-0000-0000-000000000002', 'John', 'Smith', 'john.smith@example.com', 'hashed_password_2', 'host'),
('00000000-0000-0000-0000-000000000003', 'Emily', 'White', 'emily.white@example.com', 'hashed_password_3', 'guest'),
('00000000-0000-0000-0000-000000000004', 'David', 'Chen', 'david.chen@example.com', 'hashed_password_4', 'guest'),
('00000000-0000-0000-0000-000000000005', 'Alice', 'Johnson', 'alice.j@example.com', 'hashed_password_5', 'admin');

-- Insert sample data into the Property table
INSERT INTO Property (host_id, name, description, location, price_per_night) VALUES
('00000000-0000-0000-0000-000000000001', 'Cozy Cottage', 'A charming cottage in the countryside.', 'Rural Area', 150.00),
('00000000-0000-0000-0000-000000000001', 'Modern Loft', 'A sleek loft with city views.', 'Downtown Metropolis', 250.00),
('00000000-0000-0000-0000-000000000002', 'Beachfront Villa', 'Stunning villa with direct beach access.', 'Coastal Town', 450.00);

-- Insert sample data into the Booking table
-- Note: We'll retrieve the property_id using a subquery to avoid hardcoding UUIDs.
INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status) VALUES
((SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), '00000000-0000-0000-0000-000000000003', '2023-08-01', '2023-08-05', 600.00, 'confirmed'),
((SELECT property_id FROM Property WHERE name = 'Modern Loft'), '00000000-0000-0000-0000-000000000004', '2023-09-10', '2023-09-12', 500.00, 'pending'),
((SELECT property_id FROM Property WHERE name = 'Beachfront Villa'), '00000000-0000-0000-0000-000000000003', '2023-10-20', '2023-10-27', 3150.00, 'confirmed');

-- Insert sample data into the Payment table
-- The booking IDs are retrieved via subquery
INSERT INTO Payment (booking_id, amount, payment_method) VALUES
((SELECT booking_id FROM Booking WHERE user_id = '00000000-0000-0000-0000-000000000003' AND start_date = '2023-08-01'), 600.00, 'credit_card'),
((SELECT booking_id FROM Booking WHERE user_id = '00000000-0000-0000-0000-000000000003' AND start_date = '2023-10-20'), 3150.00, 'paypal');

-- Insert sample data into the Review table
INSERT INTO Review (property_id, user_id, rating, comment) VALUES
((SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), '00000000-0000-0000-0000-000000000003', 5, 'Absolutely loved the stay! The cottage was cozy and beautiful.'),
((SELECT property_id FROM Property WHERE name = 'Beachfront Villa'), '00000000-0000-0000-0000-000000000003', 4, 'Great location, but the check-in process was a bit slow.');

-- Insert sample data into the Message table
INSERT INTO Message (sender_id, recipient_id, message_body) VALUES
('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000001', 'Hi Jane, looking forward to my stay at the cottage!'),
('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000003', 'Great! We are happy to have you. Let me know if you need anything.');
