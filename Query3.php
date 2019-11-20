<!-- {%Alvin Poudel Sharma             Jared Kremer} -->


<html>
<head>
	<title> Query 3 </title>
</head>
<body>
<?php

  $insid = filter_input(INPUT_POST, 'insid');
  $itype = filter_input(INPUT_POST, 'itype');
 // Create connection
$conn = new mysqli("localhost", "root", "", "doctoral");
// Check connection
if ($conn->connect_error) {
    die("Connection failed: ");
}
$sql1 = "UPDATE INSTRUCTOR SET Type = '$itype' WHERE InstructorId = '$insid' ";
if($conn->query($sql1))
{
	echo "Data UPDATED sucessfully...<br>";
}
else
{
	echo "Cannot UPDATE [ERROR!!!!]...<br>";
}
$conn->close();
?>
 </body>
 </html>
 