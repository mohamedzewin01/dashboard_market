// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/add_images/data/data_sources/images_datasources.dart'
    as _i759;
import '../../features/add_images/data/repositories/images_repo_impl.dart'
    as _i340;
import '../../features/add_images/domain/repositories/images_repo.dart'
    as _i378;
import '../../features/add_images/domain/use_cases/images_use_case.dart'
    as _i728;
import '../../features/add_images/presentation/manager/images_cubit.dart'
    as _i208;
import '../../features/products/data/data_sources/products_data_source_repo.dart'
    as _i1;
import '../../features/products/data/data_sources/products_data_source_repo_impl.dart'
    as _i647;
import '../../features/products/data/repo_impl/products_repo_impl.dart'
    as _i249;
import '../../features/products/domain/repo/products_repo.dart' as _i482;
import '../../features/products/domain/use_cases/products_use_case.dart'
    as _i258;
import '../../features/products/presentation/cubit/home_cubit.dart' as _i537;
import '../api/api_manager/api_manager.dart' as _i680;
import '../api/dio_module.dart' as _i784;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.providerDio());
    gh.factory<_i680.ApiService>(() => _i680.ApiService(gh<_i361.Dio>()));
    gh.factory<_i1.ProductsDataSourceRepo>(
        () => _i647.ProductsDataSourceRepoImpl(gh<_i680.ApiService>()));
    gh.factory<_i759.ImagesDataSources>(
        () => _i759.ImagesDataSources(apiService: gh<_i680.ApiService>()));
    gh.factory<_i482.ProductsRepo>(
        () => _i249.ProductsRepoImpl(gh<_i1.ProductsDataSourceRepo>()));
    gh.factory<_i208.ImagesCubit>(
        () => _i208.ImagesCubit(gh<_i759.ImagesDataSources>()));
    gh.factory<_i378.ImagesRepo>(
        () => _i340.ImagesRepoImpl(gh<_i759.ImagesDataSources>()));
    gh.factory<_i728.ImagesUseCase>(
        () => _i728.ImagesUseCase(gh<_i378.ImagesRepo>()));
    gh.factory<_i258.HomeUseCase>(
        () => _i258.HomeUseCase(gh<_i482.ProductsRepo>()));
    gh.factory<_i537.ProductsCubit>(
        () => _i537.ProductsCubit(gh<_i258.HomeUseCase>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
