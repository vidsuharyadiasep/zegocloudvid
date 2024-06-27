import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class Videocallscreen extends StatefulWidget {
  final String userId;
  final String userName;
  final String callId;
  const Videocallscreen({
    super.key,
    required this.userId,
    required this.userName,
    required this.callId
  });

  @override
  State<Videocallscreen> createState() => _VideocallscreenState();
}

class _VideocallscreenState extends State<Videocallscreen> {
  @override
  Widget build(BuildContext context) {
     return ZegoUIKitPrebuiltCall(
      appID: 1761772874, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: '5d73ef68a58969ac69cc1b3804e626ce3212aa65c92ee2fbabfe3dbd4bcc0de7', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: widget.userId,
      userName: widget.userName,
      callID: widget.callId,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}