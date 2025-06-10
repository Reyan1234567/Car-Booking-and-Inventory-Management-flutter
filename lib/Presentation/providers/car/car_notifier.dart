import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Domain/usecases/getCarsUseCase.dart';
import 'car_state.dart';

class carNotifier extends StateNotifier<carState>{
  final getCars getcars;

  carNotifier(this.getcars):super(carState());

  Future<void> getccars()async{
    try{
      state=state.copyWith(isLoading:true);
      final response=await getcars();
      state=state.copyWith(isLoading: false, result: response);
    }
    catch(e){
      state=state.copyWith(error: e.toString());
    }
  }

}