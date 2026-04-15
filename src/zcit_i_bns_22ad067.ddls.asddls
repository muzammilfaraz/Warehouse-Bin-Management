@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Storage Bin - Interface View'
define view entity ZCIT_I_BNS_22AD067
  as select from zcit_bns_22ad067 as Bin
  association to parent ZCIT_I_WHS_22AD067 as _Warehouse 
    on $projection.WarehouseUuid = _Warehouse.WarehouseUuid
{
  key bin_uuid              as BinUuid,
      warehouse_uuid        as WarehouseUuid,
      
      bin_id                as BinId,
      storage_type          as StorageType,
      max_capacity          as MaxCapacity,
      bin_status            as BinStatus,
      remarks               as Remarks,

      /* --- UI Color Logic (Criticality) --- */
      case bin_status
        when 'E' then 3 /* 3 = Green  (Empty & Available) */
        when 'P' then 2 /* 2 = Yellow (Partially Full)    */
        when 'F' then 1 /* 1 = Red    (Completely Full)   */
        else 0          /* 0 = Grey   (Unknown)           */
      end                   as BinCriticality,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      /* Public Associations */
      _Warehouse
}
