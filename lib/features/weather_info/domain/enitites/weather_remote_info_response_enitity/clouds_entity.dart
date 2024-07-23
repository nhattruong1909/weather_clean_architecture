import 'package:equatable/equatable.dart';

class CloudsEntity extends Equatable{
  final int? all;

  const CloudsEntity({this.all});

  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[all];



}