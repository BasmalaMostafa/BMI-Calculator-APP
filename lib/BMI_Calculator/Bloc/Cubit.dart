import 'package:flutter_bloc/flutter_bloc.dart';

import 'States.dart';

class BMICubit extends Cubit<BMIStates>{
  BMICubit(initialState) : super(BMIInitialState());

  static BMICubit get(context)=> BlocProvider.of(context);

  bool isFemale=true;
  double height=120;
  double age=20;
  double weight=60;

  void setHeight(value){
    height=value;
    emit(SetHeight());
  }

  void decreaseWeight(){
    weight--;
    emit(DecreaseWeight());
  }

  void increaseWeight(){
    weight++;
    emit(IncreaseWeight());
  }

  void decreaseAge(){
    age--;
    emit(DecreaseAge());
  }

  void increaseAge(){
    age++;
    emit(IncreaseAge());
  }
  void switchGender(female){
    isFemale=female;
    emit(SwitchGender());
  }

}