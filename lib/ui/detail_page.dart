import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sunsational/api/models/api_response.dart';
import 'package:sunsational/api/models/weather_response.dart';
import 'package:sunsational/di/dependency_injection_container.dart';
import 'package:sunsational/ui/view_models/weather_view_model.dart';
import 'package:sunsational/ui/widgets/sunsational_error_widget.dart';
import 'package:sunsational/ui/widgets/theme_button.dart';

import '../api/models/error_response.dart';

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
    // TODO: implement initState
    super.initState();
    _weatherViewModel.fetchWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(kDetailPageName),
          actions: const [
            ThemeButton(),
          ],
        ),
        body: StreamBuilder<ApiResponse<WeatherResponse?>>(
          stream: _weatherViewModel.weatherStream,
          builder: (context, snapshot) {
            final status = snapshot.data;
            return switch (status) {
              null => _buildLoading(),
              OnLoad() => _buildLoading(),
              OnError(message: final message, error: final error) => _buildError(
                error: error,
                message: message,
              ),
              OnComplete<WeatherResponse?>(data: final data) when data != null => _buildWeatherContent(data),
              (_) => _buildError(message: 'This event may have been deleted.'),
            };
          }
        ),
      ),
    );
  }

  Widget _buildWeatherContent(WeatherResponse weatherResponse) {
    return Center(
      child: Text(weatherResponse.name!),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError({
    ErrorResponse? error,
    String? message,
  }) {
    return SunsationalErrorWidget.detailed(
      error: error,
      errorMessage: message,
      onTryAgain: () {
        _weatherViewModel.fetchWeather(widget.city);
      },
    );
  }

}
