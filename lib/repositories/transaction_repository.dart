import 'package:buynsell/models/transaction_model.dart';

/// Abstract repository defining the transaction and order data contract
/// for the IIT BHU Buy & Sell Marketplace app.
abstract class TransactionRepository {
  /// Retrieves all transactions associated with a given [userId].
  ///
  /// TODO: Fetch transactions list for user.
  Future<List<TransactionModel>> getTransactions(String userId);

  /// Retrieves a specific transaction by its [transactionId].
  ///
  /// TODO: Fetch transaction details by ID.
  Future<TransactionModel?> getTransactionById(String transactionId);

  /// Creates a new transaction record for a product purchase.
  ///
  /// TODO: Persist new transaction details into backend.
  Future<TransactionModel> createTransaction(TransactionModel transaction);

  /// Updates the status of an existing transaction (e.g., pending, completed, cancelled).
  ///
  /// TODO: Update transaction state in database.
  Future<TransactionModel> updateTransactionStatus(
    String transactionId,
    String status,
  );

  /// Retrieves transactions where the user is the buyer.
  ///
  /// TODO: Query transactions filtered by buyer ID.
  Future<List<TransactionModel>> getTransactionsByBuyer(String buyerId);

  /// Retrieves transactions where the user is the seller.
  ///
  /// TODO: Query transactions filtered by seller ID.
  Future<List<TransactionModel>> getTransactionsBySeller(String sellerId);
}
