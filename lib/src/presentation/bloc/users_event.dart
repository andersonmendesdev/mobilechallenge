part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object?> get props => [];
}

class GetAllUserEvent extends UsersEvent {
  final FilterGenderEnum? filterGender;
  final FilterNatEnum? filterNat;

  const GetAllUserEvent({this.filterGender, this.filterNat});

  @override
  List<Object?> get props => [filterGender, filterNat];
}

class GetAllUserPaginationEvent extends UsersEvent {}

class SearchUserEvent extends UsersEvent {
  final String query;

  const SearchUserEvent({
    required this.query,
  });

  @override
  List<Object?> get props => [
        query,
      ];
}

class SearchUserClearEvent extends UsersEvent {}
