#### Lambda-SnS using instuctions
## This will be the solution architecture:
![s1+s2](https://user-images.githubusercontent.com/105926044/199258774-af67700a-7533-4cc6-b9b0-df09e82e6adb.png)

##Some overview about AWS.
*[What is AWS](https://www.techtarget.com/searchaws/definition/Amazon-Web-Services)
*[What is cloud computing](https://aws.amazon.com/what-is-cloud-computing/)
*[What is Lambda](https://aws.amazon.com/lambda/)
*[What is Sns](https://docs.aws.amazon.com/sns/latest/dg/welcome.html)

## How to Use the function Via AWS Cloudshell:
* First you have to enter to the shell as marked in the photo:
![CLI](https://user-images.githubusercontent.com/105926044/199261729-bb3ff3c9-7299-40f8-8504-f571b75b9a45.png)
* When you inside the shell print this command: aws lambda invoke --function-name Lambda_sum_function --payload ewogICJrZXkxIjogInZhbHVlMSIsCiAgImtleTIiOiAidmFsdWUyIiwKICAia2V5MyI6ICJ2YWx1ZTMiCn0= response.json
* Expected result:
![aws respone json_](https://user-images.githubusercontent.com/105926044/199262456-912faa07-d82b-4f74-93c7-c6c5848871e7.jpg)
*After that the destinations members will receive a notification to their email adress
![GMAIL_NOTIFICATION](https://user-images.githubusercontent.com/105926044/199263531-d59282cd-c56b-4daa-b679-03ef780f4926.jpg)

## The second stage:
* In this stage I had to add Api gateway request to the first function
*[What is Api](https://www.redhat.com/en/topics/api/what-does-an-api-gateway-do)

* The big change in this stage is that the client will send the request to the Api and the Api will trigger the lambda function and this is the link:
* [Api endpoint](https://jhwbrrnsa2.execute-api.us-east-1.amazonaws.com/Lambda_sum_function) this will show you the sum in the url and will send email with sum to members who were defined for this

## Expected result:
![sum+url](https://user-images.githubusercontent.com/105926044/199266048-73b08ebf-9e2a-41fd-a25c-2ca12b395e18.jpg)

## How it should look in AWS:
![lambda_func](https://user-images.githubusercontent.com/105926044/199266378-092a0302-dd56-4ee2-b70a-4efa9d7e8188.jpg)
