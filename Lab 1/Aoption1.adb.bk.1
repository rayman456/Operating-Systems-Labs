with Ada.Text_IO, Ada.Calendar, Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Calendar, Ada.Numerics.Float_Random;
procedure Aoption1 is
    -- definitions
    package Duration_IO is new Ada.Text_IO.Fixed_IO(duration);  use Duration_IO;
    package integerIO is new Ada.Text_IO.Integer_IO(integer); use integerIO;

    randNum: Generator;  -- used to generate 0.0 <= random numbers <1.0.
    --"Random(randNum)" generates a random number, 0.0 < random number < 1.0.
    -- Duration(Random(randNum) ) coerces the random number to the data type
    -- required by the "delay" statement when requesting a process be put to sleep.

    type RequestType is (Permission_To_Land, Call_The_Ball, Touch_Down);
    type ShuttleNameType is (Atlantis, Challenger, Ranger, MeanMachine);

    package ShuttleNameIO is new Ada.Text_IO.Enumeration_IO(ShuttleNameType);
    use ShuttleNameIO;

    -- This entire procedure represents a critical resource where access must be controlled.
    procedure LandingControlOfficer( Request: in RequestType; Shuttle: in ShuttleNameType) is
    begin

       case Request is
           when Permission_To_Land =>
               delay Duration(Random(randNum) * 5.0);  --  0 <= Delay < 5.0 uniformly distributed.
               -- Make decision.
               put(Shuttle); put(" is granted permission to land."); new_line;
           when Call_The_Ball =>
               delay Duration(Random(randNum) * 5.0);
               -- Prepare gudiance system..
               put(Shuttle); put(" call the ball!"); new_line;
           when Touch_Down =>
               put(Shuttle); put(", permission is granted for final approach."); new_line;
               delay Duration(Random(randNum) * 10.0);
               -- Wait for shuttle to land.

       end case;
    end LandingControlOfficer;

    --Peterson's Algorithm Globals
    Flag : array (ShuttleNameType) of Integer := (others => -1);
    Turn: array (0..2) of ShuttleNameType := (others => MeanMachine);

    task ShuttleAtlantis;
    task body ShuttleAtlantis is
        initiateLandingSequence: duration;
        landingComplete: duration;
    begin
        for I in 1..10 loop
           delay Duration(Random(RandNum) * 15.0);  --Crew boarding and perform mission.

           --Peterson's Algorithm
           for Level in 0..2 loop
              Flag(Atlantis) := Level;
              Turn(Level) := Atlantis;
              while Turn(Level) = Atlantis and then (Flag(Challenger) >= Level or Flag(Ranger) >= Level) loop
                 null;
              end loop;
           end loop;

           put("Atlantis entering its critical landing section.");  new_line(2);
           initiateLandingSequence:= seconds(clock);
           LandingControlOfficer( Permission_To_Land, Atlantis );
           LandingControlOfficer( Call_The_Ball, Atlantis );
           delay Duration(Random(randNum) * 3.0); -- line up shuttle with mother ship
           LandingControlOfficer( Touch_Down, Atlantis );
           landingComplete := seconds(clock);
           put("Shuttle Atlantis docked in "); put( landingComplete - initiateLandingSequence );
           put(" seconds." ); new_line;
           put("Atlantis leavings its critical section.  Obtain new crew and start next mission.");
           New_Line(2);

           --Peterson's Algorithm
           Flag(Atlantis) := -1;


        end loop;
    end ShuttleAtlantis;

    task ShuttleRanger;
    task body ShuttleRanger is
        initiateLandingSequence: duration;
        landingComplete: duration;
    begin
        for I in 1..10 loop
           delay Duration(Random(RandNum) * 15.0);  --Crew boarding and perform mission.

           --Peterson's Algorithm
           for Level in 0..2 loop
              Flag(Ranger) := Level;
              Turn(Level) := Ranger;
              while Turn(Level) = Ranger and then (Flag(Atlantis) >= Level or Flag(Challenger) >= Level) loop
                 null;
              end loop;
           end loop;

           put("Ranger entering its critical landing section.");  new_line(2);
           initiateLandingSequence:= seconds(clock);
           LandingControlOfficer( Permission_To_Land, Ranger );
           LandingControlOfficer( Call_The_Ball, Ranger );
           delay Duration(Random(randNum) * 3.0); -- line up shuttle with mother ship
           LandingControlOfficer( Touch_Down, Ranger );
           landingComplete := seconds(clock);
           put("Shuttle Ranger docked in "); put( landingComplete - initiateLandingSequence );
           put(" seconds." ); new_line;
           put("Ranger leavings its critical section.  Obtain new crew and start next mission.");
           New_Line(2);

           --Peterson's Algorithm
           Flag(Ranger) := -1;

        end loop;
    end ShuttleRanger;

    task ShuttleChallenger;
    task body ShuttleChallenger is
        initiateLandingSequence: duration;
        landingComplete: duration;
    begin
        for I in 1..10 loop
           delay Duration(Random(RandNum) * 15.0);  --Crew boarding and perform mission.

           --Peterson's Algorithm
           for Level in 0..2 loop
              Flag(Challenger) := Level;
              Turn(Level) := Challenger;
              while Turn(Level) = Challenger and then (Flag(Atlantis) >= Level or Flag(Ranger) >= Level) loop
                 null;
              end loop;
           end loop;

           put("Challenger entering its critical landing section.");  new_line(2);
           initiateLandingSequence:= seconds(clock);
           LandingControlOfficer( Permission_To_Land, Challenger );
           LandingControlOfficer( Call_The_Ball, Challenger );
           delay Duration(Random(randNum) * 3.0); -- line up shuttle with mother ship
           LandingControlOfficer( Touch_Down, Challenger );
           landingComplete := seconds(clock);
           put("Shuttle Challenger docked in "); put( landingComplete - initiateLandingSequence );
           put(" seconds." ); new_line;
           put("Challenger leavings its critical section.  Obtain new crew and start next mission.");
           New_Line(2);

           --Peterson's Algorithm
           Flag(Challenger) := -1;

        end loop;
    end ShuttleChallenger;


begin
    put("Shuttle operations are authorized."); new_line;
    -- Used as a container by the mother ship to launch and recover shuttles.
end Aoption1;
