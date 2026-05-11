clear
touch lista.txt
ls -l > lista.txt
echo "======= Automação ======="
echo "Digite o nome da pasta"
read nome
mkdir "$nome"
cp lista.txt $nome
echo "posso criar 3 subpastas? (Y/N)"
read condicao
if [ "$condicao" == "Y" ] || [ "$condicao" == "y" ]; then
	echo "Prosseguindo com a criação"
	echo "Digite o nome de 3 pastas separando por espaço"
	cd $nome
	read npasta
	mkdir $npasta
	for p in $npasta
	do
	 cp lista.txt $p
	done
	rm -rf lista.txt
	tree
	echo "Você quer excluir alguma pasta?"
	read nomePasta
	rm -rf $nomePasta
	echo "Removendo a pasta"
	ls
else
	echo "Beleza, não vou criar"
fi
