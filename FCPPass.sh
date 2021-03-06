export PYTHONPATH=$(pwd)

thread_number=6
count=`expr $thread_number - 1`

for trial in 0
do
	for i in `seq 0 $count`
	do
	    python3 FCPPassing/MA3C-Distributed.py --slaves_per_url="$thread_number" --urls=localhost --task_index="$i" & #>a3c3log"$i" 2>&1 &
	    echo python3 A3C/A3C-Distributed.py --task_max="$thread_number" --task_index="$i"
	    sleep 5
	done
	wait
    sleep 5
    mkdir FCPPassing-Trial"$trial"
    mv dist_model train_* FCPPassing-Trial"$trial"/
done
