#!/bin/gawk -f

BEGIN{
  ORS = ""
  discarded = 0
  goodrecord = 0
  nrecord = 0
}
NR == 1{ 
  nfields = NF
}
  {
  nrecord += 1
  if ($0 ~ /[^0-9.   \t)]/ || NF < nfields)
  {
    print "\nRecord " NR " skipped\n\t"
    print $0 "\n"
    discarded += 1
    next
  }
  else
    {
      goodrecord += 1
      for (i = 1; i <= nfields; i++){
        printf "%7.2f ", $i > "average.out"
        sum[i] += $i
        total += $i
      }
      print "\n" > "average.out"
    }
  }
END{
  print "\n"

  for (i = 1; i <= nfields; i++)
    {
      print "======= " > "average.out"
    }
    print "\n" > "average.out"
    for (i = 1; i <= nfields; i++){
      printf "%7.2f ", sum[i]/3.0 > "average.out" 
    }
    printf "\n\nTotal Records: %d", nrecord > "average.out"
    printf "   Good Records: %d", goodrecord > "average.out"
    printf "   Discarded Records: %d\n", discarded > "average.out"
    printf "Grand Average: %0.2f\n", total/18.0 > "average.out"

    
  }
