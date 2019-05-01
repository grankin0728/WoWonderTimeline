days=200
total_commit=600
size=$((days*24*60))
a=$(shuf -i 1-$size -n $total_commit | sort -r -n)
for i in ${a}
do 
sudo git commit --allow-empty -m "help commit"
sudo git commit --amend --allow-empty --no-edit --date="-$i minute ago"
done 
sudo git push origin master