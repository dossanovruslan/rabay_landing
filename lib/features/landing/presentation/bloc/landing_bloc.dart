import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/url_helper.dart';
import '../../data/models/screenshot_model.dart';
import 'landing_event.dart';
import 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(const LandingState()) {
    on<LoadScreenshots>(_onLoadScreenshots);
    on<ChangeScreenshot>(_onChangeScreenshot);
    on<OpenStoreLink>(_onOpenStoreLink);
    on<OpenSocialLink>(_onOpenSocialLink);
  }

  Future<void> _onLoadScreenshots(
    LoadScreenshots event,
    Emitter<LandingState> emit,
  ) async {
    emit(state.copyWith(status: LandingStatus.loading));

    try {
      final screenshots = AppConstants.screenshots
          .asMap()
          .entries
          .map((entry) => ScreenshotModel.fromPath(entry.value, entry.key))
          .toList();

      emit(
        state.copyWith(status: LandingStatus.loaded, screenshots: screenshots),
      );
    } catch (e) {
      emit(
        state.copyWith(status: LandingStatus.error, errorMessage: e.toString()),
      );
    }
  }

  void _onChangeScreenshot(ChangeScreenshot event, Emitter<LandingState> emit) {
    emit(state.copyWith(currentScreenshotIndex: event.index));
  }

  Future<void> _onOpenStoreLink(
    OpenStoreLink event,
    Emitter<LandingState> emit,
  ) async {
    try {
      await UrlHelper.launchURL(event.url);
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Could not open link'));
    }
  }

  Future<void> _onOpenSocialLink(
    OpenSocialLink event,
    Emitter<LandingState> emit,
  ) async {
    try {
      await UrlHelper.launchURL(event.url);
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Could not open link'));
    }
  }
}
