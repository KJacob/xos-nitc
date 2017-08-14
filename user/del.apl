integer main ()
{
    integer ret;
    
    ret = Delete("test.dat");
    
    if (ret == 0) then
        print("Delete OK.");
    endif;
   
   return 0; 
}
