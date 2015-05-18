with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Calendar;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Calendar;

procedure Coption is

   package DurationIO is new Ada.Text_IO.Fixed_IO(Duration); use DurationIO;

   task type TimePrinter is
      entry GiveCountdownTime(Time : in Duration);
      entry Start;
   end TimePrinter;

   task body TimePrinter is
      StartTime : Duration;
      StopTime : Duration;

      TotalTime : Duration;
      TimeLeft :  Duration;
      Correction : Duration;
      Done : Boolean := False;
   begin
      accept GiveCountdownTime(Time : in Duration) do
         TotalTime := Time;
         TimeLeft := Time;
      end GiveCountdownTime;

      accept Start do
         Correction := Seconds(Clock);
         Put("Time: ");
         StartTime := Correction;
         Put(Correction, 5, 3);
         Put(" (");
         Put(TimeLeft, 3, 2);
         Put(" seconds left)");
         New_Line;
      end Start;

      while not Done loop
         if TimeLeft = 0.0 then
            Correction := Seconds(Clock);
            done := True;
         elsif TimeLeft < 10.0 then
            delay (TimeLeft - (Seconds(clock) - Correction));
            Correction := Seconds(Clock);
            done := True;
         else
            delay (10.0 - (Seconds(clock) - Correction));
            Correction := Seconds(Clock);
         end if;
         if Done then
            StopTime := Correction;
            Put("Time: ");
            Put(Correction, 5, 3);
            Put_Line(" (  0.00 seconds left)");
            Put_Line("Completed!");
         else
            TimeLeft := TimeLeft - 10.0;
            Put("Time: ");
            Put(Correction, 5, 3);
            Put(" (");
            Put(TimeLeft, 3, 2);
            Put(" seconds left)");
            New_Line;
         end if;
      end loop;

      Put("Actual Elapsed Time: ");
      Put(StopTime - StartTime, 3);
      New_Line;
      Put("Accumulated Error: ");
      Put(((StopTime - StartTime) - TotalTime) * 1000, 2, 3);
      Put(" milliseconds");
   end TimePrinter;

   InputTime: Duration;
   Timer : TimePrinter;

begin
   Put("Enter Time to wait: ");
   Get(InputTime);
   Timer.GiveCountdownTime(InputTime);
   Timer.Start;
end Coption;

