import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enum/enum_filter.dart';
import '../../../core/enum/enum_status.dart';
import '../../../domain/entities/user_entity.dart';
import '../../bloc/users_bloc.dart';
import '../../route/app_routes.dart';
import '../../route/sheet/custom_modal_sheet.dart';
import '../widget/empty/empty_state_widget.dart';
import '../widget/loading/schimmer_card_list.dart';
import '../widget/switcher/switcher_animete_widget.dart';
import 'modal/modal_sheet_filter.dart';
import 'widget/card_user_widget.dart';
import 'widget/header_filter_widget.dart';
import 'widget/loading_more_widget.dart';
import 'widget/profile_user_widget.dart';
import 'widget/search_field_widget.dart';
import 'widget/title_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UsersBloc _usersBloc;
  final controller = TextEditingController();
  final focusNode = FocusNode();
  var query = '';

  @override
  void initState() {
    super.initState();
    _usersBloc = BlocProvider.of<UsersBloc>(context)
      ..add(const GetAllUserEvent());
    controller.addListener(_onChangeState);
    focusNode.addListener(_onChangeState);
  }

  @override
  void dispose() {
    super.dispose();
    focusNode
      ..removeListener(_onChangeState)
      ..dispose();
    controller
      ..removeListener(_onChangeState)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final brightness = ThemeData.estimateBrightnessForColor(primaryColor);
    const emptyState = EmptyStateWidget(
      typeEmptyState: TypeEmptyState.support,
      title: 'Ops, não há usuarios',
    );
    final pageError = EmptyStateWidget(
      title: 'Ops, dados não encontrados',
      subTitle:
          'Parece que tivemos um problema ao carregar os usuarios, tente novamente.',
      childrens: [
        const SizedBox(height: 10),
        MaterialButton(
          color: Theme.of(context).primaryColor,
          colorBrightness: brightness,
          onPressed: () => _usersBloc.add(const GetAllUserEvent()),
          child: const Text('Recarregar'),
        ),
      ],
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        bloc: _usersBloc,
        builder: (context, state) {
          return Column(
            children: [
              const TitleHomeWidget(),
              SearchFieldWidget(
                  controller: controller,
                  focusNode: focusNode,
                  onSubmitted: _onSubmitted,
                  onClear: _onClear),
              HeaderFilterWidget(
                filterGender: state.filterGender,
                filterNat: state.filterNat,
                onTouch: (type) {
                  _modalFilter(
                    child: ModalSheetFilter(
                        onChangeFilter: (gender, nat) {
                          _usersBloc.add(GetAllUserEvent(
                              filterGender: gender, filterNat: nat));
                        },
                        filterGender: state.filterGender,
                        filterNat: state.filterNat,
                        type: type),
                    type: type,
                  );
                },
              ),
              Expanded(
                child: BlocConsumer<UsersBloc, UsersState>(
                  bloc: _usersBloc,
                  listenWhen: (prev, current) =>
                      prev.statusGetAll != current.statusGetAll,
                  listener: (context, state) {
                    if (state.statusGetAll == StatusEnum.failure) {
                      Navigator.of(context).pushNamed(AppRoutes.modalError,
                          arguments: state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    var listAllUser = state.listAllUserSearch;
                    var listView = listAllUser.isEmpty
                        ? emptyState
                        : ListView.builder(
                            itemCount: listAllUser.length + 1,
                            itemBuilder: (context, index) {
                              // index >= 0 &&
                              //     index <= listAllUser.length - 1
                              if (index < listAllUser.length) {
                                var user = listAllUser[index];
                                var widgetCard = CardUserWidget(
                                  userEntity: user,
                                  onShowProfile: () => _onShowProfile(user),
                                );
                                return widgetCard;
                              }
                              return LoadingMoreWidget(query: query);
                            },
                          );

                    return SwitcherAnimateWidget(
                      child: state.statusGetAll == StatusEnum.loading
                          ? const SchimmerCards()
                          : state.statusGetAll == StatusEnum.failure
                              ? pageError
                              : listView,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onSubmitted(String value) {
    query = controller.text;
    _usersBloc.add(SearchUserEvent(query: controller.text));
  }

  void _onChangeState() {
    setState(() {});
  }

  void _onClear() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.text = '';
      query = '';
      if (!focusNode.hasFocus) {
        focusNode.requestFocus();
      }
      _usersBloc.add(SearchUserClearEvent());
    });
  }

  ///
  ///
  /// modalsheet filter gender and nationality
  void _modalFilter(
      {required Widget child, required TypeFilterEnum type}) async {
    var constraints = BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      minHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
      minWidth: MediaQuery.of(context).size.width,
    );
    showCustomModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      constraints: type == TypeFilterEnum.nat || type == TypeFilterEnum.all ? constraints : null,
      isScrollControlled: type == TypeFilterEnum.nat || type == TypeFilterEnum.all,
      useSafeArea: type == TypeFilterEnum.nat || type == TypeFilterEnum.all,
      builder: (context) {
        return SafeArea(bottom: true, child: child);
      },
    );
  }

  ///
  ///
  /// modal sheet show profile user
  void _onShowProfile(UserEntity user) {
    showCustomModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
        minHeight: MediaQuery.of(context).size.height * 0.7,
        maxWidth: MediaQuery.of(context).size.width,
        minWidth: MediaQuery.of(context).size.width,
      ),
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return SafeArea(bottom: true, child: UserProfileWidget(user: user));
      },
    );
  }


  // _scrollController.addListener(() {
  // if (_scrollController.position.maxScrollExtent ==
  //     _scrollController.offset &&
  //     !store.state.clientState.isloadingOffSet &&
  //     store.state.clientState.listClientBottombar.length <
  //     store.state.clientState.totalItens) {
  //
  //   }
  // });


}

// ListView.separated(
//   controller: _scrollController,
//   separatorBuilder: (context, index) => Divider(height: 1),
//   padding: EdgeInsets.all(0.0),
//   itemCount: listClientBottombar.length + 1,
//   itemBuilder: (BuildContext context, int index) {
//   if (index < listClientBottombar.length) {
//     return makelist(context, listClientBottombar[index], index, vm);
//   } else if (vm.clientState.offset < vm.clientState.totalItens &&
//     listClientBottombar.length < vm.clientState.totalItens) {
//     return Padding(
//     padding: EdgeInsets.symmetric(vertical: 26.0),
//     child: Center(child: loadingbottomlist),
//     );
//   } else {
//      return Container();
//   }
// });
