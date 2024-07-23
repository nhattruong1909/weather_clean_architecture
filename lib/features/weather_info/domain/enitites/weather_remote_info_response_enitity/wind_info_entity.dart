import 'package:equatable/equatable.dart';

class WindInfoEntity extends Equatable{
  final double? speed;
  final int? deg;

  const WindInfoEntity({
    this.speed,
    this.deg
});



  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[speed,deg];
}