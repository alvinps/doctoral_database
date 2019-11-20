<!-- {%Alvin Poudel Sharma             Jared Kremer} -->


<html>
<head>
	<title> Query2 </title>
</head>
<body>
<?php

  $fname = filter_input(INPUT_POST, 'fname');
  $lname = filter_input(INPUT_POST, 'lname');
 // Create connection
$conn = new mysqli("localhost", "root", "", "doctoral");
// Check connection
if ($conn->connect_error) {
    die("Connection failed: ");
}
$sql1 = "DELETE FROM PHDSTUDENT
WHERE Fname = '$fname' && Lname = '$lname' ";
if($conn->query($sql1))
{
	echo "Data DELETED sucessfully...<br>";
}
else
{
	echo "Cannot DELETE [ERROR!!!!]...<br>";
}
$conn->close();
?>
 </body>
 </html>
 