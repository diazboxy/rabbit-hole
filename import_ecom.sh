#!/bin/bash

counter=0
while [ $counter -le 500 ]
do
start_time=`date +%s`
magento cjimporter:importEcommerce 20000 --force
end_time=`date +%s`
run_time=$(($end_time-$start_time))
((counter++))
echo `date` >> /var/www/html/ecom_import.log
echo $counter >> /var/www/html/ecom_import.log
if [ $run_time -le 30 ]; then
        echo Ecommerce import is complete!
        exit
fi
done

