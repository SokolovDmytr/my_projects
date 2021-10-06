part of 'user.dart';

@HiveType()
class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final Map<int, dynamic> fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    print('tokken ${fields[0] as String}');
    print('refresh ${fields[1] as String}');
    print('ttl ${fields[2] as String}');
    print('time ${fields[3] as int}');
    print('bool ${fields[4] as bool}');
    print('bool 2 ${fields[5] as bool}');

    return User(
      token: fields[0] as String,
      refreshToken: fields[1] as String,
      ttlToken: fields[2] as String,
      createDate: fields[3] == null ? null : DateTime.fromMillisecondsSinceEpoch(fields[3] as int),
      isFirstVisitApp: fields[4] as bool,
      isFirstSeeSwipeTutorial: fields[5] as bool,
    );
  }

  @override
  void write(
    BinaryWriter writer,
    User user,
  ) {
    print('write UserAdapter');
    writer
      ..writeByte(0)
      ..write(user.token)
      ..writeByte(1)
      ..write(user.refreshToken)
      ..writeByte(2)
      ..write(user.ttlToken)
      ..writeByte(3)
      ..write(user.createDate.millisecondsSinceEpoch)
      ..writeByte(4)
      ..write(user.isFirstVisitApp)
      ..writeByte(5)
      ..write(user.isFirstSeeSwipeTutorial);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
