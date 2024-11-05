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
import 'package:untitled/src/core/dependency_injection.dart/dependency_injector.dart'
    as _i971;
import 'package:untitled/src/core/services/network_service.dart' as _i521;
import 'package:untitled/src/features/items/data/datasources/local/item_local_datasource.dart'
    as _i97;
import 'package:untitled/src/features/items/data/datasources/remote/item_firebase_datasource.dart'
    as _i130;
import 'package:untitled/src/features/items/data/datasources/remote/items_datasource.dart'
    as _i374;
import 'package:untitled/src/features/items/data/repositories/items_respository_impl.dart'
    as _i506;
import 'package:untitled/src/features/items/domain/repositories/items_repository.dart'
    as _i844;
import 'package:untitled/src/features/items/domain/usecases/get_item_details_usecase.dart'
    as _i775;
import 'package:untitled/src/features/items/domain/usecases/get_item_price_usecase.dart'
    as _i872;
import 'package:untitled/src/features/items/domain/usecases/get_items_usecase.dart'
    as _i558;
import 'package:untitled/src/features/items/presentation/cubit/item_details_cubit/item_details_cubit.dart'
    as _i142;
import 'package:untitled/src/features/items/presentation/cubit/item_list_cubit/items_cubit.dart'
    as _i788;

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
    gh.factory<_i130.ItemFirebaseDatasource>(
        () => _i130.ItemFirebaseDataSourceImpl());
    gh.factory<_i361.Dio>(
      () => dioModule.dio,
      instanceName: 'DioWithInterceptors',
    );
    gh.factory<_i361.Dio>(
      () => dioModule.dioWithoutInterceptors,
      instanceName: 'DioWithoutInterceptors',
    );
    gh.factory<_i521.NetworkService>(() =>
        _i521.DioService(gh<_i361.Dio>(instanceName: 'DioWithInterceptors')));
    gh.factory<_i374.ItemsDatasource>(
        () => _i374.ItemsDatasourceImpl(gh<_i521.NetworkService>()));
    gh.factory<_i97.ItemsLocalDataSource>(() => _i97.ItemLocalDataSourceImpl());
    gh.factory<_i844.ItemsRepository>(() => _i506.ItemsRepositoryImpl(
          gh<_i374.ItemsDatasource>(),
          gh<_i97.ItemsLocalDataSource>(),
          gh<_i130.ItemFirebaseDatasource>(),
        ));
    gh.factory<_i558.GetItemsUsecase>(
        () => _i558.GetItemsUsecase(gh<_i844.ItemsRepository>()));
    gh.factory<_i872.GetItemPriceUsecase>(
        () => _i872.GetItemPriceUsecase(gh<_i844.ItemsRepository>()));
    gh.factory<_i775.GetItemDetailsUsecase>(
        () => _i775.GetItemDetailsUsecase(gh<_i844.ItemsRepository>()));
    gh.factory<_i788.ItemsCubit>(
        () => _i788.ItemsCubit(gh<_i558.GetItemsUsecase>()));
    gh.factory<_i142.ItemDetailsCubit>(() => _i142.ItemDetailsCubit(
          gh<_i775.GetItemDetailsUsecase>(),
          gh<_i872.GetItemPriceUsecase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i971.DioModule {}
