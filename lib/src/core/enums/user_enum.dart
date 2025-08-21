enum UserEnum {
  admin,
  buyer,
  seller;

  String get key => switch (this) {
    admin => 'admin',
    buyer => 'buyer',
    seller => 'seller',
  };
}
