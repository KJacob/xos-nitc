integer main ()
{
    integer fileDes;
    integer ret;
    string in;
    
    ret = Create("test.dat");
    
    print (ret);
    
    fileDes = Open("test.dat");
    
    print (fileDes);
    
    ret = Write (fileDes, "Welcome to");
    ret = Write (fileDes, "Ooty");
    ret=Seek(fileDes, 0);
    if (-1 == ret) then
        print ("Seek failed.");
    endif;
    ret = Read (fileDes, in);
    print(in);
    ret = Write (fileDes, "Another");
    ret = Write (fileDes, "Nice");
    
    ret = Close(fileDes);
    print(ret);
    
    //ret = Delete("test.dat");
    if (0 == ret) then
        print ("DEL:OK");
    endif;
    
    return 0;
}
