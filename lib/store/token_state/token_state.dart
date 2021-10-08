import 'dart:collection';

import 'package:yellow_team_fridge/models/pages/token.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';
import 'package:yellow_team_fridge/store/token_state/actions/delete_token_action.dart';
import 'package:yellow_team_fridge/store/token_state/actions/save_token_action.dart';

class TokenState {
  final Token token;

  TokenState({
    this.token,
  });

  factory TokenState.initial() {
    return TokenState();
  }

  TokenState copyWith(Token token) {
    return TokenState(
      token: token ?? this.token,
    );
  }

  TokenState reducer(dynamic action) {
    return Reducer<TokenState>(
      actions: HashMap.from({
        SaveTokenAction: (dynamic action) => _saveAction(action.token),
        DeleteTokenAction: (dynamic action) => _deleteAction(),
      }),
    ).updateState(action, this);
  }

  TokenState _saveAction(Token token) {
    return TokenState(token: token);
  }

  TokenState _deleteAction() {
    return TokenState();
  }
}
