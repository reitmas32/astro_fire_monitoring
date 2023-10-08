import 'package:astro_fire_monitoring/ui/molecules/hour_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hourSliderControllerProvider =
    StateProvider((ref) => HourSliderController());

final hourProvider = StateProvider((ref) => '00:00');
