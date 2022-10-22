part of 'users_bloc.dart';

class UsersState extends Equatable {
  final StatusEnum statusGetAll;
  final String errorMessage;
  final List<UserEntity> listAllUser;
  final List<UserEntity> listAllUserSearch;

  final int page;
  final StatusEnum statusPaginate;

  final FilterGenderEnum filterGender;
  final FilterNatEnum filterNat;



  const UsersState({
    required this.statusGetAll,
    required this.errorMessage,
    required this.listAllUser,
    required this.page,
    required this.statusPaginate,
    required this.filterGender,
    required this.filterNat,
    required this.listAllUserSearch,
  });

  factory UsersState.initial() {
    return const UsersState(
      statusGetAll: StatusEnum.loading,
      errorMessage: '',
      listAllUser: <UserEntity>[],
      page: 1,
      statusPaginate: StatusEnum.initial,
      filterGender: FilterGenderEnum.none,
      filterNat: FilterNatEnum.none,
      listAllUserSearch: <UserEntity>[],
    );
  }

  UsersState copyWith({
    StatusEnum? statusGetAll,
    String? errorMessage,
    List<UserEntity>? listAllUser,
    int? page,
    StatusEnum? statusPaginate,
    FilterGenderEnum? filterGender,
    FilterNatEnum? filterNat,
    List<UserEntity>? listAllUserSearch,

  }) {
    return UsersState(
      statusGetAll: statusGetAll ?? this.statusGetAll,
      errorMessage: errorMessage ?? this.errorMessage,
      listAllUser: listAllUser ?? this.listAllUser,
      page: page ?? this.page,
      statusPaginate: statusPaginate ?? this.statusPaginate,
      filterGender: filterGender ?? this.filterGender,
      filterNat: filterNat ?? this.filterNat,
      listAllUserSearch: listAllUserSearch ?? this.listAllUserSearch,
    );
  }

  @override
  List<Object> get props =>
      [
        statusGetAll,
        errorMessage,
        listAllUser,
        page,
        statusPaginate,
        filterGender,
        filterNat,
        listAllUserSearch,
      ];
}
