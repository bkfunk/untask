import "package:flutter/material.dart";
import "package:isar/isar.dart";
import "package:path_provider/path_provider.dart";

import "src/app.dart";
import "src/features/memos/data/dto/isar_memo.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final db = Isar.open(
    schemas: [IsarMemoSchema],
    directory: dir.path,
  );
  runApp(UntaskApp(db: db));
}
