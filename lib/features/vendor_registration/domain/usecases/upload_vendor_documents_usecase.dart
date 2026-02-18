import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/vendor_document.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/repositories/vendor_registration_repository.dart';

class UploadVendorDocumentsUseCase {

  UploadVendorDocumentsUseCase(this.repository);
  final VendorRegistrationRepository repository;

  Future<Either<Failure, VendorDocument>> call({
    required UploadDocumentRequest request,
  }) async => await repository.uploadDocuments(
      request: request,
    );
}
