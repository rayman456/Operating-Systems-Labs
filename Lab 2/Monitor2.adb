package body Monitor2 is

   protected body Resource_Monitor is

      procedure Initialize (Input_Array : in Reservable_Item_Array_Ptr) is
      begin
         Resource_List := Input_Array;
         Initialized := True;
      end Initialize;

      entry Reserve (Id : out Integer; Resource_Ptr : out Item_Ptr) when Initialized and then Available is
      begin
         ReserveLoop:
         for I in Resource_List'range loop
            if Resource_List(I).Reserved = False then
               Id := I;
               Resource_Ptr := Resource_List(I).Resource'Unchecked_Access;
               Resource_List(I).Reserved := True;
               exit ReserveLoop;
            end if;
         end loop ReserveLoop;
      end Reserve;

      procedure Release (Id : in Integer) is
      begin
         Resource_List(Id).Reserved := False;
      end Release;

      function Available return Boolean is
      begin
         for I in Resource_List'range loop
            if Resource_List(I).Reserved = False then
               return True;
            end if;
         end loop;
         return false;
      end Available;
   end Resource_Monitor;

end Monitor2;
