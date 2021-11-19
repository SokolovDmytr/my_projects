import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/application/bloc/application_events.dart';
import 'package:memes/application/bloc/application_state.dart';
import 'package:memes/dictionary/dictionary_classes/snack_bars_language.dart';
import 'package:memes/dictionary/flutter_dictionary.dart';
import 'package:memes/models/meme_info_dto.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/res/locales.dart';
import 'package:memes/services/network_service/models/base_http_response.dart';
import 'package:memes/services/network_service/models/get_mems_params.dart';
import 'package:memes/services/network_service/network_service.dart';
import 'package:memes/services/route_service/route_service.dart';
import 'package:memes/ui/global_widgets/global_snack_bar.dart';

class ApplicationBloc extends Bloc<ApplicationEvents, ApplicationState> {
  ApplicationBloc() : super(ApplicationState(list: [], searchedList: [])) {
    on<FetchMemesEvent>((event, emit) async {
      FlutterDictionary.instance.setNewLanguage(Locales.base);
      final SnackBarsLanguage snackBarsLanguage = FlutterDictionary.instance.language.snackBarsLanguage;
      final bool connectionAvailable = await NetworkService.instance.checkInternetConnection();
      if (connectionAvailable == false) {
        ScaffoldMessenger.of(RouteService.instance.navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            content: GlobalSnackBar(text: snackBarsLanguage.noInternet),
            backgroundColor: AppColors.transparent,
          ),
        );
        return;
      }

      final BaseHttpResponse response = await NetworkService.instance.request(
        type: HttpType.httpGet,
        route: HttpRoute.getMemes,
        parameter: GetMemesParams(),
      );
      List<MemeInfoDto> list = [];

      final responseData = (response.response['data']['memes']);
      if (response.response != null) {
        for (var meme in responseData) {
          list.add(MemeInfoDto.fromJson(meme));
        }
        emit(
          state.copyWith(
            list: list,
            searchedList: list,
          ),
        );
      }
    });

    on<SearchTemplatesEvent>((event, emit) {
      List<MemeInfoDto> searchedList = [];
      for (var memeTemplate in state.list) {
        if (memeTemplate.name.toLowerCase().contains(event.searchText.toLowerCase())) {
          searchedList.add(memeTemplate);
        }
      }
      emit(state.copyWith(searchedList: searchedList));
    });
  }
}
