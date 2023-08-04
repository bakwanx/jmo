import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'navigator_state.dart';

class NavigatorCubit extends Cubit<NavigatorState> {
  NavigatorCubit() : super(NavigatorInitial());

  final _currentIndexPage = BehaviorSubject<int>();
  Stream<int> get currentIndexPageStream => _currentIndexPage.stream;

  void setCurrentIndexPage(int index){
    _currentIndexPage.sink.add(index);
  }

  void initIndexPage(){
    _currentIndexPage.sink.add(0);
  }
}
