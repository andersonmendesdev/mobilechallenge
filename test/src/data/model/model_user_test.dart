// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobilechallenge/src/data/model/model_user.dart';
import 'package:mobilechallenge/src/domain/entities/user_entity.dart';

import '../../../fixfeature/fixture_reader.dart';

void main() {
  late UserEntity userEntity;
  setUp(() {
    userEntity = ModelUser(
      id: ModelUserId(name: 'SSN', value: '113-42-0860'),
      gender: 'female',
      email: 'beverley.pierce@example.com',
      phone: '(270) 300-6062',
      name: ModelUserName(title: 'Mrs', first: 'Beverley', last: 'Pierce'),
      dob: ModelUserDob(date: DateTime(1967, 03, 07), age: 55),
      picture: ModelUserPicture(
          large: 'https://randomuser.me/api/portraits/women/93.jpg',
          medium: 'https://randomuser.me/api/portraits/med/women/93.jpg',
          thumbnail: 'https://randomuser.me/api/portraits/thumb/women/93.jpg'),
      nat: 'US',
      location: ModelUserLocation(
        address: 'N Stelling Rd',
        number: 9102,
        city: 'Irvine',
        state: 'Wyoming',
        country: 'United States',
        postcode: 59221,
      ),
    );
  });

  group('user model fromjson', () {
    test('should return a valid model whe JSON data', () async {
      //arrange
      final Map jsonMap = json.decode(fixture('user_json.json'));
      //act
      final result = ModelUser.fromJson(jsonMap);
      //assert
      expect(result, userEntity);
    });

    test('should return a valid model dob when JSON invalid null date',
        () async {
      //arrange
      var datenow = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);
      final Map jsonMap = json.decode(fixture('user_dob_invalid.json'));
      //act
      final result = ModelUserDob.fromJson(jsonMap);
      //assert
      expect(result.date, datenow);
    });

    test('should return a valid model dob when JSON invalid date', () async {
      //arrange
      var datenow = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);
      final Map jsonMap = json.decode(fixture('user_dob_invalid_date.json'));
      //act
      final result = ModelUserDob.fromJson(jsonMap);
      //assert
      expect(result.date, datenow);
    });
  });
}
