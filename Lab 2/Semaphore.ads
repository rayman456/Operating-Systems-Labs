package Semaphore is

   protected type Counting_Semaphore(Start_Count:  Integer := 1) is
     entry Secure;
     procedure Release;
     function Count return Integer;
   private
     Current_Count: Integer := Start_Count;
   end Counting_Semaphore;

end Semaphore;
