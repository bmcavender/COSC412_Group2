<?php
include 'conn.php';
// Connect to MySQL DBMS
if (!($connection = @ mysql_connect($hostName, $username,
  $password)))
  showerror();
// Use the iot2017 database
if (!mysql_select_db($databaseName, $connection))
  showerror();
 
 
 $email =$_POST['email'];
 $password =$_POST['password'];

$query= mysql_query("select * from Clients where ClientEmail='$email' and ClientPass='$password'");
$query_delete = mysql_query("DELETE from Clients where ClientEmail='$email' and ClientPass='$password'");


$user= mysql_fetch_row($query);


if(mysql_num_rows($query)>0)
{
    header('Location: http://triton.towson.edu/~jray8/cosc412/sign-up-login-form/clienthome.html');
    die();
}
else {
    header('Location: http://triton.towson.edu/~jray8/cosc412/sign-up-login-form/clienthome.html');
    die();
}

