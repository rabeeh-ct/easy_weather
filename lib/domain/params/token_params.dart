import 'package:equatable/equatable.dart';

class TokenParams extends Equatable {
  final String token;

  const TokenParams({required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [token];

  factory TokenParams.fromMap(Map<String, dynamic> map) =>
      TokenParams(token: map["token"]);

  Map<String,dynamic> toMap()=>{
    "token":token
  };
}
