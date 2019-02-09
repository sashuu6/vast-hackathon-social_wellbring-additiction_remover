current_time=`date +%M%S`;
end_time=$((current_time+$1));
alarm_time=$((end_time-$2));
new_end_time=$((end_time+10));

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

echo `tcset wlp3s0 --rate 100Kbps --overwrite`;
echo "We have cut your bandwidth."
sleep 5s;
echo `tcset wlp3s0 --delay 10sec --overwrite`;
echo "We have increased the delay."
sleep 5s;
echo 'tcset wlp3s0 --loss 15%';
echo "we have increased the packet loss."
echo "The internet has now just worthless. You should really quit the program."
