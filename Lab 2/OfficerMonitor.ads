generic
   type Item is limited private;
   Max_Resource : in Positive;
package OfficerMonitor is

   subtype Item_Range is Positive range 1..Max_Resource;
   type Reservable_Item is
   record
      Reserved : Boolean := False;
      Resource : aliased Item;
   end record;
   type Reservable_Item_Array is aliased array (Item_Range) of Reservable_Item;
   type Item_Ptr is access all Item;
   type Reservable_Item_Array_Ptr is access all Reservable_Item_Array;

   protected type LandingOfficerMonitor(Input_Array : in Reservable_Item_Array_Ptr) is
      entry  Reserve (Id : out Integer; Resource_Ptr : out Item_Ptr);
      procedure Release (Id : in Integer);
      function Available return Boolean;
   private
      OfficerArray : Reservable_Item_Array_Ptr;
   end LandingOfficerMonitor;

end OfficerMonitor;