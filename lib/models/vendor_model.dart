import 'package:eventify/constants.dart';

class Vendor {
  final int id;
  final String type;
  final String name;
  final String imageUrl;
  final CommunicationMode mode;

  Vendor({
    this.id,
    this.type,
    this.name,
    this.imageUrl,
    this.mode = CommunicationMode.APP,
  });
}

// GuestS
final Vendor photographer = Vendor(
  id: 1,
  type: 'Photographer',
  name: 'Photo Market',
  imageUrl: 'images/vendors/photo_market.png',
);
final Vendor videographer = Vendor(
  id: 2,
  type: 'Videographer',
  name: 'Matthew B.',
  imageUrl: 'images/vendors/matthew_birks.jpg',
);
final Vendor cake = Vendor(
  id: 3,
  type: 'Cake',
  name: 'Cupcake Shop',
  imageUrl: 'images/vendors/cupcake_shops.jpg',
);

// FAVORITE CONTACTS
List<Vendor> vendors = [photographer, videographer, cake];