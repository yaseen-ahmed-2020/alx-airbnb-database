# Database Normalization Analysis

## First Normal Form (1NF)
The schema is in 1NF because:
* Each table has a primary key (`user_id`, `property_id`, `booking_id`, `payment_id`, `review_id`, `message_id`).
* All attributes are atomic. For instance, `first_name` and `last_name` are stored in separate columns, and there are no repeating groups within any table.

## Second Normal Form (2NF)
The schema is in 2NF because it is already in 1NF, and all non-key attributes are fully functionally dependent on the entire primary key.
None of the tables have a composite primary key where a non-key attribute depends on only a part of the key.

For example, in the `Booking` table, the attributes `start_date`, `end_date`, `total_price`, `status`, and `created_at` are all dependent on the entire `booking_id` primary key.

## Third Normal Form (3NF)
The schema is in 3NF because it is in 2NF, and there are no transitive dependencies. 
A transitive dependency occurs when a non-key attribute is dependent on another non-key attribute.

* In the `User` table, attributes like `first_name`, `last_name`, and `email` are all directly dependent on the `user_id`.
* There is no attribute that depends on another non-key attribute.
* In the `Booking` table, `total_price` is a calculated field, but it is a direct attribute of the `Booking` record and not transitively dependent on another non-key attribute within the table itself.
* The use of foreign keys (`host_id`, `property_id`, `user_id`, `booking_id`, `sender_id`, `recipient_id`) correctly links the tables without introducing redundant data or transitive dependencies.
* For example, `host_id` in the `Property` table links to the `User` table, ensuring that host details are not duplicated within the `Property` table.

## Conclusion
The provided database schema for the Airbnb clone, as detailed in the data specification, is already in Third Normal Form (3NF). 
The design effectively eliminates data redundancy and maintains data integrity through a well-structured set of tables with appropriate primary and foreign keys. 
Therefore, no adjustments are required to achieve 3NF.
