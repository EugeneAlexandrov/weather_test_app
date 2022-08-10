import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_test_app/app_router.dart';
import 'package:weather_test_app/app_strings.dart';
import 'package:weather_test_app/core/locator.dart';
import 'package:weather_test_app/feature_city_validate/presentation/city_cubit.dart';
import 'package:weather_test_app/feature_search_weather/presentation/weather_cubit.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

//Controllers
final cityController = TextEditingController();

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, String>(
      bloc: locator.get<CityCubit>(),
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(AppStrings.appTitle),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                locator.get<CityCubit>().changeQuery(value);
              },
              controller: cityController,
              textAlign: TextAlign.start,
              autofocus: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'Choose City',
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColorLight, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2),
                ),
              ),
            ),
          ),
          floatingActionButton: ElevatedButton(
              onPressed: state == ""
                  ? () {}
                  : () {
                      Navigator.pushNamed(context, AppRouter.details);
                      locator
                          .get<WeatherCubit>()
                          .onTapLoading(cityController.text);
                    },
              child: const Text(AppStrings.button)),
        );
      },
    );
  }
}
