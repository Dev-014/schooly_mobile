import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'expense_repository.dart';

final expenseHeadsProvider =
    FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
      final repo = ref.watch(expenseRepositoryProvider);
      return repo.getExpenseHeads();
    });

final expensesProvider = FutureProvider.autoDispose<List<Map<String, dynamic>>>(
  (ref) async {
    final repo = ref.watch(expenseRepositoryProvider);
    return repo.getExpenses();
  },
);

// A provider that aggregates expense data for a quick overview
final expenseStatsProvider = FutureProvider.autoDispose<Map<String, dynamic>>((
  ref,
) async {
  final expenses = await ref.watch(expensesProvider.future);

  double totalExpense = 0;
  int receiptCount = expenses.length;

  for (var expense in expenses) {
    totalExpense += ((expense['amount'] as num?)?.toDouble() ?? 0.0);
  }

  return {'totalExpense': totalExpense, 'receiptCount': receiptCount};
});
