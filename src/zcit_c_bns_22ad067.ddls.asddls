@EndUserText.label: 'Storage Bin - Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZCIT_C_BNS_22AD067
  as projection on ZCIT_I_BNS_22AD067
{
  key BinUuid,
      WarehouseUuid,
      
      @Search.defaultSearchElement: true
      BinId,
      
      StorageType,
      MaxCapacity,
      BinStatus,
      Remarks,
      
      /* --- Expose our UI Color Logic --- */
      BinCriticality,

      LocalLastChangedAt,

      /* Associations */
      _Warehouse : redirected to parent ZCIT_C_WHS_22AD067
}
