import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class UserEntity extends Equatable {
  final UserId id;
  final String gender;
  final String email;
  final String phone;
  final UserName name;
  final UserDob dob;
  final UserPicture picture;
  final String nat;
  final UserLocation location;

  const UserEntity({
    required this.id,
    required this.gender,
    required this.email,
    required this.phone,
    required this.name,
    required this.dob,
    required this.picture,
    required this.nat,
    required this.location,
  });

  UserEntity copyWith({
    UserId? id,
    String? gender,
    String? email,
    String? phone,
    UserName? name,
    UserDob? dob,
    UserPicture? picture,
    String? nat,
    UserLocation? location,
  }) {
    return UserEntity(
      id: id ?? this.id,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name.copyWith(),
      dob: dob ?? this.dob.copyWith(),
      picture: picture ?? this.picture.copyWith(),
      nat: nat ?? this.nat,
      location: location ?? this.location,
    );
  }

  String get fullName => '${name.title} ${name.first} ${name.last}';

  String get birthDay => DateFormat('dd/MM/yyyy').format(dob.date);

  @override
  List<Object?> get props => [
        id,
        gender,
        email,
        phone,
        name,
        dob,
        picture,
        nat,
        location,
      ];
}

///
///
/// user names
class UserName extends Equatable {
  final String title;
  final String first;
  final String last;

  const UserName({
    required this.title,
    required this.first,
    required this.last,
  });

  UserName copyWith({
    String? title,
    String? first,
    String? last,
  }) {
    return UserName(
      title: title ?? this.title,
      first: first ?? this.first,
      last: last ?? this.last,
    );
  }

  @override
  List<Object?> get props => [
        title,
        first,
        last,
      ];
}

///
///
/// User birthday and age
class UserDob extends Equatable {
  final DateTime date;
  final int age;

  const UserDob({
    required this.date,
    required this.age,
  });

  UserDob copyWith({
    DateTime? date,
    int? age,
  }) {
    return UserDob(
      date: date ?? this.date,
      age: age ?? this.age,
    );
  }

  @override
  List<Object?> get props => [
        date,
        age,
      ];
}

///
///
/// User picture
class UserPicture extends Equatable {
  final String large;
  final String medium;
  final String thumbnail;

  const UserPicture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  UserPicture copyWith({
    String? large,
    String? medium,
    String? thumbnail,
  }) {
    return UserPicture(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  List<Object?> get props => [
        large,
        medium,
        thumbnail,
      ];
}

///
///
/// User name id
class UserId extends Equatable {
  final String name;
  final String value;

  const UserId({required this.name, required this.value});

  UserId copyWith({
    String? name,
    String? value,
  }) {
    return UserId(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  String get fullId => '$name $value';

  @override
  List<Object?> get props => [
        name,
        value,
      ];
}

///
///
/// user location
class UserLocation extends Equatable {
  final String address;
  final int number;
  final String city;
  final String state;
  final String country;
  final String postcode;

  const UserLocation({
    required this.address,
    required this.number,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
  });

  UserLocation copyWith({
    String? address,
    int? number,
    String? city,
    String? state,
    String? country,
    String? postcode,
  }) {
    return UserLocation(
      address: address ?? this.address,
      number: number ?? this.number,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      postcode: postcode ?? this.postcode,
    );
  }
  String get streetNumber => '$number $address';
  String get cityCountryZip => '$city, $state $postcode';


  @override
  List<Object?> get props => [
        address,
        number,
        city,
        state,
        country,
        postcode,
      ];
}
