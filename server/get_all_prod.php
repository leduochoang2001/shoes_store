<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, OPTIONS");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

require_once("connect_db.php");
$query="select * from shoe";
$res= mysqli_query($conn,$query);
if(!$res) die("Failed to excute SQL query: $query<br>");
$rows= mysqli_fetch_all($res, MYSQLI_ASSOC);
$rows_count=mysqli_num_rows($res);

for ($i=0; $i<$rows_count; $i++){
    $row=$rows[$i];
    $query="SELECT sval as size, amount from shoe_storage, size
    where shoe_storage.sizeID=size.sizeID and
    shoeID=$row[shoeID] and amount>0
    ";
    $res2= mysqli_query($conn,$query);
    if(!$res2) die("Failed to excute SQL query: $query<br>");
    $rows2=mysqli_fetch_all($res2, MYSQLI_ASSOC);
    $rows[$i]['detail']=$rows2;
    /*$rows[$i]['sizes']=array();
    $rows[$i]['amounts']=array();   
    while($row2=mysqli_fetch_row($res2)){
        array_push($rows[$i]['sizes'], $row2[0]);
        array_push($rows[$i]['amounts'], $row2[1]);
    }*/
}
echo json_encode($rows);

mysqli_free_result($res);
mysqli_close($conn);
?>