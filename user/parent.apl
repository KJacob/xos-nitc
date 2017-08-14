integer main ()
{
   integer ret, status;
   
   print ("Parent process");
   ret=Fork();
   
   if (ret == -2) then
      print("In child");
      
      status=Exec("test.xsm");
      
      print("Child die");
   else
      print ("Waiting");
      status = Wait(ret);
      print ("Parent");
   endif;
   
   return 0;
}
