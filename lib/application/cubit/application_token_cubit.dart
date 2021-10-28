import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_state.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/token.dart';

class ApplicationTokenCubit extends Cubit<ApplicationTokenState> {
  ApplicationTokenCubit() : super(ApplicationTokenState.init());

  void saveToken(Token? token) => emit(state.copyWith(token: token));
}
