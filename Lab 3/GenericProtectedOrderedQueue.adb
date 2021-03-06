package body GenericProtectedOrderedQueue is

   protected body ProtectedOrderedQueue is

      procedure Push (
            InputItem : in     Item;
            Success   :    out Boolean) is
         Temp1 : Integer;
         Temp2 : Integer;
      begin
         if IsFull then
            Success := False;
            return;
         else
            Success := True;
            if IsEmpty then
               --Dont check just insert
               Queue(Last) := InputItem;
               Last := (Last + 1) mod Size;
               Count := Count + 1;
            else
               --Find insertion spot
               Temp1 := First;
               while Temp1 /= Last and then GetPriority(InputItem) >=
                     GetPriority(Queue(Temp1)) loop
                  Temp1 := (Temp1 + 1) mod Size;
               end loop;
               if Temp1 = Last then
                  --Insert at end, dont need to move anything
                  Queue(Last) := InputItem;
                  Last := (Last + 1) mod Size;
                  Count := Count + 1;
               elsif Temp1 = First then
                  --Insert at beginning, dont need to move anything
                  First := (First + Size - 1) mod Size;
                  Queue(First) := InputItem;
                  Count := Count + 1;
               else
                  --Shift everything from Temp1 to Last over
                  Temp2 := Last;
                  while Temp2 /= Temp1 loop
                     Queue(Temp2) := Queue((Temp2 + Size - 1) mod Size);
                     Temp2 := (Temp2 + Size - 1) mod Size;
                  end loop;
                  --Insert in new open spot
                  Queue(Temp1) := InputItem;
                  Last := (Last + 1) mod Size;
                  Count := Count + 1;
               end if;
            end if;
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
         return Count = Size;
      end IsFull;

      function IsEmpty return Boolean is
      begin
         return Count = 0;
      end IsEmpty;

   end ProtectedOrderedQueue;

end GenericProtectedOrderedQueue;