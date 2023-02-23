import 'package:flutter/material.dart';
import 'package:listinha/src/configuration/services/configuration_service.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);

  final ConfigurationService _configurationService;

  AppStore(this._configurationService) {
    initRealm();
  }

  void initRealm() {
    final model = _configurationService.getConfiguration();
    themeMode.value = _getThemeModeByName(model.themeModeName);
    syncDate.value = model.syncDate;
  }

  void saveThemeMode() {
    _configurationService.saveConfiguration(
      themeMode.value.name,
      syncDate.value,
    );
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      saveThemeMode();
    }
  }

  void setSyncDate(DateTime? date) {
    if (date != null) {
      syncDate.value = date;
      saveThemeMode();
    }
  }

  void deleteApp() {
    _configurationService.deleteAll();
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
