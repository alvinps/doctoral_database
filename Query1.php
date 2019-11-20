<!-- {%Alvin Poudel Sharma             Jared Kremer} -->


<html>
<head>
	<title> Query1 </title>
</head>
<body>
<?php

  $studentid = filter_input(INPUT_POST, 'studentid');
  $fname = filter_input(INPUT_POST, 'fname');
  $lname = filter_input(INPUT_POST, 'lname');
  $stsem = filter_input(INPUT_POST, 'stsem');
  $styear = filter_input(INPUT_POST, 'styear');
  $supervisorid = filter_input(INPUT_POST, 'supervisorid');
  $selfsupport = filter_input(INPUT_POST, 'selfsupport');
 // Create connection
$conn = new mysqli("localhost", "root", "", "doctoral");
// Check connection
if ($conn->connect_error) {
    die("Connection failed: ");
}
$sql1 = "INSERT INTO PHDSTUDENT(StudentId,FName,LName,StSem,StYear,Supervisor) VALUES ('$studentid','$fname','$lname','$stsem','$styear','$supervisorid')";
if($conn->query($sql1))
{
	echo "Data INSERTED sucessfully...<br>";
if($selfsupport == "Yes"){
	$sql2 = "INSERT INTO SELFSUPPORT(StudentId) VALUES ('$studentid')";
	if($conn->query($sql2))
	{
		echo "record INSERTED into selfsupport sucessfully... <br>";
	}
	else{
		echo "Error can't add data into selfsupport...<br>";
	}
}
}
else{
	echo "Cannot INSERT [ERROR!!!!]...<br>";
}
$conn->close();
?>
 </body>
 </html>
 