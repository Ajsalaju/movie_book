import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexmovieprovider = StateProvider<int>((ref) => 0);
final bottomindexprovider = StateProvider<int>((ref) => 0);

final indicatorprovider = StateProvider<int>((ref) => 0);
final toggletrendprovider = StateProvider<int>((ref) => 0);
final toggleprovider = StateProvider<bool>((ref) => true);
