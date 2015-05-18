with Ada.Numerics.Float_Random;
use Ada.Numerics.Float_Random;

package RandomFunctions is

   function RandomPoisson (
         Mean : Float;
         Gen  : Generator)
     return Float;

   function RandomSize (
         Gen : Generator)
     return Integer;

   function RandomImpactTime (
         Gen : Generator)
     return Float;

end RandomFunctions;
