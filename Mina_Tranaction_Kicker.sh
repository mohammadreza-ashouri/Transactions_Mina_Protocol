#!/bin/bash

senderAddress="B62qpSphT9prqYrJFio82WmV3u29DkbzGprLAM3pZQM2ZEaiiBmyY82"
receiverAddress="B62qqtwygyMDh56idVbEAWRzaJCMFg3EXBnUcohZbBemaH6W2HmmG3b"


echo "--------------------------"

for ((a = 0 ; a < 1000 ; a++)); do
    amount=$(( $RANDOM %100 ))
    amount=$( bc <<< "scale=9;$amount/333" )

    fee=$(( $RANDOM %100 ))
    fee=$( bc <<< "scale=9;$fee/333" )
    echo "In" $i "transaction sent" $amount "Mina with fee" $fee

    docker exec -it mina coda client send-payment \
         -amount $amount \
         -receiver $receiverAddress \
         -fee $fee \
         -sender $senderAddress
    sleep $[ (10 + $RANDOM % 100 ) ]s

echo "----------------------------"
done
