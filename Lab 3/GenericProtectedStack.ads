generic
   type Item is private;
   Size :
   in Positive;
package GenericProtectedStack is

   subtype Item_Range is Positive range 1..Size;
   type Item_Array is array (Item_Range) of Item;

   protected type ProtectedStack is
      procedure Push (
            InputItem : in     Item;
            Success   :    out Boolean);
      procedure Pop (
            OutputItem :    out Item;
            Success    :    out Boolean);
      function IsFull return Boolean;
      function IsEmpty return Boolean;
   private
      Stack : Item_Array;
      Top : Integer := 0;
   end ProtectedStack;

end GenericProtectedStack;
