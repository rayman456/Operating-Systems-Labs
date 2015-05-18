with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;

package body AsteroidPackage is

   package Duration_IO is new Ada.Text_IO.Fixed_IO(Duration);
   use Duration_IO;

   procedure Construct (
         Ast        : in     Asteroid_Ptr;
         AstID      : in     Integer;
         SizeInput  : in     Integer;
         ImpactTime : in     Duration;
         FoundTime  : in     Duration) is
   begin
      Ast.ID := AstID;
      Ast.Size := SizeInput;
      Ast.TimeToImpact := ImpactTime;
      Ast.TimeFound := FoundTime;
   end Construct;

   function GetSize (
         Ast : in     Asteroid_Ptr)
     return Integer is
   begin
      return Ast.Size;
   end GetSize;

   function GetID (
         Ast : in     Asteroid_Ptr)
     return Integer is
   begin
      return Ast.ID;
   end GetID;

   function GetAbsoluteImpactTime (
         Ast : in     Asteroid_Ptr)
     return Duration is
   begin
      return Ast.TimeFound + Ast.TimeToImpact;
   end GetAbsoluteImpactTime;

   function HasImpacted (
         Ast : in     Asteroid_Ptr)
     return Boolean is
   begin
      return (Ast.TimeFound + Ast.TimeToImpact) <= Seconds(Clock);
   end HasImpacted;

   function RemainingTimeToImpact (
         Ast : in     Asteroid_Ptr)
     return Duration is
   begin
      return (Ast.TimeFound + Ast.TimeToImpact) - Seconds(Clock);
   end RemainingTimeToImpact;

   procedure ToString (
         Ast : in     Asteroid_Ptr) is
   begin
      Put("(#");
      Put(Ast.ID, 2);
      Put(")");
      Put(" Asteroid Size: ");
      Put(Ast.Size, 2);
      New_Line;
      Put("(#");
      Put(Ast.ID, 2);
      Put(")");
      Put(" Time til Impact: ");
      Put(Ast.TimeToImpact, 3, 3, 0);
      New_Line;
      Put("(#");
      Put(Ast.ID, 2);
      Put(")");
      Put(" Found at: ");
      Put(Ast.TimeFound, 3, 3, 0);
      New_Line(2);
   end ToString;


end AsteroidPackage;
