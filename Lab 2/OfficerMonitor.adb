with Ada.Numerics.Float_Random, Ada.Text_IO;
use Ada.Numerics.Float_Random, Ada.Text_IO;

package body OfficerMonitor is

   package Duration_IO is new Ada.Text_IO.Fixed_IO(duration);  use Duration_IO;
   package integerIO is new Ada.Text_IO.Integer_IO(integer); use integerIO;

   RandNum: Generator;

   task body LandingOfficer is
   begin
      loop
         accept PermissionToLand (ShuttleId : in Integer) do
            delay Duration(Random(RandNum) * 5.0);
            put("Shuttle #"); put(ShuttleId, 2); put(" is granted permission to land."); new_line;
         end PermissionToLand;

         accept CallTheBall (ShuttleId : in Integer) do
            delay Duration(Random(RandNum) * 5.0);
            put("Shuttle #"); put(ShuttleId, 2); put(" call the ball!"); new_line;
         end CallTheBall;

         accept TouchDown (ShuttleId : in Integer) do
            put("Shuttle #"); put(ShuttleId, 2); Put(", permission granted for final approach."); New_Line;
            delay Duration(Random(RandNum) * 10.0);
         end Touchdown;
      end loop;
   end LandingOfficer;

   protected body LandingOfficerMonitor is
      entry Reserve (Id : out Integer; OfficerAccess : out OfficerPtr) when Available is
      begin
         --Look through resource array for unreserved resource,
         --then reserve that resource and output its ID and pointer.
         ReserveLoop:
         for I in OfficerArray'range loop
            if OfficerArray(I).Reserved = False then
               Id := I;
               OfficerAccess := OfficerArray(1).Officer'Unchecked_Access;
               exit ReserveLoop;
            end if;
         end loop ReserveLoop;
      end Reserve;

      procedure Release (Id : in Integer) is
      begin
         OfficerArray(Id).Reserved := False;
         --Set an item to unreserved based on Id
         --OFficerArray(Id).Reserved := False;
      end Release;

      function Available return Boolean is
      begin
         --return true is there is some resource available, otherwise return false
         for I in OfficerArray'range loop
            if OfficerArray(I).Reserved = False then
               return True;
            end if;
         end loop;
         return false;
      end Available;
   end LandingOfficerMonitor;

end OfficerMonitor;
