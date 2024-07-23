import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:weather_clean_architecture/core/network/network_exception.dart';

abstract class BaseParamsUsecase<Type, Request> {
  Future<Either<NetworkException, Type>> call(Request? params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => <Object>[];
}
