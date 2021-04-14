import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:weather/src/model/city_model.dart';
import 'package:weather/src/service_locator.dart';

class _InheritedStateContainer extends InheritedWidget {
  // Data is your entire state.
  final StateContainerState data;

  // You must pass through a child and your state.
  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  // This is a built in method which you can use to check if
  // any state has changed. If not, no reason to rebuild all the widgets
  // that rely on your state.
  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

class StateContainer extends StatefulWidget {
  // You must pass through a child.
  final Widget child;

  StateContainer({@required this.child});

  // This is the secret sauce. Write your own 'of' method that will behave
  // Exactly like MediaQuery.of and Theme.of
  // It basically says 'get the data from the widget of this type.
  static StateContainerState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
        .data;
  }

  @override
  StateContainerState createState() => StateContainerState();
}

/// App InheritedWidget
/// This is where we handle the global state and also where
/// we interact with the api's and make requests/handle+propagate responses
///
/// Basically the central hub behind the entire app
class StateContainerState extends State<StateContainer> {
  final Logger log = sl.get<Logger>();

  // The cities we are working with
  // Silverstone, UK => 2637827
  // São Paulo, Brazil => 3448433
  // Melbourne, Australia => 2158177
  // Monte Carlo, Monaco => 2992741

  //  Icon link sample => http://openweathermap.org/img/wn/10d@2x.png

  List<CityModel> cities = [
    CityModel(
      id: 2637827,
      name: 'Silverstone',
      country: 'UK',
    ),
    CityModel(
      id: 3448433,
      name: "São Paulo",
      country: 'Brazil',
    ),
    CityModel(
      id: 2158177,
      name: 'Melbourne',
      country: 'Australia',
    ),
    CityModel(
      id: 2992741,
      name: 'Monte Carlo',
      country: 'Monaco',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}
