import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:weather/src/appstate_container.dart';
import 'package:weather/src/model/forecast_model.dart';

class City extends StatefulWidget {
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  List<bool> isVisible = List<bool>.generate(40, (_) => false);

  // Loader for each city forecast page

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    //  We run this command after the build method is finished
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        // Get data parsed from previous screen
        Map arguments = ModalRoute.of(context).settings.arguments as Map;

        // We fetch forecast
        await StateContainer.of(context).getForecast(arguments['cityId']);

        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get data parsed from previous screen
    Map arguments = ModalRoute.of(context).settings.arguments as Map;

    // Get the city name
    var city = StateContainer.of(context).cities.singleWhere(
          (element) => element.id == arguments['cityId'],
        );

    List<ForecastModel> _forecast =
        StateContainer.of(context).weatherforecast[arguments['cityId']];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${city.name}',
          style: TextStyle(
            fontSize: 12.0.sp,
          ),
        ),
      ),
      body: SafeArea(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : _forecast == null || _forecast.length == 0
                  ? Center(
                      child: Text(
                        'No data available',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _forecast.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0.w, vertical: 2.0.h),
                      itemBuilder: (BuildContext context, int index) {
                        var dataforecast = _forecast[index];

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isVisible[index] = !isVisible[index];
                              });
                            },
                            child: Container(
                              height: isVisible[index] ? null : 60,
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.5.w,
                                vertical: 0.5.h,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${dataforecast.dtISo}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        !isVisible[index]
                                            ? Icons.arrow_drop_down
                                            : Icons.arrow_drop_up,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                  Visibility(
                                    visible: isVisible[index],
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: ListTile(
                                                title: Text(
                                                  'Humidity',
                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      FlutterIcons.water_mco,
                                                      color: Colors.blue,
                                                      size: 17.0.sp,
                                                    ),
                                                    SizedBox(width: 1.0.w),
                                                    Text(
                                                      '${dataforecast.humidity}%',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 11.0.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: ListTile(
                                                title: Text(
                                                  'Wind Speed',
                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                      FlutterIcons.wind_faw5s,
                                                      color: Colors.blue,
                                                      size: 15.0.sp,
                                                    ),
                                                    SizedBox(width: 1.0.w),
                                                    Text(
                                                      '${dataforecast.windSpeed} m/s',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 11.0.sp,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: ListTile(
                                                title: Text(
                                                  'Feels Like',
                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  '${dataforecast.feelsLike}\u00B0',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.0.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: ListTile(
                                                title: Text(
                                                  'Weather',
                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  '${dataforecast.weather.description}',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.0.sp,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: ListTile(
                                                title: Text(
                                                  'High',
                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  '${dataforecast.tempMax}\u00B0',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.0.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: ListTile(
                                                title: Text(
                                                  'Low',
                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 12.0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  '${dataforecast.tempMin}\u00B0',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 11.0.sp,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )),
    );
  }
}
