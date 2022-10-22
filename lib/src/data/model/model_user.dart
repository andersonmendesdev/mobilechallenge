// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:intl/intl.dart';

import '../../domain/entities/user_entity.dart';

class ModelUser extends UserEntity {
  const ModelUser(
      {required super.id,
      required super.gender,
      required super.email,
      required super.phone,
      required super.name,
      required super.dob,
      required super.picture,
      required super.nat,
      required super.location});

  factory ModelUser.fromJson(Map data) {
    return ModelUser(
      id: ModelUserId.fromJson(data['id'] ?? {}),
      gender: data['gender'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      name: ModelUserName.fromJson(data['name'] ?? {}),
      dob: ModelUserDob.fromJson(data['dob'] ?? {}),
      picture: ModelUserPicture.fromJson(data['picture'] ?? {}),
      nat: data['nat'] ?? '',
      location: ModelUserLocation.fromJson(data['location'] ?? {}),
    );
  }
}

class ModelUserName extends UserName {
  const ModelUserName(
      {required super.title, required super.first, required super.last});

  factory ModelUserName.fromJson(Map data) {
    return ModelUserName(
      title: data['title'] ?? '',
      first: data['first'] ?? '',
      last: data['last'] ?? '',
    );
  }
}

class ModelUserDob extends UserDob {
  const ModelUserDob({required super.date, required super.age});

  factory ModelUserDob.fromJson(Map data) {
    return ModelUserDob(
      date: _getDateTime(data['date']),
      age: data['age'] ?? 0,
    );
  }

  static DateTime _getDateTime(String? date) {
     var datenow =DateTime.now();
     var defaultDate = DateTime(datenow.year, datenow.month, datenow.day);
    try {
      if (date == null || date == '') {
        return defaultDate;
      }
      var resullt = DateFormat('yyyy-MM-ddTH:mm:sszzz').parse(date);
      return DateTime(resullt.year, resullt.month, resullt.day);
    } catch (_) {
      return defaultDate;
    }
  }
}

class ModelUserPicture extends UserPicture {
  const ModelUserPicture(
      {required super.large, required super.medium, required super.thumbnail});

  factory ModelUserPicture.fromJson(Map data) {
    return ModelUserPicture(
      large: data['large'],
      medium: data['medium'],
      thumbnail: data['thumbnail'],
    );
  }
}

class ModelUserId extends UserId {
  const ModelUserId({required super.name, required super.value});

  factory ModelUserId.fromJson(Map data) {
    return ModelUserId(
      name: data['name'] ?? '',
      value: data['value'] ?? '',
    );
  }
}

class ModelUserLocation extends UserLocation {
  const ModelUserLocation(
      {required super.address,
      required super.number,
      required super.city,
      required super.state,
      required super.country,
      required super.postcode});

  factory ModelUserLocation.fromJson(Map data) {
    var _address = '';
    var _number = 0;
    var mapStreet = data['street'];
    if (mapStreet is Map) {
      _address = mapStreet['name'] ?? '';
      _number = mapStreet['number'] ?? 0;
    }
    var resulpostcode = 0;
    var datapostocde = data['postcode'];
    if(datapostocde is String){
      resulpostcode = int.tryParse(datapostocde) ?? 0;
    }
    if(datapostocde is int){
      resulpostcode = datapostocde;
    }
    return ModelUserLocation(
      address: _address,
      number: _number,
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      country: data['country'] ?? '',
      postcode: resulpostcode,
    );
  }
}
