import 'package:bloc/bloc.dart';
import 'package:ipvp/pages/Company.dart';
import 'package:ipvp/pages/HelpFeedback.dart';
import 'package:ipvp/pages/ReviewReport.dart';
import 'package:ipvp/pages/YourActivity.dart';
import 'package:ipvp/pages/homepage.dart';
import 'package:ipvp/pages/myaccountpage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  CompanyClickedEvent,
  YourActivityClickedEvent,
  ReviewReportClickedEvent,
  FeedbackClickedEvent,
}

abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);
  @override
  NavigationStates get inititalState => Homepage();
  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield Homepage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccount();
        break;
      case NavigationEvents.CompanyClickedEvent:
        yield Company();
        break;
      case NavigationEvents.YourActivityClickedEvent:
        yield YourActivity();
        break;
      case NavigationEvents.ReviewReportClickedEvent:
        yield ReviewReport();
        break;
      case NavigationEvents.FeedbackClickedEvent:
        yield HelpFeedback();
        break;
    }
  }
}