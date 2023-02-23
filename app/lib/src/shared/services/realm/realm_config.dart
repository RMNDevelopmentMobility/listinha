import 'package:realm/realm.dart';

import 'models/configuration_model.dart';
import 'models/task_model.dart';

LocalConfiguration config = Configuration.local(
  [
    ConfigurationModel.schema,
    TaskModel.schema,
    TaskBoardModel.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(
      ConfigurationModel('system'),
    );
  },
);
