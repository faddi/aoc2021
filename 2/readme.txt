
cat input.txt | awk -F ' ' '{sum[$1]+=$2;} END{for (i in sum)print i", "sum[i]; print "D x H: "(sum["down"]-sum["up"])*sum["forward"];}'

cat input.txt | awk -F ' ' '{if($1 == "down") aim+=$2; else if ($1 == "up") aim-=$2; else { H+=$2; V+=(aim * $2) } } END{print V ", "H "\nresult: " (V * H)}'
