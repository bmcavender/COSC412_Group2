<html>
<head><title>Successfull Registered</title>
	<link rel="stylesheet" type="text/css" href="../css/registered.css"/>
	<
<style>

button{
	margin-top:15%;
}

#back{
	text-align:center;

}
html { 
  background: url(../images/background.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
} /* sets the background image perfectly*/

</style>
</head>
<body>
<h1 style="text-align:center;">Successfully Registered! Welcome to FitisBiz</h1>

<?php
include 'conn.php';
// Connect to MySQL DBMS
if (!($connection = @ mysql_connect($hostName, $username,
  $password)))
  showerror();
// Use the iot2017 database
if (!mysql_select_db($databaseName, $connection))
  showerror();
 
 
 $fname =$_POST['fname'];
 $lname =$_POST['lname'];
 $email =$_POST['email'];
 $phone =$_POST['phone'];
 $street =$_POST['street'];
 $phone =$_POST['phone'];
 $city =$_POST['city'];
 $zip =$_POST['zip'];
 $state =$_POST['state'];
 $password =$_POST['password'];

$query = "INSERT INTO login VALUES (NULL, '$fname','$lname','$email', '$street', '$city', '$zip', '$state', '$phone', '$password');";
if (!($result = @ mysql_query ($query, $connection)))
  showerror();

?>
</table>
        <div id="back"><button class="button register" id="bregister" onClick="location.href = '../../fitisbiz/home.html';">Back to Home</button></div>
</body>  
</html>