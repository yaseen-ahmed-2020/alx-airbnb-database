Sample Data SeedingThis directory contains the seed.sql script, which is used to populate the database with sample data.seed.sql
This file contains a series of INSERT statements to add realistic data to all the tables defined in database-script-0x01/schema.sql.
The script ensures that the data maintains the correct relationships between tables. For example:Users with different roles are created first.
Properties are created and linked to specific hosts.Bookings are made for a user at a particular property.Payments are associated with confirmed bookings.
Reviews are written by a user for a property they've booked.Messages are exchanged between different users.
This script is a valuable tool for testing the functionality of the database and for demonstration purposes. 
It allows you to quickly set up a fully populated environment without having to manually enter each record.
