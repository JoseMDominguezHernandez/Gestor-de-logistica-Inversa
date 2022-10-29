<?php

    //ACTUALIZAR DATOS DE TRACKING DESDE RECEPCIONES (returns)
    if(isset($_POST["Reception_ID"], $_POST["Locker_ID"])){
        
        $Reception_ID = $_POST["Reception_ID"];
        $LastStatus = $_POST["LastStatus"];
        $Locker_ID = $_POST["Locker_ID"];
        $Return_ID =$_POST["Return_ID"];
      
        $servidor = "localhost";
        $usuario = "root";
        $password = "";
        $dbname = "reverselogisticsmng";
    
        $conexion = mysqli_connect($servidor, $usuario, $password, $dbname);
        if (!$conexion) {
            echo(alert("Fallo en la conexion"));
            echo "MySQL connection error: ".mysqli_connect_error();
            exit();
    
        } else {
            echo("Conexion establecida correctamente.");
        }
    
        $sql = "UPDATE tracking SET Return_ID=$Return_ID, LastStatus=$LastStatus, Locker_ID=$Locker_ID WHERE Reception_ID=$Reception_ID";
        if (mysqli_query($conexion, $sql)) {
            echo "\nRegistros guardados.";
            
        } else {
            echo "Error: ".mysqli_error($conexion);
        }
        mysqli_close($conexion);
    }

/*     //ACTUALIZAR DATOS DE TRACKING DESDE quality (cALIDAD)
if(isset($_POST["LastStatus"], $_POST["Quality_ID"])){
        
    $Reception_ID = $_POST["Reception_ID"];
    $LastStatus = $_POST["LastStatus"];
    $Locker_ID = $_POST["Locker_ID"];
    $Return_ID =$_POST["Return_ID"];
  
    $servidor = "localhost";
    $usuario = "root";
    $password = "";
    $dbname = "reverselogisticsmng";

    $conexion = mysqli_connect($servidor, $usuario, $password, $dbname);
    if (!$conexion) {
        echo(alert("Fallo en la conexion"));
        echo "MySQL connection error: ".mysqli_connect_error();
        exit();

    } else {
        echo("Conexion establecida correctamente.");
    }

    $sql = "UPDATE tracking SET Return_ID=$Return_ID, LastStatus=$LastStatus, Locker_ID=$Locker_ID WHERE Reception_ID=$Reception_ID";
    if (mysqli_query($conexion, $sql)) {
        echo "\nRegistros guardados.";
        
    } else {
        echo "Error: ".mysqli_error($conexion);
    }
    mysqli_close($conexion);
}
 */












 //GRABAR DATOS EN QUALITY
    if(isset($_POST["Quality_ID"])){
        
        $User_ID = $_POST["User_ID"];
        $Item_ID = $_POST["Item_ID"];
        $Qty = $_POST["Qty"];
        $Proceded =$_POST["Proceded"];
        $Reason = $_POST["Reason"];
        $NextTrackingStatus = $_POST["NextTrackingStatus"];
        $Locker_ID = $_POST["Locker_ID"];
        $Quality_ID = $_POST["Quality_ID"];
        $Reception_ID = $_POST["Reception_ID"];
    
        $servidor = "localhost";
        $usuario = "root";
        $password = "";
        $dbname = "reverselogisticsmng";

        $conexion = mysqli_connect($servidor, $usuario, $password, $dbname);
        if (!$conexion) {
            echo(alert("Fallo en la conexion"));
            echo "MySQL connection error: ".mysqli_connect_error();
            exit();
        } else {
            echo("Conexion establecida correctamente.");
        }

        $sql ="UPDATE quality SET Item_ID=$Item_ID, User_ID = $User_ID, Qty = $Qty, Reason = $Reason, Proceded = $Proceded, NextTrackingStatus = $NextTrackingStatus, Locker_ID = $Locker_ID WHERE Quality_ID = Quality_ID";
        /* $sql ="UPDATE quality SET Item_ID=$Item_ID, User_ID = $User_ID, Analysis = $Analysis, Qty = $Qty, Reason = $Reason, Proceded = $Proceded, NextTrackingStatus = $NextTrackingStatus, Locker_ID = $Locker_ID WHERE Quality_ID = Quality_ID"; */
         if (mysqli_query($conexion, $sql)) {
            echo "\nRegistro modificados.";
        } else {
            echo "Error: ".mysqli_error($conexion);
        }
        mysqli_close($conexion);
    } 






?>