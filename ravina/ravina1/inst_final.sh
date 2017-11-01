st=$(date +%s)
rm -f inst/*

for i in {0..24}
do
 ansible-playbook working4.yml --vault-password-file vault.txt --extra-vars "temp=$i"
done

for i in {0..24}
do
( cat "inst/$i"; echo ) >> inst/inst_id_tmp
done

for i in {0..24}
do
 rm -f "inst/$i"
done

grep '"' inst/inst_id_tmp > inst/inst_id

rm -f inst/inst_id_tmp

end=$(date +%s)
diff=$(( $end - $st ))

clear

echo "VM List for last 24 Hours"
cat inst/inst_id


