import 'package:fridge_yellow_team_bloc/adapters/interfaces/i_adapter.dart';

class Repository {
  Future<T> repository<T>(IAdapter adapter) async {
    return await adapter();
  }
}
