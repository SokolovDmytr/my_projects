import 'package:fridge_yellow_team_bloc/models/pages/interfaces/i_page_data.dart';

class IdPageData implements IPageData {
  @override
  final String id;
  final int pageNumber;

  IdPageData({
    required this.id,
    required this.pageNumber,
  });
}
