clear
echo "Qual o nome da pasta?"
read pasta

for (( i=l; i<=5; i++ ))
do
    if  [[ -d $pasta$i ]]
    then 
	echo "Pasta $pasta$i já existe."
	sleep 3s
	./exercicioPasta.sh
     else  
        echo "criando a $pasta$i"
        mkdir $pasta$i
        sleep 2s
    fi
done
