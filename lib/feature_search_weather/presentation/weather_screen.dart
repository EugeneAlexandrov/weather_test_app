import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_test_app/core/locator.dart';
import 'package:weather_test_app/feature_search_weather/presentation/weather_cubit.dart';
import 'package:weather_test_app/feature_search_weather/presentation/weather_state.dart';
import 'package:weather_test_app/feature_search_weather/presentation/widgets/weather_info.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<WeatherCubit>(),
      child: BlocListener<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state.isBadRequest) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Error'),
              ),
            );
          }
        },
        child: BlocBuilder<WeatherCubit, WeatherState>(
          bloc: locator.get<WeatherCubit>(),
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.response?.name ?? ''),
              ),
              body: Center(
                child: (state.isLoading)
                    ? const CircularProgressIndicator()
                    : state.response != null
                        ? WeatherInfoWidget(weather: state.response!)
                        : const Text('ERROR'),
              ),
            );
          },
        ),
      ),
    );
  }
}
