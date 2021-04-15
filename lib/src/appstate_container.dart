import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:weather/src/model/city_model.dart';
import 'package:weather/src/model/forecast_model.dart';
import 'package:weather/src/network/api_service.dart';
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

  // To check help in showing a loader while fetching data from api
  bool isLoading = false;

  // conatins thecurrent day forecast
  List<ForecastModel> currentWeather = [];

  // Contains the 5 Day weather forecast
  Map<int, List<ForecastModel>> weatherforecast = {};

  @override
  void initState() {
    super.initState();

    // Load current weather for our cities
    loadCityWeathers();
  }

  /// Load the weather of our given cities
  void loadCityWeathers() async {
    /// Show that loading to true
    setState(() {
      isLoading = true;
    });

    /// Loop through each of th 4 cities
    for (var city in cities) {
      // If we get atleast one result we set the loader to false
      if (currentWeather.length > 0) {
        setState(() {
          isLoading = false;
        });
      }

      /// Get the current weather details
      await getCurrentWeather(city.id);
    }

    /// Log the total number of current wether details tht we have... we asset it is 4
    log.d(currentWeather.length);
  }

  /// Helper function to get the current weather of a city by its ID
  Future<void> getCurrentWeather(int cityId) async {
    ForecastModel weatherResult =
        await sl.get<ApiService>().getCurrentWeather(cityID: cityId);

    setState(
      () {
        currentWeather.add(weatherResult);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}
