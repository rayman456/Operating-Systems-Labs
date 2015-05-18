generic
   Max_Resource : in Positive;
package Monitor is

   subtype Item_Range is Positive range 1..Max_Resource;
   type Reservable_Item_Array is array (Item_Range) of Boolean;

   protected type Resource_Monitor is
      entry Reserve (Id : out Integer);
      procedure Release (Id : in Integer);
      function Available return Boolean;
   private
      Resource_List : Reservable_Item_Array :=  (others => False);
   end Resource_Monitor;

end Monitor;
