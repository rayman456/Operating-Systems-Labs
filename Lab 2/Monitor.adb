package body Monitor is

   protected body Resource_Monitor is
      entry Reserve (Id : out Integer) when Available is
      begin
         --Look through resource array for unreserved resource,
         --then reserve that resource and output its ID and pointer.
         ReserveLoop:
         for I in Resource_List'range loop
            if Resource_List(I) = False then
               Id := I;
               Resource_List(I) := True;
               exit ReserveLoop;
            end if;
         end loop ReserveLoop;
      end Reserve;

      procedure Release (Id : in Integer) is
      begin
         --Set an item to unreserved based on Id
         Resource_List(Id) := False;
      end Release;

      function Available return Boolean is
      begin
         --return true is there is some resource available, otherwise return false
         for I in Resource_List'range loop
            if Resource_List(I) = False then
               return True;
            end if;
         end loop;
         return false;
      end Available;
   end Resource_Monitor;


end Monitor;
