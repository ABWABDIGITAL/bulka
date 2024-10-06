import 'package:bulka/core/assets/asset_audio.dart';
import 'package:just_audio/just_audio.dart';

class SoundHelper {
  SoundHelper._();

  static Future<void> successSound() async {
    AudioPlayer player = AudioPlayer();
    await player.setAsset(AssetAudio.applePaySuccess);
    player.play();
  }
}
