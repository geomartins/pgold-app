import 'package:get/get.dart';

class DashboardState {
  final todos = Rx<List<String>>([]);
  final todoColors = Rx<List<String>>([
    '#00A0FA',
    '#F59600',
    '#003C6E',
    '#F01428',
    '#00A0FA',
    '#F59600',
    '#003C6E',
    '#F01428',
  ]);
  final isAdsLoading = false.obs;
  final isTodosLoading = false.obs;
}
