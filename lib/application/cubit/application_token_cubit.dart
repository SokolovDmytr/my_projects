import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_state.dart';
import 'package:fridge_yellow_team_bloc/models/exception/server_error_exception.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/token.dart';
import 'package:fridge_yellow_team_bloc/repositories/repositories_interface/i_auth_repository.dart';
import 'package:fridge_yellow_team_bloc/res/app_duration.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/shared/fridge_parser.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/pop_up_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/server_error_pop_up_widget.dart';
import 'package:fridge_yellow_team_bloc/services/user_information_service/user_information_service.dart';

class ApplicationTokenCubit extends Cubit<ApplicationTokenState> {
  final IAuthRepository repository;

  ApplicationTokenCubit({
    required this.repository,
  }) : super(ApplicationTokenState.init());

  void saveToken(Token? token) => emit(state.copyWith(token: token));

  Future<String> getToken() async {
    if (state.token != null &&
        state.token!.token != emptyString &&
        state.token!.createDate.add(AppDuration.timeValidOfToken).isAfter(
              DateTime.now(),
            )) {
      return state.token!.token;
    } else {
      logger.d('Update token');

      if (state.token == null) {
        return emptyString;
      }

      try {
        final BaseHttpResponse response = await repository.updateToken(refreshToken: state.token!.refreshToken);

        if (response.response == null) {
          throw ServerErrorException(message: response.error!.error);
        } else {
          final Token authToken = FridgeParser.instance.parseEntity(
            exampleObject: Token,
            response: response,
          );
          emit(
            state.copyWith(token: authToken),
          );

          UserInformationService.instance.saveInformation(authToken);
          await Future.delayed(AppDuration.fourSecond);
          return authToken.token;
        }
      } on ServerErrorException catch (error) {
        PopUpService.instance.show(
          widget: ServerErrorPopUpWidget(),
        );
        logger.e('Update token error: ${error.message}');
        return state.token!.token;
      }
    }
  }

  void clearToken() {
    emit(
      state.copyWith(
        token: Token(
          token: emptyString,
          refreshToken: emptyString,
          ttlToken: emptyString,
          createDate: DateTime.now(),
        ),
      ),
    );
  }
}
