current_time=`date +%H%M%S`;
end_time=$((current_time+$1));
alarm_time=$((end_time-$2));
new_end_time=$((end_time+10));
connectionPort=$3;

i=$current_time;
while [ $i -lt $end_time ]
do
    if [ "$i" -gt "$alarm_time" ]
    then
        echo "Your time is about to go out.";
    else
        echo "notAddict is monitoring you.";
    fi
    ((i++));
    sleep 1s;
done
echo "Time out";

i=0;
while [ $i -lt 3 ]
do
	echo `tcset $((connectionPort)) --rate 100Kbps --delay 100ms --loss 0.1% --overwrite`;
	sleep 5s;
done
