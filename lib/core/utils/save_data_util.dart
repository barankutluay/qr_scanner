import 'package:qr_code_utility/core/utils/logger_util.dart';
import 'package:qr_code_utility/data/models/qr_history_model.dart';
import 'package:qr_code_utility/data/repos/qr_history_repository.dart';

Future<void> saveData({
  required String url,
  required DateTime time, // * current time, format -> dd.MM.yyyy HH:mm:ss
  required int type, // * 0: generated, 1: scanned
}) async {
  try {
    final qrHistoryModel = QrHistoryModel(url: url, time: time, type: type);

    await QrHistoryRepository.instance.insertHistory(qrHistoryModel);
    LoggerUtil.info('Data has been saved: ${qrHistoryModel.formattedTime}');
  } catch (error, stackTrace) {
    LoggerUtil.error('Data save error: $error', error, stackTrace);
    rethrow;
  }
}
