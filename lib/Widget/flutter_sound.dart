import 'package:flutter/cupertino.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:soulgood/common/index.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';

final pathToSaveAudio = 'assets/record.mp4';
  final codec = Codec.aacMP4;
final audioSource = AudioSource.microphone;
class SoundRecorder {
  FlutterSoundRecorder audioRecoder = FlutterSoundRecorder();
  bool isRecodingInitialized = false;
  bool get isRecording => audioRecoder.isRecording;

  Future init() async {
    audioRecoder = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException("Microphone Permission");
    }
    await audioRecoder.openRecorder();
    isRecodingInitialized = true;
  }

  void dispose() {
    if (!isRecodingInitialized) return;
    audioRecoder.closeRecorder();
    audioRecoder != null;
    isRecodingInitialized = false;
  }

  Future _record() async {
    if (!isRecodingInitialized) return;
    await audioRecoder.startRecorder(toFile: pathToSaveAudio,codec: codec,audioSource:audioSource);

  }

  Future _stop() async {
    if (!isRecodingInitialized) return;

    await audioRecoder.stopRecorder();
  }

  Future toggleRecording() async {
    if (audioRecoder.isStopped) {
      await _record();
    } else {
      await _stop();
    }
  }
}
