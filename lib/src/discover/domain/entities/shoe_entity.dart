

class Shoe {
  final int id;
  final String brand;
  final String name;
  final double price;
  final int numReviews;
  final double rating;
  final String imageUrl;

  Shoe({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.numReviews,
    required this.rating,
    required this.imageUrl,
  });
}

List<Shoe> dummyShoes = [
  Shoe(
    id: 1,
    brand: 'Nike',
    name: 'Air Force 1',
    price: 99.99,
    numReviews: 1234,
    rating: 4.5,
    imageUrl: 'https://example.com/air-force-1.jpg',
  ),
  Shoe(
    id: 2,
    brand: 'Jordan',
    name: 'Jordan 1 Retro High Tie Dye',
    price: 235.00,
    numReviews: 2345,
    rating: 4.8,
    imageUrl: 'https://example.com/air-jordan-1.jpg',
  ),
  Shoe(
    id: 3,
    brand: 'Jordan',
    name: 'Jordan 1 Retro High Tie Dye',
    price: 235.00,
    numReviews: 2345,
    rating: 4.8,
    imageUrl: 'https://example.com/air-jordan-1.jpg',
  ),
  Shoe(
    id: 4,
    brand: 'Jordan',
    name: 'Jordan 1 Retro High Tie Dye',
    price: 235.00,
    numReviews: 2345,
    rating: 4.8,
    imageUrl: 'https://example.com/air-jordan-1.jpg',
  ),
  Shoe(
    id: 5,
    brand: 'Jordan',
    name: 'Jordan 1 Retro High Tie Dye',
    price: 235.00,
    numReviews: 2345,
    rating: 4.8,
    imageUrl: 'https://example.com/air-jordan-1.jpg',
  ),
  Shoe(
    id: 6,
    brand: 'Adidas',
    name: 'Ultraboost DNA',
    price: 149.99,
    numReviews: 3456,
    rating: 4.2,
    imageUrl: 'https://example.com/ultraboost-dna.jpg',
  ),
  Shoe(
    id: 7,
    brand: 'Nike',
    name: 'Air Force 1',
    price: 99.99,
    numReviews: 1234,
    rating: 4.5,
    imageUrl: 'https://example.com/air-force-1.jpg',
  ),
  Shoe(
    id: 8,
    brand: 'Jordan',
    name: 'Jordan 1 Retro High Tie Dye',
    price: 235.00,
    numReviews: 2345,
    rating: 4.8,
    imageUrl: 'https://example.com/air-jordan-1.jpg',
  ),
  Shoe(
    id: 9,
    brand: 'Adidas',
    name: 'Ultraboost DNA',
    price: 149.99,
    numReviews: 3456,
    rating: 4.2,
    imageUrl: 'https://example.com/ultraboost-dna.jpg',
  ),
  // Add more shoe models here
];

List<String> brands = [
  'All',
  'Nike',
  'Adidas',
  'Reebok',
  'Jordan',
  // Add more brands here
];