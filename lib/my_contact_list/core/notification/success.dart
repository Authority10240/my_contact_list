import 'package:equatable/equatable.dart';

abstract class Success extends Equatable{
  Success ([List props = const<dynamic>[]]) :super([props]);
}

class DeleteSuccess extends Success{
  DeleteSuccess();
}

class UpdateSuccess extends Success{

  UpdateSuccess();
}

class CreateSuccess extends Success{

  CreateSuccess();
}