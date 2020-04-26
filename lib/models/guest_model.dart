import 'package:eventify/constants.dart';

class Guest {
  final int id;
  final String role;
  final String name;
  final String imageUrl;
  final CommunicationMode mode;
  final String info;

  Guest({
    this.id,
    this.role,
    this.name,
    this.imageUrl,
    this.mode = CommunicationMode.APP,
    this.info = ''
  });
}

// GuestS
final Guest joanna = Guest(
  id: 0,
  role: 'Friend',
  name: 'Joanna',
  imageUrl: 'images/avatar2.png',
  mode: CommunicationMode.EMAIL,
  info: 'l.joanna19@hotmail.com'
);
final Guest emilia = Guest(
  id: 1,
  role: 'Bride',
  name: 'Emilia',
  imageUrl: 'images/people/Emilia.jpg',
  mode: CommunicationMode.SMS,
  info: '15148068277'
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
  id: 5,
  role: 'Bridesmaid',
  name: 'Maisie',
  imageUrl: 'images/people/Maisie.png',
);
final Guest john = Guest(
  id: 6,
  role: 'Ring Bearer',
  name: 'John',
  imageUrl: 'images/people/John.jpg',
);
final Guest stark = Guest(
  id: 7,
  role: 'Parent',
  name: 'Stark',
  imageUrl: 'images/people/Stark.png',
);

// FAVORITE CONTACTS
List<Guest> guests = [joanna, emilia, peter, jason, hodor, maisie, john, stark];

Guest getGuestFromId(int id) {
  for(Guest guest in guests) {
    if(guest.id == id) {
      return guest;
    }
  }
  return null;
}