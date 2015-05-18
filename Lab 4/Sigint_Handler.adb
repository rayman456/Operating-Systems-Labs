with Ada.Text_IO;
use Ada.Text_IO;

package body Sigint_Handler is

   protected body Handler is

      procedure Handle is
      begin
         Put_Line("Handled a SIGINT Interrupt. (CTRL-C)");
         Interrupt_Count := Interrupt_Count + 1;
      end Handle;

      function Check(Num : in Integer) return Boolean is
      begin
         return Interrupt_Count >= Num;
      end Check;

   end Handler;

end Sigint_Handler;