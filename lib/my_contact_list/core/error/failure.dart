import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  Failure([List props = const<dynamic>[]]): super([props]);
}

class EmptyListFailure extends Failure{

  EmptyListFailure(): super();
}

//general failures
class DatabaseFailure extends Failure{}

class CreateFailure extends Failure{}

class UpdateFailure extends Failure{}

class DeleteFailure extends Failure{}

class QueryFailure extends Failure{}