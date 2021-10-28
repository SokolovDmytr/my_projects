import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_base_http_error.dart';

class NoConnectionHttpError extends IBaseHttpError {
  const NoConnectionHttpError({
    required String error,
    required int statusCode,
  }) : super(
          error: error,
          statusCode: statusCode,
        );
}
