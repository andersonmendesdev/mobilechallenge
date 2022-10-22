// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mobilechallenge/src/data/model/model_user.dart';
import 'package:mobilechallenge/src/domain/entities/user_entity.dart';

void main(){
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

  group('User entity', () {

    test('should return date String from user dob entity', () async {
      //arrange
      var dateString = '07/03/1967';
      //act
      var result = userEntity.birthDay;
      //assert
      expect(result, equals(dateString));
    });

    test('should return fullName from user name entity', () async {
      //arrange

      var nameString ='Mrs Beverley Pierce';
      //act
      var result = userEntity.fullName;
      //assert
      expect(result, equals(nameString));
    });

    test('should return address from user location entity', () async {
      //arrange

      var nameString ='9102 N Stelling Rd';
      //act
      var result = userEntity.location.streetNumber;
      //assert
      expect(result, equals(nameString));
    });

    test('should return cityCountryZip from user location entity', () async {
      //arrange
      var nameString ='Irvine, Wyoming 59221';
      //act
      var result = userEntity.location.cityCountryZip;
      //assert
      expect(result, equals(nameString));
    });

    test('should return fullId from user id entity', () async {
      //arrange
      var nameString ='SSN 113-42-0860';
      //act
      var result = userEntity.id.fullId;
      //assert
      expect(result, equals(nameString));
    });

  });
}