with Ada.Numerics.Float_Random, Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Float_Random, Ada.Numerics.Elementary_Functions;

package body RandomFunctions is

   function RandomPoisson (
         Mean : Float;
         Gen  : Generator)
     return Float is
      UniformNum : Float;
   begin
      UniformNum := Random(Gen);
      if UniformNum = 0.0 then
         return 0.0;
      else
         return Float(- Log(UniformNum) / (1.0 / Mean));
      end if;
   end RandomPoisson;

   function RandomSize (
         Gen : Generator)
     return Integer is
      UniformNum : Float;
   begin
      UniformNum := Random(Gen);
      if UniformNum <= 0.2 then
         return 3;
      elsif UniformNum > 0.2 and UniformNum <= 0.5 then
         return 6;
      elsif UniformNum > 0.5 and UniformNum <= 0.7 then
         return 9;
      else
         return 11;
      end if;
   end RandomSize;

   function RandomImpactTime (
         Gen : Generator)
     return Float is
   begin
      return (Random(Gen) * 15.0);
   end RandomImpactTime;

end RandomFunctions;
