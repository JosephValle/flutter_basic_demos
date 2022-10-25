import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';

import '../../models/user.dart';
import '../../repositories/download_repo.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  // Instance variables
  final DownloadRepository downloadRepository;
  User? user;
  File? file;

  DownloadBloc({required this.downloadRepository}) : super(DownloadInitial()) {
    on<DownloadImage>((event, emit) async {
      // Start by letting the user know download is in progress
      emit(DownloadLoading());

      try {
        // Get File and user data from the repositories
        file = await downloadRepository.getFile(event.imageUrl);
        user = await downloadRepository.getUser(event.userUrl);
        // Once done, emit that it is done
        emit(const DownloadLoaded());
      } catch(e) {
        // If there was an error, report it
        emit(DownloadError(e.toString()));
      }
    });

    on<ResetDownload>((event, emit) async {
      // Resetting the file and user values, and resetting state
      file = null;
      user = null;
      emit(DownloadInitial());
    });
  }
}
