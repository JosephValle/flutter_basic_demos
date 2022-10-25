part of 'download_bloc.dart';

abstract class DownloadState extends Equatable {
  const DownloadState();
}

class DownloadInitial extends DownloadState {
  @override
  List<Object> get props => [];
}

class DownloadLoading extends DownloadState {
  @override
  List<Object> get props => [];
}

class DownloadLoaded extends DownloadState {

  const DownloadLoaded();

  @override
  List<Object> get props => [];
}

class DownloadError extends DownloadState {
  final String error;

  const DownloadError(this.error);

  @override
  List<Object> get props => [error];
}
