with System.OS_Interface, Boption, Ada.Integer_Text_IO;
use Boption, Ada.Integer_Text_IO;


procedure Test is

   testHandler : Device_Interface(System.OS_Interface.SIGTERM);

   testint : Integer;

begin

   Get(Testint);

   Testint := 1 mod Testint;

end Test;
