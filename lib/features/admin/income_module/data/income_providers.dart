import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'income_repository.dart';

final incomeHeadsProvider =
    FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
      final repo = ref.watch(incomeRepositoryProvider);
      return repo.getIncomeHeads();
    });

final incomesProvider = FutureProvider.autoDispose<List<Map<String, dynamic>>>((
  ref,
) async {
  final repo = ref.watch(incomeRepositoryProvider);
  return repo.getIncomes();
});

// A provider that aggregates income data for a quick overview
final incomeStatsProvider = FutureProvider.autoDispose<Map<String, dynamic>>((
  ref,
) async {
  final incomes = await ref.watch(incomesProvider.future);

  double totalIncome = 0;
  int receiptCount = incomes.length;

  for (var income in incomes) {
    totalIncome += ((income['amount'] as num?)?.toDouble() ?? 0.0);
  }

  return {'totalIncome': totalIncome, 'receiptCount': receiptCount};
});
