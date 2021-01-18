import 'package:base_project_template/models/pages/interfaces/i_page_data.dart';
import 'package:flutter/cupertino.dart';

class IdPageData implements IPageData {
  @override
  final String id;
  final int pageNumber;

  IdPageData({
    @required this.id,
    @required this.pageNumber,
  });
}