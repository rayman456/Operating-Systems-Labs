with Ada.Text_IO, Sigint_Handler;
use Ada.Text_IO, Sigint_Handler;

procedure Boption is

   User_Exception : Exception;

   procedure CheckMaxInterrupts is
   begin
      if Handler.Check(10) then
         raise User_Exception;
      end if;
   end CheckMaxInterrupts;

   task Sig_Handler;

   task body Sig_Handler is
   begin
      loop
         CheckMaxInterrupts;
         Put_Line("Task running...");
         delay 1.0;
      end loop;
   exception
      when User_Exception =>
         Put_Line("User Interrupt generated. Terminating Program...");
   end Sig_Handler;

begin
   null;
end Boption;
