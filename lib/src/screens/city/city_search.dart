import 'package:flutter/material.dart';
import 'package:weather/src/appstate_container.dart';
import 'package:weather/src/model/city_model.dart';
import 'package:sizer/sizer.dart';
import 'package:weather/src/screens/city/city_list.dart';

class CitySearch extends StatefulWidget {
  @override
  _CitySearchState createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  /// Will hole the searching results
  ValueNotifier<List<CityModel>> filtered = ValueNotifier<List<CityModel>>([]);

  // To help in clearing the text and obtaining input data
  TextEditingController searchController = TextEditingController();

  //  To know if keyboard is showing
  FocusNode searchFocus = FocusNode();

  bool searching = false;

  @override
  Widget build(BuildContext context) {
    // The cities we're working with
    List<CityModel> _cities = StateContainer.of(context).cities;

    return ValueListenableBuilder<List<CityModel>>(
      valueListenable: filtered,
      builder: (BuildContext context, List<CityModel> result, _) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 1.5.h),
          width: 100.0.w,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black87,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 1.0.w),
                  leading: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      searchController.clear();
                      searching = false;
                      filtered.value = [];
                      if (searchFocus.hasFocus) searchFocus.unfocus();
                    },
                    icon: Icon(
                      Icons.cancel_sharp,
                      color: Colors.white,
                    ),
                  ),
                  title: TextField(
                      controller: searchController,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.0.sp,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        hintText: 'Search by city name',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 11.0.sp,
                        ),
                        hintMaxLines: 1,
                      ),
                      onChanged: (String text) {
                        if (text.length > 0) {
                          searching = true;
                          filtered.value = [];

                          _cities.forEach((item) {
                            if (item.name
                                .toString()
                                .toLowerCase()
                                .contains(text.toLowerCase())) {
                              filtered.value.add(item);
                            }
                          });
                        } else {
                          searching = false;
                          filtered.value = [];
                        }
                      }),
                ),
              ),
              Expanded(
                child: result.length == 0
                    ? searching && searchFocus.hasFocus
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : searchController.value.text.length > 0
                            ? Center(
                                child: Text(
                                  'No results found',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0.sp,
                                  ),
                                ),
                              )
                            : CityUtil.cityList(
                                context: context,
                                cities: _cities,
                              )
                    : result.length > 0
                        ? CityUtil.cityList(
                            context: context,
                            cities: result,
                          )
                        : searchController.value.text.length > 0
                            ? Center(
                                child: Text(
                                  'No results found',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0.sp,
                                  ),
                                ),
                              )
                            : CityUtil.cityList(
                                context: context,
                                cities: _cities,
                              ),
              ),
            ],
          ),
        );
      },
    );
  }
}
