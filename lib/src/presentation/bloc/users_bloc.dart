import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/enum/enum_filter.dart';
import '../../core/export.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/usecase_get_users.dart';

part 'users_event.dart';

part 'users_state.dart';

typedef EmitterUSer = Emitter<UsersState>;

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetAllUsersUsecase _allUsersUsecase;
  final String _apiURI;
  final String _apiVersion;
  final HTTPHeader _httpHeader;

  int get _limitPaginate => 50;

  UsersBloc({
    required GetAllUsersUsecase allUsersUsecase,
    required String apiURI,
    required String apiVersion,
    required HTTPHeader httpHeader,
  })  : _allUsersUsecase = allUsersUsecase,
        _apiURI = apiURI,
        _apiVersion = apiVersion,
        _httpHeader = httpHeader,
        super(UsersState.initial()) {
    on<GetAllUserEvent>(_getAllUserEvent);

    on<SearchUserEvent>(_searchUserEvent);
    on<SearchUserClearEvent>(_searchUserClearEvent);
  }

  /// this method [_getAllUserEvent] load all user and insert filter
  void _getAllUserEvent(GetAllUserEvent event, EmitterUSer emit) async {
    emit(state.copyWith(
        statusGetAll: StatusEnum.loading,
        filterGender: event.filterGender,
        filterNat: event.filterNat));
    var queryParams = <String, String>{'results': _limitPaginate.toString()};
    var filterGender =
        (event.filterGender ?? state.filterGender).toValueString();
    var filterNat = (event.filterNat ?? state.filterNat).toValueQuery();

    if (filterGender.isNotEmpty) {
      queryParams.addAll({'gender': filterGender});
    }
    if (filterNat.isNotEmpty) {
      queryParams.addAll({'nat': filterNat});
    }
    var params = HttpRequestParameters(
        uri: _apiURI,
        paths: '/api/$_apiVersion/',
        header: _httpHeader.headerGetNoAuth(),
        method: HTTPMethodEnum.get,
        queryParams: queryParams);
    var result = await _allUsersUsecase(params);

    if (result is ResponseFailure) {
      emit(state.copyWith(
          statusGetAll: StatusEnum.failure, errorMessage: result.errorMessage));
      return;
    }
    var data = result.data ?? <UserEntity>[];
    var listAllUser = <UserEntity>[];
    var listAllUserSearch = <UserEntity>[];
    for (var item in data) {
      listAllUser.add(item.copyWith());
      listAllUserSearch.add(item.copyWith());
    }
    emit(state.copyWith(
        statusGetAll: StatusEnum.initial,
        listAllUser: listAllUser,
        listAllUserSearch: listAllUserSearch));
  }

  void _searchUserEvent(SearchUserEvent event, EmitterUSer emit) async {
    var listAllUSer = <UserEntity>[];
    for (var item in state.listAllUser) {
      if (item.fullName.toLowerCase().contains(event.query.toLowerCase())) {
        listAllUSer.add(item.copyWith());
      }
    }
    emit(state.copyWith(listAllUserSearch: listAllUSer));
  }

  void _searchUserClearEvent(
      SearchUserClearEvent event, EmitterUSer emit) async {
    var listAllUSer = <UserEntity>[];
    for (var item in state.listAllUser) {
      listAllUSer.add(item.copyWith());
    }
    emit(state.copyWith(listAllUserSearch: listAllUSer));
  }
}
