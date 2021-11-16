import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/application/bloc/application_events.dart';
import 'package:memes/application/bloc/application_state.dart';
import 'package:memes/models/meme_info_dto.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/services/network_service/models/base_http_response.dart';
import 'package:memes/services/network_service/models/get_mems_params.dart';
import 'package:memes/services/network_service/network_service.dart';

class ApplicationBloc extends Bloc<ApplicationEvents, ApplicationState> {
  ApplicationBloc() : super(ApplicationState(list: [])) {
    on<FetchMemesEvent>((event, emit) async {
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
        emit(state.copyWith(list: list));
      }
    });
  }
}
