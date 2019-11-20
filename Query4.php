<!-- {%Alvin Poudel Sharma             Jared Kremer} -->

<html>
<head>
	<title> Query4 </title>
</head>
<body>

<?php
// take user input
$StudentID = filter_input(INPUT_POST, 'StudentID');
// Create connection
$conn = new mysqli("localhost", "root", "", "doctoral");
// Check connection
if ($conn->connect_error) {
    die("Connection failed: ");
}

$sql = "SELECT PHDSTUDENT.StudentId,Fname,Lname,StSem,StYear,Supervisor,MILESTONE.MID,PassDate
        FROM PHDSTUDENT,MILESTONE,MILESTONESPASSED
        WHERE PHDSTUDENT.StudentId = '$StudentID' AND PHDSTUDENT.StudentId=MILESTONESPASSED.StudentId  
        AND MILESTONE.MID = MILESTONESPASSED.MID" ;

if($conn->query($sql))
{
    $result = $conn->query($sql);

    if ($result->num_rows > 0) 
    {
        // output data of each row
        while($row = $result->fetch_assoc()) 
        {
            echo "Id: " . $row["StudentId"]. " Name: " . $row["Fname"]. " " . $row["Lname"]. 
            "   StSem:". $row["StSem"]." StYear:" . $row["StYear"]." SupervisorId:". $row["Supervisor"].
            " MileStoneId:".$row["MID"]." PassDate:".$row["PassDate"].  "<br>";
        }
    } 
    else 
    {
        echo "0 results";
    }
}
else 
{
    echo "Record Selected Unsuccesfully<.<br>.";
    echo "Error:".$sql."".$conn->error;
    
}



$conn->close();
?>

 </body>
 </html>
 