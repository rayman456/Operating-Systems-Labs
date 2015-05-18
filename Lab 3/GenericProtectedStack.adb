package body GenericProtectedStack is

   protected body ProtectedStack is

      procedure Push (
            InputItem : in     Item;
            Success   :    out Boolean) is
      begin
         if IsFull then
            Success := False;
            return;
         else
            Success := True;
            Top := Top + 1;
            Stack(Top) := InputItem;
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
            OutputItem := Stack(Top);
            Top := Top - 1;
         end if;
      end Pop;

      function IsFull return Boolean is
      begin
         return Top = Size;
      end IsFull;

      function IsEmpty return Boolean is
      begin
         return Top = 0;
      end IsEmpty;

   end ProtectedStack;

end GenericProtectedStack;
