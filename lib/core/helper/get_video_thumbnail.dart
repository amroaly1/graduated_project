import 'dart:io';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';

Future<File?> getVideoThumbnail(String videoPath) async {
  final tempDir = await getTemporaryDirectory();

  final thumbnailPath = await VideoThumbnail.thumbnailFile(
    video: videoPath,
    thumbnailPath: tempDir.path,
    imageFormat: ImageFormat.PNG,
    maxHeight: 200, // optional: specify height of thumbnail
    quality: 75,
  );

  if (thumbnailPath != null) {
    return File(thumbnailPath);
  }
  return null;
}
