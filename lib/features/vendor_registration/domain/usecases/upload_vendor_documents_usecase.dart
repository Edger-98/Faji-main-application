import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/vendor_document.dart';
import '../repositories/vendor_registration_repository.dart';

class UploadVendorDocumentsUseCase {
  final VendorRegistrationRepository repository;

  UploadVendorDocumentsUseCase(this.repository);

  Future<Either<Failure, VendorDocument>> call({
    required UploadDocumentRequest request,
  }) async {
    return await repository.uploadDocuments(
      request: request,
    );
  }
}
