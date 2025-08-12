Database Schema Definition
This directory contains the SQL script (schema.sql) for defining the database schema for the alx-airbnb-database project.

schema.sql
This file contains a series of CREATE TABLE statements to set up the database structure. It defines the following tables:

User: Stores information about users, including their roles as guests, hosts, or administrators.

Property: Contains details about the properties available for booking, linked to a specific host.

Booking: Manages booking records, linking a user to a property for a specific date range.

Payment: Records payment transactions for each booking.

Review: Stores user reviews and ratings for properties.

Message: Facilitates communication between users within the platform.

Key Features of the Schema
Primary Keys: Each table has a UUID type primary key, which is automatically generated to ensure uniqueness.

Foreign Keys: Relationships between tables are enforced using foreign keys (e.g., host_id in Property references user_id in User). 
ON DELETE CASCADE is specified for most foreign key constraints, 
which ensures that related records are automatically deleted if a parent record is removed (e.g., deleting a user will delete all their associated properties, bookings, etc.).

Constraints: The schema includes several constraints to maintain data integrity, such as NOT NULL, UNIQUE (for user emails), and CHECK constraints (for role, status, and rating).

Indexes: Several non-primary key columns are explicitly indexed to optimize query performance, especially on frequently searched or joined columns.
