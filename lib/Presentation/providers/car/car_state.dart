import 'package:flutterpolo/Data/models/CarModel.dart';

class carState{
  bool? isLoading=false;
  final List<CarModel>? result;
  final String? error;

  carState({this.isLoading, this.result, this.error});

  carState copyWith({bool? isLoading, List<CarModel>? result, String? error}){
    return carState(isLoading:isLoading??this.isLoading, result:result??this.result, error:error??this.error);
  }
}