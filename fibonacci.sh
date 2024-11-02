fib() {
    if [ $1 -le 1 ]; then
        echo $1
    else
        prev1=$(fib $(( $1 - 1 )))
        prev2=$(fib $(( $1 - 2 )))
        echo $(( prev1 + prev2 ))
    fi
}

echo "Serie de Fibonacci hasta 21:"
for ((i=0; i<=8; i++)); do
    fib $i
done