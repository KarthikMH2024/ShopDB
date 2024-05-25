# ShopDB
ShopDB Project Overview
About This Project
The ShopDB project is a simple web application designed to connect a user interface to a database via a local Tomcat server. This project can be run using the Eclipse IDE for web development with the JEE version. It uses a Tomcat server to facilitate the connection between the front end and the back end.

Project Description
The application operates an index.html file, connecting to the server using servlets. User inputs from the form are sent to an SQL database through the same server, following a simple Model-View-Controller (MVC) architecture.


## How to Run the Project
->Set Up the Environment:
 1.Install the JDK and set up the environment variables.
 2.Download and install Apache Tomcat.
 3.Set up MySQL and create a database named Cars with a table named cars (schema: car_id INT, model VARCHAR, brand VARCHAR, price INT).
 4.Add MySQL Connector/J to your project's build path.

->Deploy the Project:

 1.Open Eclipse IDE and create a new Dynamic Web Project.
 2.Copy the provided HTML and JSP files into the appropriate directories.
 3.Configure Tomcat within Eclipse.
 4.Run the Project:

->Start the Tomcat server.
 1.Navigate to http://localhost:8080/YourProjectName/index.html in your web browser.
 2.Fill out the form and submit it to see the data saved to the MySQL database and displayed on the JSP page.
 3.This setup allows a simple yet practical implementation of web development concepts involving front-end forms, back-end processing, and database interactions.

