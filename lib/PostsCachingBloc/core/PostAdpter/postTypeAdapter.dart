import 'package:hive_flutter/hive_flutter.dart';
import '../model/ModelPosts.dart';

class PostTypeAdapter extends TypeAdapter<Posts>{
  @override
  Posts read(BinaryReader reader) {
    return Posts(userId:reader.readInt(),id: reader.readInt(), title: reader.readString(), body: reader.readString());
  }

  @override
  //0 -> 223
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Posts obj) {
    writer.writeInt(obj.userId);
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.body);

  }

}