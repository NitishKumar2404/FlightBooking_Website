# Flight Booking Website Application using Ruby on Rails

## Requirement
- Ruby on Rails

## Installation
- Run ```bundle install```
-Please do not use rails db:migrate
- Build DB from the database file using
- ```rails runner db/schema.rb ```
- Should you encounter other errors, make sure to run:
- ```bundle exec rake webpacker:install```

## Application Outline

The application is a simple flight booking website build using Ruby on Rails in the MVC (Model-Controller-View) architecture. The application consists of the following features:

- Flight (Creating Flight details)
- Users (Creating users, accessing flights and make reservations)
- Reservations (Making Reservations for a flight by a user, including baggages and displaying costs)
- Baggages (Including weights and estimating total costs, editing the baggages)
- Admin (Permission to update or delete flights and has permission to access all information)

## Performance on Edge-Case Scenarios

This section lists down the response of the application with respect to certain edge-case situations as follows:

- Flight:
    - admin deletes a flight, all the reservations along with it is deleted.

- Users
    - admin deletes a user, all the reservations made along with it is deleted. (it is recommended to delete all the reservations before deleting an user)
    - Our app is equipped to validate credit card details and hence we expect the user to feed in their card details.

- Admin
    - admin cannot delete an admin account

- Reservation
- Flight capacity is automatically updated when the reservations are edited.
- If your booking exceeds the available capacity, then only the number of available seats get booked.
- If your reservation fails to give the number of passengers while booking, the application safely assumes the number to be one. You may still go ahead and edit the reservation.

- Baggage
- Cost is added/subtracted as and when bags are added/edited or removed.


## Testing

The application is tested using the RSpec library of the rails. The - model and - controller is thoroughly tested using the same and the files are included in the repository.

## Deployment

The application is deployed in the NCSU VCL Remote System and the website can be accessed through the following link:

http://152.7.177.177:8080/

## Credentials for Admin and Users
- ADMIN :
    - Email: admin@ncsu.edu
    - Password: 1234
- Sample User 1:
    - Email: abellam2@ncsu.edu
    - Password:1234
- Sample User 2:
    - Email: jim@nc.edu
    - Password: 1234

NOTE: The password is simple for ease of testing.

## Points to Remember (to Access Features of App)

- Flights can be filtered by either giving the source or the destination or both.

- The current logged-in user or admin name would be displayed in the top of every page for reference.

- The accessibilty is limited to the reservations and bookings of a particular user only, and is not accessible by all.

- The admin can only access operations like deleting and editing flights and users.


## Contributors

- Abhimanyu Bhellam (abellam@ncsu.edu)
- Nitish Kumar Murali (nmurali2@ncsu.edu)
- Vishnu Vinod Erapalli (verapal@ncsu.edu)