import 'package:bloc/bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState(category: "انتخاب کنید"));

  void changeCategory(String category){
    emit(CategoryState(category: category));
  }
}
