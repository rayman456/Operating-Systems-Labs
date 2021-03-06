package body GenericProtectedQueue is

   protected body ProtectedQueue is

      procedure Push (
            InputItem : in     Item;
            Success   :    out Boolean) is
      begin
         if IsFull then
            Success := False;
            return;
         else
            Success := True;
            Queue(Last) := InputItem;
            Last := (Last + 1) mod Size;
            Count := Count + 1;
         end if;
      end Push;

      procedure Pop (
            OutputItem :    out Item;
            Success    :    out Boolean) is
      begin
         if IsEmpty then
            Success := False;
            return;
         else
            Success := True;
            OutputItem := Queue(First);
            First := (First + 1) mod Size;
            Count := Count - 1;
         end if;
      end Pop;

      function IsFull return Boolean is
      begin
         return Count  = Size;
      end IsFull;

      function IsEmpty return Boolean is
      begin
         return Count = 0;
      end IsEmpty;

   end ProtectedQueue;

end GenericProtectedQueue;