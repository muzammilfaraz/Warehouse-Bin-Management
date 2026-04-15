@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Warehouse Header - Interface View'
define root view entity ZCIT_I_WHS_22AD067
  as select from zcit_whs_22ad067 as Warehouse
  composition [0..*] of ZCIT_I_BNS_22AD067 as _Bins
{
  key warehouse_uuid        as WarehouseUuid,
      warehouse_id          as WarehouseId,
      
      manager_name          as ManagerName,
      warehouse_address     as WarehouseAddress,
      contact_email         as ContactEmail,
      contact_phone         as ContactPhone,
      is_active             as IsActive,

      /* Admin Data - Required for Managed RAP & Drafts */
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      /* Public Associations */
      _Bins
}
