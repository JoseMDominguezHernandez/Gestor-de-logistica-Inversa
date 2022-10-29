<?php
//ACTUALIZAR DATOS DE TRACKING DESDE quality (cALIDAD)
if(isset($_POST["LastStatus"], $_POST["Quality_ID"])){
        
    $Reception_ID = $_POST["Reception_ID"];
    $LastStatus = $_POST["LastStatus"];
    $Locker_ID = $_POST["Locker_ID"];
    $Quality_ID =$_POST["Quality_ID"];
  
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

    $sql = "UPDATE tracking SET Quality_ID = $Quality_ID, LastStatus = $LastStatus, Locker_ID = $Locker_ID WHERE Reception_ID = $Reception_ID";
    if (mysqli_query($conexion, $sql)) {
        echo "\nRegistros guardados.";
        
    } else {
        echo "Error: ".mysqli_error($conexion);
    }
    mysqli_close($conexion);
}

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
     
         if (mysqli_query($conexion, $sql)) {
            echo "\nRegistro modificados.";
        } else {
            echo "Error: ".mysqli_error($conexion);
        }
        mysqli_close($conexion);
    } 


    //ACTUALIZAR DATOS DE TRACKING DESDE distributionarea
    if(isset($_POST["Expedition_ID"])){
            
        $Reception_ID = $_POST["Reception_ID"];
        $LastStatus = $_POST["LastStatus"];
        $Locker_ID = $_POST["Locker_ID"];
        $Expedition_ID =$_POST["Expedition_ID"];
    
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

        $sql = "UPDATE tracking SET Expedition_ID = $Expedition_ID, LastStatus = $LastStatus, Locker_ID = $Locker_ID WHERE Reception_ID = $Reception_ID";
        if (mysqli_query($conexion, $sql)) {
            echo "\nRegistros guardados.";
            
        } else {
            echo "Error: ".mysqli_error($conexion);
        }
        mysqli_close($conexion);
    }


    //IMPORTAR LISTA RECEPCIONES PENDIENTES 
if(isset($_POST["LastStatus"])){
        
    $LastStatus = $_POST["LastStatus"];      

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

   $sql = "SELECT Expedition_ID FROM tracking WHERE LastStatus = $LastStatus ORDER BY Tracking_ID ASC"; 
    $select = mysqli_query($conexion, $sql);

    while ($dat=mysqli_fetch_assoc($select)){
        $arr[]=$dat;
    }
    echo json_encode($arr);    

    if (mysqli_query($conexion, $sql)) {
    } else {
        echo "Error: ".mysqli_error($conexion);
    }
    mysqli_close($conexion);
}    


 //ACTUALIZAR DATOS DE TRACKING DESDE Salida expediciones
 if(isset($_POST["Expedition"])){
            
    /* $Reception_ID = $_POST["Reception_ID"]; */
    $LastStatus = $_POST["LastStatus"];
    $Locker_ID = $_POST["Locker_ID"];
    $Expedition_ID =$_POST["Expedition"];

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

    $sql = "UPDATE tracking SET LastStatus = $LastStatus, Locker_ID = $Locker_ID WHERE Expedition_ID = $Expedition_ID";
    if (mysqli_query($conexion, $sql)) {
        echo "\nRegistros guardados.";
        
    } else {
        echo "Error: ".mysqli_error($conexion);
    }
    mysqli_close($conexion);
}

?>