import 'package:poolino/features/login_feature/domain/entities/verify_entity.dart';

/// message : "با موفقیت احراز هویت شدید"
/// result : {"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5YjFkNjUyYy1lMjQzLTQxM2EtOTFhNi0zMjZkMDY1NTBjNjciLCJqdGkiOiIzOWNjNmVjOTI3MDVhNGNiMmFhYzgzOGE1Mjc2OWZjYzc1ZWM1MjUyMTE3NmExNTZkZWFkZWE0YmU1MWE4ZWViMzU2MDVmZWQ4NTU1N2RkMyIsImlhdCI6MTcwNjc3NTgyMi41MzU1MjYsIm5iZiI6MTcwNjc3NTgyMi41MzU1MjgsImV4cCI6MTcwNjc3NzYyMi41Mjk4MTQsInN1YiI6IjI1Iiwic2NvcGVzIjpbXX0.BaLOMcfWurfW1IoUIPBHbjvBi95aaVEwU1Bffxr0OQkEoCVs2IWMpVTSXA-4CvAmC64ofIQirhIb1KRaQ7QLyORHsH7Qoxi2cuY7VdJHsF2gjrVe-_n4_RAVfffQCPgRagxm3e7SckbXKYkf2uvdUPNZ5d_MgDCgyo_Qv_GqgRKtUBlLN4GtsWzHET1tBSdphSTX6KX31XrEOyUsqo3r5TnYwx53zhoOFQxQwLWBOG4b7X2rMYbPWIc67JgrAueI0SryQi2jP6rKMkxfPIO0v3Ga1FFoL1Sybh4a8EUNDN9-NtjRNCwVwZUD_RfnLNDwCNI5XbaEQW59AtZdybjFHb49Y6f48qzkdHvOK1zXjtEnvu_odHPIbIl5P4AByvG_bYduOL7_wZX1X9xOTFgtbZ4U0uznLaIUYr4tiIgjEalBnH1Ujqnw5lqvWE-04hB1ZdLu6w0pcMLFEVnBoiVA11BGW-RtyfdfgtWH20c3W10cBziGCN48twj5Wr9Yrt9VnuwkNtHaz4ujAISylRMuaxeUeGcKtPPb69mTWZ8FD4d2u8JzFixE1rbMX2fmPjMkGPHxYphSXy1m7AbdSZHubktHeuwFX29ZFXjCy-3j-Y9L7x3QQ4VYkIThegOVA-ouX9PNLl4ed0NTYxTdqbWI0tyNP7EGXQW2zRFLqSDbSRw","refresh_token":"def5020015f047a2b9257984a511cb6c309abab6059049368cb8bbf3a79f1aa50892236536a3b2f9e0c5a867d9fb6f4589a18f7c39cd677d16f0450eded9432c3dd1bf5401c0086011c515012ab38e2d05db4b0d9f6dc732e579ce3188451a9c33e8cf8803ca6d7aaa233ed731456a182c763741c3f54e4116bfb72eafc955820f503d7b50034101f32120f446cdf6fbec37beef8f8440f6cf205b7059be4b0b345ca2484c5dad45ea5c9a0f89f27d50aa7a6902482c4e6a2e402a88545b65cc450755ea290b188700a21e7bebbc403ae24e9ca263005765d7f46a0139b416e85bed388fa52ddac9ff7a778dadf07dd91ba458a24d3977c9eba88f909703a2dc2242ec110a16bec53701776ac28adab637546bfd966f771c8fbdda0167a10e8510c310e66fbea69e5d88e2b634a0740684d416d7cfd7f2d3aa6c205f43ba68dc2004d3def842b0e979362fd595fd307d1bf0b2e375cb88e32d65153c5297a1c03284bd24be914b43755ef9691a08dfd0e66e662afe71417478f32b8201ca0f3167dd33324a"}

class VerifyModel extends VerifyEntity {
  VerifyModel({
      String? message, 
      Result? result,
  }): super(
      message : message,
      result : result,
  );

  factory VerifyModel.fromJson(dynamic json) {
    return VerifyModel(
        message: json['message'],
        result: json['result'] != null ? Result.fromJson(json['result']) : null
    );

  }
  String? _message;
  Result? _result;
VerifyModel copyWith({  String? message,
  Result? result,
}) => VerifyModel(  message: message ?? _message,
  result: result ?? _result,
);
  String? get message => _message;
  Result? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }

}

/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5YjFkNjUyYy1lMjQzLTQxM2EtOTFhNi0zMjZkMDY1NTBjNjciLCJqdGkiOiIzOWNjNmVjOTI3MDVhNGNiMmFhYzgzOGE1Mjc2OWZjYzc1ZWM1MjUyMTE3NmExNTZkZWFkZWE0YmU1MWE4ZWViMzU2MDVmZWQ4NTU1N2RkMyIsImlhdCI6MTcwNjc3NTgyMi41MzU1MjYsIm5iZiI6MTcwNjc3NTgyMi41MzU1MjgsImV4cCI6MTcwNjc3NzYyMi41Mjk4MTQsInN1YiI6IjI1Iiwic2NvcGVzIjpbXX0.BaLOMcfWurfW1IoUIPBHbjvBi95aaVEwU1Bffxr0OQkEoCVs2IWMpVTSXA-4CvAmC64ofIQirhIb1KRaQ7QLyORHsH7Qoxi2cuY7VdJHsF2gjrVe-_n4_RAVfffQCPgRagxm3e7SckbXKYkf2uvdUPNZ5d_MgDCgyo_Qv_GqgRKtUBlLN4GtsWzHET1tBSdphSTX6KX31XrEOyUsqo3r5TnYwx53zhoOFQxQwLWBOG4b7X2rMYbPWIc67JgrAueI0SryQi2jP6rKMkxfPIO0v3Ga1FFoL1Sybh4a8EUNDN9-NtjRNCwVwZUD_RfnLNDwCNI5XbaEQW59AtZdybjFHb49Y6f48qzkdHvOK1zXjtEnvu_odHPIbIl5P4AByvG_bYduOL7_wZX1X9xOTFgtbZ4U0uznLaIUYr4tiIgjEalBnH1Ujqnw5lqvWE-04hB1ZdLu6w0pcMLFEVnBoiVA11BGW-RtyfdfgtWH20c3W10cBziGCN48twj5Wr9Yrt9VnuwkNtHaz4ujAISylRMuaxeUeGcKtPPb69mTWZ8FD4d2u8JzFixE1rbMX2fmPjMkGPHxYphSXy1m7AbdSZHubktHeuwFX29ZFXjCy-3j-Y9L7x3QQ4VYkIThegOVA-ouX9PNLl4ed0NTYxTdqbWI0tyNP7EGXQW2zRFLqSDbSRw"
/// refresh_token : "def5020015f047a2b9257984a511cb6c309abab6059049368cb8bbf3a79f1aa50892236536a3b2f9e0c5a867d9fb6f4589a18f7c39cd677d16f0450eded9432c3dd1bf5401c0086011c515012ab38e2d05db4b0d9f6dc732e579ce3188451a9c33e8cf8803ca6d7aaa233ed731456a182c763741c3f54e4116bfb72eafc955820f503d7b50034101f32120f446cdf6fbec37beef8f8440f6cf205b7059be4b0b345ca2484c5dad45ea5c9a0f89f27d50aa7a6902482c4e6a2e402a88545b65cc450755ea290b188700a21e7bebbc403ae24e9ca263005765d7f46a0139b416e85bed388fa52ddac9ff7a778dadf07dd91ba458a24d3977c9eba88f909703a2dc2242ec110a16bec53701776ac28adab637546bfd966f771c8fbdda0167a10e8510c310e66fbea69e5d88e2b634a0740684d416d7cfd7f2d3aa6c205f43ba68dc2004d3def842b0e979362fd595fd307d1bf0b2e375cb88e32d65153c5297a1c03284bd24be914b43755ef9691a08dfd0e66e662afe71417478f32b8201ca0f3167dd33324a"

class Result {
  Result({
      String? accessToken, 
      String? refreshToken,}){
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Result.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
  }
  String? _accessToken;
  String? _refreshToken;
Result copyWith({  String? accessToken,
  String? refreshToken,
}) => Result(  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
);
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['refresh_token'] = _refreshToken;
    return map;
  }

}