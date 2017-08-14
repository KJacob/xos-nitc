integer main()
{
	integer counter, ret, a, b;
	integer fdfive, fdseven, fdmerge, fdremain;
	integer seekfive, seekseven, total;
	
	counter = 1;
	total = 0;
	seekfive = 0;
	seekseven = 0;
	
	ret = Create("fives.dat");
	ret = Create("sevens.dat");
	ret = Create("merge.dat");
	
	fdfive = Open("fives.dat");
	fdseven = Open("sevens.dat");
	fdmerge = Open("merge.dat");
	
	while (counter < 1001) do
		ret = Write(fdfive, 5 * counter);
		ret = Write(fdseven, 7 * counter);
		
		counter = counter + 1;
	endwhile;
	ret=Seek (fdfive, 0);
	ret=Seek (fdseven, 0);
	while (0 == 0) do
		ret = Read(fdfive, a);
		
		if (ret == -1) then
			fdremain = fdseven;
			break;
		endif;
		
		ret = Read(fdseven, b);
		if (ret == -1) then
			fdremain = fdfive;
			break;
		endif;
		
		if (b > a) then
			seekfive = seekfive + 1;
			ret = Seek(fdseven, seekseven);
			ret = Write(fdmerge, a);
		else
			seekseven = seekseven + 1;
			ret = Seek(fdfive, seekfive);
			ret = Write(fdmerge, b);
		endif;
	endwhile;
	
	while (0 == 0) do
		ret = Read(fdremain, a);
		
		if (-1 == ret) then
			break;
		endif;
		
		ret = Write (fdmerge, a);
	endwhile;
	
	ret = Close (fdfive);
	ret = Close (fdseven);
	
	ret = Seek (fdmerge, 0);
	
	while (0 == 0) do
		ret = Read(fdmerge, a);
		if (-1 == ret) then
			break;
		endif;
		
		print (a);
	endwhile;
	
	ret = Close (fdmerge);
	return 0;
}
