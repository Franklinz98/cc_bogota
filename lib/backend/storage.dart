import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage storage = FirebaseStorage.instance;

Future<void> uploadFile(File file, String filename, Function onProgress,
    Function onComplete) async {
  Reference ref =
      storage.ref().child('Views').child('$filename${p.extension(file.path)}');
  try {
    UploadTask task = ref.putFile(file);
    task.snapshotEvents.listen((TaskSnapshot snapshot) {
      onProgress.call(snapshot.bytesTransferred / snapshot.totalBytes);
    }, onError: (e) {
      // The final snapshot is also available on the task via `.snapshot`,
      // this can include 2 additional states, `TaskState.error` & `TaskState.canceled`

      if (e.code == 'permission-denied') {
        throw Exception(
            'User does not have permission to upload to this reference.');
      }
      throw Exception(task.snapshot);
    });

    // We can still optionally use the Future alongside the stream.
    try {
      await task;
      onComplete.call(await ref.getDownloadURL());
    } on FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        throw Exception(
            'User does not have permission to upload to this reference.');
      }
      // ...
    }
  } on FirebaseException catch (e) {
    throw Exception(e.toString());
  }
}
