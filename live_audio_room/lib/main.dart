import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LamaShqawaApp());
}

class LamaShqawaApp extends StatelessWidget {
  const LamaShqawaApp({super.key});

  static const int appID = 1475899414;
  static const String appSign = "1ac5522ff79c53562009cee2849faae402fb6e4f6c908632caaded0496b23101";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lama Shqawa',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const LobbyScreen(),
    );
  }
}

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mic_external_on, size: 100, color: Colors.orange),
            const SizedBox(height: 20),
            const Text("Lama Shqawa", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.orange)),
            const Text("لمة شقاوة", style: TextStyle(fontSize: 22, color: Colors.white70)),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () => _joinRoom(context, "shqawa_1"),
              child: const Text("يلا شقاوة - ادخل القعدة 🔥", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () => _joinRoom(context, "pk_battle_room"),
              child: const Text("تحدي PK ⚔️", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  void _joinRoom(BuildContext context, String roomID) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => 
      ZegoUIKitPrebuiltLiveAudioRoom(
        appID: LamaShqawaApp.appID,
        appSign: LamaShqawaApp.appSign,
        userID: 'user_${DateTime.now().millisecondsSinceEpoch % 10000}',
        userName: 'شقي_${DateTime.now().millisecond}',
        roomID: roomID,
        config: ZegoUIKitPrebuiltLiveAudioRoomConfig(
          seat: ZegoLiveAudioRoomSeatConfig(
            count: 8,
            backgroundBuilder: (context, size, user, extraInfo) {
              return Container(color: Colors.black26);
            },
          ),
        ),
      )
    ));
  }
}
