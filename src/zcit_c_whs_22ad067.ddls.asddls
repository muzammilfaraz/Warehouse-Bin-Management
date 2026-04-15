@EndUserText.label: 'Warehouse Header - Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZCIT_C_WHS_22AD067
  provider contract transactional_query
  as projection on ZCIT_I_WHS_22AD067
{
      @Search.defaultSearchElement: true
  key WarehouseUuid,
  
      @Search.defaultSearchElement: true
      WarehouseId,
      
      @Search.defaultSearchElement: true
      ManagerName,
      
      WarehouseAddress,
      ContactEmail,
      ContactPhone,
      IsActive,

      /* Admin Data */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _Bins : redirected to composition child ZCIT_C_BNS_22AD067
}
