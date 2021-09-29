import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/network_service/interfaces/i_base_http_error.dart';

class NoConnectionHttpError extends IBaseHttpError {
  NoConnectionHttpError({
    @required String error,
    @required int statusCode,
  }) : super(
          error: error,
          statusCode: statusCode,
        );
}
