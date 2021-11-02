import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/notification_message.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/notification_page/cubit/notification_page_state.dart';

class NotificationPageCubit extends Cubit<NotificationPageState> {
  NotificationPageCubit() : super(NotificationPageState(messages: []));

  void addNotification(NotificationMessage message) {
    final List<NotificationMessage> tempList = state.messages;
    tempList.add(message);
    state.copyWith(messages: tempList);
  }

  void emptyNotifications() {
    state.copyWith(messages: []);
  }
}
