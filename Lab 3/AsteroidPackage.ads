with Ada.Calendar;
use Ada.Calendar;

package AsteroidPackage is

   type Asteroid is private;

   type Asteroid_Ptr is access Asteroid;

   function GetSize (
         Ast : in     Asteroid_Ptr)
     return Integer;

   function GetID (
         Ast : in     Asteroid_Ptr)
     return Integer;

   function GetAbsoluteImpactTime (
         Ast : in     Asteroid_Ptr)
     return Duration;

   procedure Construct (
         Ast        : in     Asteroid_Ptr;
         AstID      : in     Integer;
         SizeInput  : in     Integer;
         ImpactTime : in     Duration;
         FoundTime  : in     Duration);

   function HasImpacted (
         Ast : in     Asteroid_Ptr)
     return Boolean;

   function RemainingTimeToImpact (
         Ast : in     Asteroid_Ptr)
     return Duration;

   procedure ToString (
         Ast : in     Asteroid_Ptr);

private

   type Asteroid is
      record
         ID           : Integer;
         Size         : Integer;
         TimeToImpact : Duration;
         TimeFound    : Duration;
      end record;

end AsteroidPackage;
