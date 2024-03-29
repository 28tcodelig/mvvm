import 'package:complete_advance_flutter/data/network/failure.dart';
import 'package:complete_advance_flutter/data/request/request.dart';
import 'package:complete_advance_flutter/domain/model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
