import 'package:fridge_yellow_team_bloc/models/pages/models/notification_message.dart';

class NotificationPageState {
  final List<NotificationMessage> messages;

  const NotificationPageState({
    required this.messages,
  });

  NotificationPageState copyWith({
    List<NotificationMessage>? messages,
  }) {
    return NotificationPageState(messages: messages ?? this.messages);
  }
}
