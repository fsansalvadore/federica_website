<?php
$errors = '';
$myemail = 'info@federicaburziopsicologa.it';//<-----Put Your email address here.
if(empty($_POST['nome'])  || 
   empty($_POST['nome'])  || 
   empty($_POST['email']) ||
   empty($_POST['messaggio']))
{
    $errors .= "\n Error: all fields are required";
}

$name = $_POST['nome'];
$tel = $_POST['tel']; 
$email_address = $_POST['email']; 
$message = $_POST['messaggio']; 

if (!preg_match(
"/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/i", 
$email_address))
{
    $errors .= "\n Error: Invalid email address";
}

if( empty($errors))

{
$to = $myemail;
$email_subject = "Messaggio da: $name";
$email_body = "Nuovo messaggio da: \n \n Name: $name \n ".
"Telefono: $tel\n ".
"Email: $email_address\n ".
"Messaggio: \n $message";
$headers = "From: $myemail\n";
$headers .= "Reply-To: $email_address";
mail($to,$email_subject,$email_body,$headers);
//redirect to the 'thank you' page
header('Location: messaggio-inviato.html');
}
?>