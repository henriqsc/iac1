#!/bin/bash

dirs=("/publico" "/adm" "/ven" "/sec")
groups=("GRP_ADM" "GRP_VEN" "GRP_SEC")
users=("carlos" "maria" "joao" "debora" "sebastiana" "roberto" "josefina" "amanda" "rogerio")
grp_adm=("carlos" "maria" "joao")
grp_ven=("debora" "sebastiana" "roberto")
grp_sec=("josefina" "amanda" "rogerio")


for dir in "${dirs[@]}" 
do
    mkdir $dir
    chmod 770 $dir
done
chmod 777 /publico

for grp in "${groups[@]}" 
do
    groupadd $grp
done

for usr in "${users[@]}" 
do
    if [[ " ${grp_adm[*]} " =~ " ${usr} " ]]; then
        grp="GRP_ADM"
    fi
    if [[ " ${grp_ven[*]} " =~ " ${usr} " ]]; then
        grp="GRP_VEN"
    fi
    if [[ " ${grp_sec[*]} " =~ " ${usr} " ]]; then
        grp="GRP_SEC"
    fi
    useradd $usr -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G $grp
done

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

    

