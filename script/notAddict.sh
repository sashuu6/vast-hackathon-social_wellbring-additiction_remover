current_time=`date +%H%M%S`;
end_time=$((current_time+$1));
alarm_time=$((end_time-$2));
end_time=$((end_time+1));

i=$current_time;
while [ $i -lt $end_time ]
do
    if [ "$i" -gt "$alarm_time" ]
    then
        echo "Your time is about to go out.";
    else
        echo "We are working";
    fi
    ((i++));
    sleep 1s;
done
echo "Time out";