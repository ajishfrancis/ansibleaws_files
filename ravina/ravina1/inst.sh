rm -f inst/*

for i in {1..24}
do
 ansible-playbook working4.yml --vault-password-file vault.txt --extra-vars "temp=$i"
done

for i in {1..24}
do
( cat "inst/$i"; echo ) >> inst/inst_id_tmp
done

for i in {1..24}
do
 rm -f "inst/$i"
done

grep '"' inst/inst_id_tmp > inst/inst_id
