import 'package:eventify/constants.dart';

class Guest {
  final int id;
  final String role;
  final String name;
  final String imageUrl;
  final CommunicationMode mode;

  Guest({
    this.id,
    this.role,
    this.name,
    this.imageUrl,
    this.mode = CommunicationMode.APP,
  });
}

// GuestS
final Guest emilia = Guest(
  id: 1,
  role: 'Bride',
  name: 'Emilia',
  imageUrl: 'images/people/Emilia.jpg',
);
final Guest peter = Guest(
  id: 2,
  role: 'Groom',
  name: 'Peter',
  imageUrl: 'images/people/Peter.jpg',
);
final Guest jason = Guest(
  id: 3,
  role: 'Best Man',
  name: 'Jason',
  imageUrl: 'images/people/Jason.jpg',
);
final Guest hodor = Guest(
  id: 4,
  role: 'Usher',
  name: 'Hodor',
  imageUrl: 'images/people/Hodor.jpg',
);
final Guest maisie = Guest(
  id: 4,
  role: 'Bridesmaid',
  name: 'Maisie',
  imageUrl: 'images/people/Maisie.png',
);
final Guest john = Guest(
  id: 4,
  role: 'Ring Bearer',
  name: 'John',
  imageUrl: 'images/people/John.jpg',
);
final Guest stark = Guest(
  id: 4,
  role: 'Parent',
  name: 'Stark',
  imageUrl: 'images/people/Stark.png',
);

// FAVORITE CONTACTS
List<Guest> guests = [emilia, peter, jason, hodor, maisie, john, stark];
