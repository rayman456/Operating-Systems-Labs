with Ada.Numerics.Elementary_Functions, Ada.Numerics.Float_Random, Ada.Float_Text_IO, Ada.Text_IO, Ada.Calendar;
use Ada.Numerics.Elementary_Functions, Ada.Numerics.Float_Random, Ada.Float_Text_IO, Ada.Text_IO, Ada.Calendar;

procedure PoissonTest is

   package Duration_IO is new Ada.Text_IO.Fixed_IO(duration);  use Duration_IO;

   RandomNum : Generator;
   Temp : Float;
   Average : Float := 0.0;

   function RandomPoisson (Mean : Float; Gen : Generator) return Float is
      UniformNum : Float;
   begin
      UniformNum := Random(Gen);
      if UniformNum = 0.0 then
         return 0.0;
      else
         return Float(- Log(UniformNum) / (1.0 / Mean));
      end if;
   end RandomPoisson;

begin

   put("Enter Poisson Mean: "); get(Temp);

   for I in 1..1000000 loop
      Average := Average + RandomPoisson(Temp, RandomNum);
   end loop;

   Put("Average: "); Put(Average / 1000000.00, 3, 3, 0); New_Line;

   for I in 1..100 loop
      delay 1.0;
      put(seconds(clock)); new_line;
   end loop;

end PoissonTest;
