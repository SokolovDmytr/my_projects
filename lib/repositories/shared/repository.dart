import 'package:base_project_template/adapters/interfaces/i_adapter.dart';

class Repository {
  Future<T> repository<T>(IAdapter adapter) async {
    return await adapter();
  }
}