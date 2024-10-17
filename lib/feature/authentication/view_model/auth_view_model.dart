import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wac_sports/feature/authentication/model/auth_input_model.dart';
import 'package:wac_sports/feature/authentication/repo/auth_repo.dart';

class AuthViewModel extends ChangeNotifier with AuthViewModelHelpers {
  final AuthRepository authRepository;
  AuthViewModel({required this.authRepository});
  void loginWithEmailAndPassword(AuthInputModel data,
      {VoidCallback? onSuccess, Function(String message)? onError}) async {
    updateButtonLoadingState(LoadState.loading);

    startProgressAnimation();

    final response = await authRepository.loginWithEmailAndPassword(data);

    await completeProgress();

    if (response.result) {
      onSuccess?.call();
    } else {
      onError?.call(response.message);
    }
    resetProgress();
    updateButtonLoadingState(LoadState.loaded);
  }

  void signUpWithEmailAndPassword(AuthInputModel data,
      {VoidCallback? onSuccess, Function(String error)? onError}) async {
    updateButtonLoadingState(LoadState.loading);

    startProgressAnimation();

    final response = await authRepository.signUpWithEmailAndPassword(data);

    await completeProgress();

    if (response.result) {
      onSuccess?.call();
    } else {
      onError?.call(response.message);
    }
    resetProgress();
    updateButtonLoadingState(LoadState.loaded);
  }

  @override
  updateButtonLoadingState(LoadState loadState) {
    buttonLoadState = loadState;
    notifyListeners();
  }

  @override
  startProgressAnimation() async {
    _progress = 0;
    _progressTimer?.cancel();
    _progressTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_progress < 85) {
        _progress += 5;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Future<void> completeProgress() async {
    _progressTimer?.cancel();
    // Quickly animate to 100%
    while (_progress < 100) {
      _progress += 5;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 20));
    }
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  updateProgress(double progress) {
    _progress = progress;
    notifyListeners();
  }

  void resetProgress() {
    _progressTimer?.cancel();
    _progress = 0;
    notifyListeners();
  }
}

mixin AuthViewModelHelpers {
  Timer? _progressTimer;
  double _progress = 0;
  double get progress => _progress;
  updateProgress(double progress);
  startProgressAnimation();
  Future<void> completeProgress();
  LoadState buttonLoadState = LoadState.loaded;
  void updateButtonLoadingState(LoadState loadState);
}

enum LoadState { loaded, loading }
