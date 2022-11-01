import json
import boto3
import random

def lambda_handler(event, context):
    num1 = int(random.randrange(0,50))
    num2 = int(random.randrange(0,50))
    sum = (num1 + num2)
    if sum >= 0:

        client = boto3.client('sns', region_name='us-east-1')
        response = client.publish(
                TopicArn="arn:aws:sns:us-east-1:266477775071:Sns_for_sum_func",
                Message='Here are the sum of the numbers:'+str(sum),
                Subject='Sum of 2 numbers calculation')
    print(num1)
    print(num2)
    print(sum)
    
    return sum

