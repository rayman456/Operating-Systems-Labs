with Ada.Interrupts, Ada.Interrupts.Names;
use Ada.Interrupts, Ada.Interrupts.Names;

package Sigint_Handler is

   protected Handler is
      procedure Handle;
      function Check(Num : in Integer) return Boolean;
      pragma Interrupt_Handler(Handle);
      pragma Attach_Handler(Handle, Sigint);
   private
      Interrupt_Count : Integer := 0;
   end Handler;

end Sigint_Handler;