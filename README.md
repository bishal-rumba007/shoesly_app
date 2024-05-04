# Shoesly App

Shoesly is a Flutter app for Shoes Market Place Platform.

## Project Setup Instructions

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Run `flutter pub get` to install the necessary dependencies.
4. Run `flutter run` to start the application.

## Assumptions Made During Development

1. The application is primarily designed for mobile devices.
2. Firebase is used as the backend service for data storage and retrieval.


## Challenges Faced and How They Were Overcome

1. **Cloud Functions**: Initially, I planned to use Firebase Cloud Functions for calculating average rating. However, as Cloud Functions are only available for billing users, i decided to implement these operations on the client side.
2. **Filtering**: Implementing the filtering functionality was a bit challenging due to the complexity of the queries. I overcame this by breaking down the problem and implementing the filters one by one.
3. **Inserting Data into Firebase**: I faced some issues with the Firebase API when inserting data. I resolved these issues by carefully reviewing the API documentation and making sure our data structures matched what the API expected. I also made use of Refi-App for data insertion and manipulation in Firebase.
