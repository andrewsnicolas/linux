clear
echo "========= Automação de criação ========="
echo "Quantas pastas você quer criar?"
read numero
for ((i=l;i<=numero;i++))
do
 mkdir "pasta$i"
done
