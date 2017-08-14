integer main()
{
   string input;
   integer ret, execret;
   
   print ("XOS Shell");
   
   while (1 == 1) do
      read(input);
      if (input == "exit") then
         break;
      endif;
      
      ret=Fork();
      
      if (ret == -1) then
         print("No resource.");
         continue;
      endif;
      
      if (ret == -2) then
         execret=Exec(input);
         
         if (-1 == execret) then
            print("Can't execute.");
         endif;
         
         Exit();
      else
         execret=Wait(ret);
      
         if (-1 == execret) then
            print("Unexpected error.");
            break;
         endif;
      endif;
   endwhile;
   
   return 0;
}
