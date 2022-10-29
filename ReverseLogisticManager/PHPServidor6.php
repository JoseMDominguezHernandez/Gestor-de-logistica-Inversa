<?php

 //ACTUALIZA DATOS EN QUALITY
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

    //GUARDAR DATOS TABLA DISTRIBUTIONAREA
    if(isset($_POST["Expedition_ID"], $_POST["ReceptionQ"])){
            
        $Reception_ID =$_POST["ReceptionQ"];
        $Expedition_ID = $_POST["Expedition_ID"];
        
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
        $sql = "INSERT INTO distributionarea (Reception_ID, Expedition_ID)
        VALUES ('".addslashes($Reception_ID)."', '".addslashes($Expedition_ID)."')";

        if (mysqli_query($conexion, $sql)) {
            echo "\nRegistros guardados.";
            
        } else {
            echo "Error: ".mysqli_error($conexion);
        }
        mysqli_close($conexion);
    }


    //actualizar DATOS EN DISTRIBUTIONAREA
    if(isset($_POST["ZIPCode"])){
        
        $Expedition_ID = $_POST["Expedition_ID"];
        $Customer_ID = $_POST["Customer_ID"];
        $User_ID = $_POST["User_ID"];
        $Agency_ID =$_POST["Agency_ID"];
        $Name = $_POST["Name"];
        $Direction1 = $_POST["Direction1"];
        $Direction2 = $_POST["Direction2"];
        $ZIPCode = $_POST["ZIPCode"];
        $Town = $_POST["Town"];
        $Province = $_POST["Province"];
        $Email = $_POST["Email"];
        $Phone1 = $_POST["Phone1"];
        $Phone2 = $_POST["Phone2"];
        $ContactPerson = $_POST["ContactPerson"];
        $Weigth = $_POST["Weigth"];
           
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
        $sql ="UPDATE distributionarea SET 

        Customer_ID = $Customer_ID,
        User_ID = $User_ID,
        Weigth = $Weigth
        WHERE Expedition_ID = Expedition_ID";

         if (mysqli_query($conexion, $sql)) {
            echo "\nRegistro modificados.";
        } else {
            echo "Error: ".mysqli_error($conexion);
        }
        mysqli_close($conexion);
    } 


?>