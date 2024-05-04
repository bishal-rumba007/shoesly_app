const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");



const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

exports.updateProductAverageRating = functions.firestore
  .document('reviews/{reviewId}')
  .onCreate((snap, context) => {
    const reviewData = snap.data();
    const productId = reviewData.productId;

    // Query all reviews for the product
    return admin.firestore().collection('reviews')
      .where('productId', '==', productId)
      .get()
      .then(querySnapshot => {
        let totalRating = 0;
        let reviewCount = 0;

        // Calculate total rating and review count
        querySnapshot.forEach(doc => {
          const review = doc.data();
          totalRating += review.rating;
          reviewCount++;
        });

        // Calculate average rating
        const averageRating = totalRating / reviewCount;

        // Update the corresponding product document with the new average rating
        return admin.firestore().collection('products')
          .doc(productId)
          .update({ averageRating: averageRating });
      })
      .catch(error => {
        console.error('Error calculating average rating:', error);
        return null;
      });
  });
