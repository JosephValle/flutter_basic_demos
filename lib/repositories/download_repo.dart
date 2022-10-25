import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../models/user.dart';

class DownloadRepository {
  Dio dio = Dio();

  Future<File> getFile(url) async {

    Directory directory = await getTemporaryDirectory();
    String path = "${directory.path}/image.png";

    Response response = await dio.get(
      url,
      options: Options(
        responseType: ResponseType.bytes
      )
    );
    File file = File(path);

    var raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;

  }

  Future<User> getUser(url) async {
    Response response = await dio.get(url);
    String firstName = response.data['data']['first_name'];
    String lastName = response.data['data']['last_name'];

    return User(first: firstName, last: lastName);
  }

}