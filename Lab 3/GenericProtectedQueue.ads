generic
   type Item is private;
   Size :
   in Positive;
package GenericProtectedQueue is

   subtype Item_Range is Integer range 0..(Size-1);
   type Item_Array is array (Item_Range) of Item;

   protected type ProtectedQueue is
      procedure Push (
            InputItem : in     Item;
            Success   :    out Boolean);
      procedure Pop (
            OutputItem :    out Item;
            Success    :    out Boolean);
      function IsFull return Boolean;
      function IsEmpty return Boolean;
   private
      Queue : Item_Array;
      First : Integer := 0;
      Last : Integer := 0;
      Count : Integer := 0;
   end ProtectedQueue;

end GenericProtectedQueue;
