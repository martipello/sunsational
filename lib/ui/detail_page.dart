import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sunsational/api/models/api_response.dart';
import 'package:sunsational/api/models/weather_response.dart';
import 'package:sunsational/di/dependency_injection_container.dart';
import 'package:sunsational/extensions/context_extensions.dart';
import 'package:sunsational/extensions/string_extension.dart';
import 'package:sunsational/ui/view_models/weather_view_model.dart';
import 'package:sunsational/ui/widgets/margins.dart';
import 'package:sunsational/ui/widgets/sunsational_error_widget.dart';
import 'package:sunsational/ui/widgets/theme_button.dart';
import 'package:sunsational/ui/widgets/view_constraint.dart';

import '../api/models/error_response.dart';
import '../api/models/weather.dart';

const kDetailPageName = 'Detail';
const kDetailPageRoute = '/detail';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.city});

  final String city;

  @override
  State<DetailPage> createState() => _DetailPageState();

  static navigate(BuildContext context, String city) {
    context.push(kDetailPageRoute, extra: city);
  }
}

class _DetailPageState extends State<DetailPage> {
  final _weatherViewModel = getIt.get<WeatherViewModel>();

  @override
  void initState() {
    super.initState();
    _weatherViewModel.fetchWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(kDetailPageName),
        actions: const [
          ThemeButton(),
        ],
      ),
      body: SafeArea(
        child: ViewConstraint(
          child: StreamBuilder<ApiResponse<WeatherResponse?>>(
            stream: _weatherViewModel.weatherStream,
            builder: (context, snapshot) {
              final status = snapshot.data;
              return switch (status) {
                null => _buildLoading(),
                OnLoad() => _buildLoading(),
                OnError(error: final error) => _buildError(error),
                OnComplete<WeatherResponse?>(data: final data) => _buildWeatherContent(data),
              };
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherContent(WeatherResponse? response) {
    final weatherResponse = response;
    final weather = weatherResponse?.weather.firstOrNull;
    if (weatherResponse == null || weather == null) {
      return _buildError(_createErrorResponse());
    }
    final icon = weather.icon;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Stack(
            children: [
              if (!icon.isNullOrEmpty())
                Align(
                  alignment: Alignment.topRight,
                  child: _buildWeatherImage(icon),
                ),
              _buildWeatherHeroDetails(
                weatherResponse,
                weather,
              ),
            ],
          ),
          _buildWeatherMetaData(weatherResponse),
        ],
      ),
    );
  }

  Column _buildWeatherHeroDetails(
    WeatherResponse weatherResponse,
    Weather weather,
  ) {

    final temperature = weatherResponse.main?.temp;
    final description = weather.description;
    final location = weatherResponse.name;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        kMediumMargin,
        if (!location.isNullOrEmpty()) ...[
          Text(
            location!,
            style: context.text.bodyLarge,
          ),
          kMediumMargin,
        ],
        if (temperature != null) ...[
          Text(
            '${temperature.toStringAsFixed(1)} °C',
            style: context.text.displayMedium,
          ),
          kMediumMargin,
        ],
        if (!description.isNullOrEmpty()) ...[
          Text(
            description!.capitalize,
            style: context.text.headlineMedium,
          ),
          kMediumMargin,
        ],
      ],
    );
  }

  Widget _buildWeatherImage(String? icon) {
    return Image.network(
      _weatherViewModel.getWeatherIconUrl(icon!),
      width: 200.0,
      height: 120.0,
      fit: BoxFit.cover,
    );
  }


  Widget _buildWeatherMetaData(WeatherResponse weatherResponse) {
    final feelsLike = weatherResponse.main?.feelsLike;
    final humidity = weatherResponse.main?.humidity;
    final pressure = weatherResponse.main?.pressure;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(),
        kMediumMargin,
        if (feelsLike != null) ...[
          Text(
            'Feels like ${feelsLike.toStringAsFixed(1)} °C',
            style: context.text.bodyMedium,
          ),
          kMediumMargin,
        ],
        if (humidity != null) ...[
          Text(
            'Humidity $humidity%',
            style: context.text.bodyMedium,
          ),
          kMediumMargin,
        ],
        if (pressure != null) ...[
          Text(
            'Pressure $pressure hPa',
            style: context.text.bodyMedium,
          ),
          kMediumMargin,
                  ],
      ],
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(ErrorResponse? error) {
    return Padding(
      padding: const EdgeInsets.only(top: 56.0, left: 16.0, right: 16.0),
      child: SunsationalErrorWidget(
        error: error,
      ),
    );
  }

  ErrorResponse _createErrorResponse() {
    return ErrorResponse((b) => b.message = 'There was an error with the weather!');
  }
}
