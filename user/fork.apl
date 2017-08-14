integer main ()
{
    integer ret;
    
    print ("Before first fork");
    
    ret = Fork();
    
    print ("After first fork");
    
    ret = Fork();
    
    print ("After second fork.");
    ret = 0;
    
    while (ret < 1000)
    do
    
        ret = ret + 1;
    endwhile;
    
    return 0;
}
