<?php
    //Guardar "Solicitud de recogida"
    if(isset($_POST["PickUp_ID"], $_POST["Customer_ID"])){
        
        $PickUp_ID = $_POST["PickUp_ID"];
        $Customer_ID = $_POST["Customer_ID"];
        $ID_User = $_POST["ID_User"];
        $AssociatedOrder_ID = $_POST["AssociatedOrder_ID"];
        $DateRequest = $_POST["DateRequest"];
        $PreferentialTimetable = $_POST["PreferentialTimetable"];
        $Urgently = $_POST["Urgently"];
        $MerchandiseRemarks = $_POST["MerchandiseRemarks"];
        $Department_ID = $_POST["Department_ID"];
        $Agency_ID = $_POST["Agency_ID"];
        $PickUpRemarks = $_POST["PickUpRemarks"];
        
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

        $sql = "INSERT INTO pickups (PickUp_ID, Customer_ID, ID_User, AssociatedOrder_ID, DateRequest, PreferentialTimetable, Urgently, MerchandiseRemarks, Department_ID, Agency_ID, PickUpRemarks)
        VALUES ('".addslashes($PickUp_ID)."','".addslashes($Customer_ID)."','".addslashes($ID_User)."', 
        '".addslashes($AssociatedOrder_ID)."','".addslashes($DateRequest)."', '".addslashes($PreferentialTimetable)."', 
        '".addslashes($Urgently)."','".addslashes($MerchandiseRemarks)."', 
        '".addslashes($Department_ID)."','".addslashes($Agency_ID)."','".addslashes($PickUpRemarks)."')";

        if (mysqli_query($conexion, $sql)) {
            echo "\nRegistros guardados.";
            
        } else {
            echo "Error: ".mysqli_error($conexion);
        }
        mysqli_close($conexion);
    }

    //GUARDAR DATOS TABLA RECEPCION
    if(isset($_POST["PickUp_ID"], $_POST["PackageType"])){
        
        $Reception_ID =$_POST["Reception_ID"];
        $PickUp_ID = $_POST["PickUp_ID"];
        $User_ID = $_POST["User_ID"];
        $PackageType = $_POST["PackageType"];
        $NextTrackingStatus = $_POST["NextTrackingStatus"];
        $Locker_ID = $_POST["Locker_ID"];
        $Comments = $_POST["Comments"];
      
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

        $sql = "INSERT INTO receptions (Reception_ID, PickUp_ID, User_ID, PackageType, NextTrackingStatus,Locker_ID,Comments)
        VALUES ('".addslashes($Reception_ID)."', '".addslashes($PickUp_ID)."','".addslashes($User_ID)."', 
        '".addslashes($PackageType)."','".addslashes($NextTrackingStatus)."', '".addslashes($Locker_ID)."', 
        '".addslashes($Comments)."')";

        if (mysqli_query($conexion, $sql)) {
            echo "\nRegistros guardados.";
            
        } else {
            echo "Error: ".mysqli_error($conexion);
        }
        mysqli_close($conexion);
    }

    //Consulta datos del cliente
    if(isset($_POST["Customer_ID"])){
       
         $Customer_ID = $_POST["Customer_ID"];      

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
         $sql = "SELECT * FROM customers WHERE Customer_ID = $Customer_ID" ;      
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


     //Nombres de agencias para desplegable
     if(isset($_POST["Disponible"])){
       
        $Disponible = $_POST["Disponible"];      

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

        $sql = "SELECT  Agency_ID, Name, ReturnsAccount FROM transportagencies WHERE Disponible = $Disponible ORDER BY Name ASC";
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

    //BUSCAR NOMBRE DE DEPARTAMENTO POR ID
    if(isset($_POST["Department_ID"])){
       
        $Department_ID = $_POST["Department_ID"];      

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

        $sql = "SELECT Name FROM departments WHERE Department_ID = $Department_ID";
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


    //Consulta codigos de cliente
    if(isset($_POST["ClienteActivo"])){
       
        $ClienteActivo = $_POST["ClienteActivo"];      

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
        $sql = "SELECT Customer_ID FROM customers WHERE ClienteActivo = $ClienteActivo ORDER BY Customer_ID ASC";      
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


    //Consulta Ordenes
    if(isset($_POST["Qty"])){
        
        $Qty = $_POST["Qty"];      

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

        $sql = "SELECT DISTINCT Order_ID FROM orders WHERE Qty >= $Qty ORDER BY Order_ID ASC;";      
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

     //CONSULTA Solicitudes pendientes de recepcionar
     if(isset($_POST["Received"])){
        
        $Received = $_POST["Received"];      

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

        $sql = "SELECT count(Received) FROM pickups WHERE Received = $Received";      
        $select = mysqli_query($conexion, $sql);

        $dat=mysqli_fetch_assoc($select);
        echo json_encode($dat);     

        if (mysqli_query($conexion, $sql)) {
        } else {
            echo "Error: ".mysqli_error($conexion);
        }
        mysqli_close($conexion);
    }    

    //CONSULTA Solicitudes pendientes de recepcionar
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

        $sql = "SELECT count(Reception_ID) FROM tracking WHERE LastStatus = $LastStatus";      
        $select = mysqli_query($conexion, $sql);

        $dat=mysqli_fetch_assoc($select);
        echo json_encode($dat);     

        if (mysqli_query($conexion, $sql)) {
        } else {
            echo "Error: ".mysqli_error($conexion);
        }
        mysqli_close($conexion);
    }    

    //CONSULTA USUARIO / CONTRASEÑA
    if(isset($_POST["UsuarioActivo"])){
            
        $UsuarioActivo = $_POST["UsuarioActivo"];      

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
        
        $sql = "SELECT User, Password, Name, User_ID, Surname1 FROM users WHERE UsuarioActivo = $UsuarioActivo";      
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

    //CONSULTA LOCKER VACIO
    if(isset($_POST["PackageType"], $_POST["Status"])){
            
        $PackageType = $_POST["PackageType"];   
        $Status = $_POST["Status"];     

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

        $sql = "SELECT Locker_ID, Name FROM lockers WHERE PackageType = $PackageType AND Status = $Status LIMIT 1";      
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

   //OBTENER PROXIMO DEPARTAMENTO Y CODIGO DE CLIENTE
   if(isset($_POST["PickUp_ID"])){
        
    $PickUp_ID = $_POST["PickUp_ID"];        

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

    $sql = "SELECT Department_ID, Customer_ID  FROM pickups WHERE PickUp_ID  = $PickUp_ID";      
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

//Nombres de departamentos para desplegable
if(isset($_POST["Activo"])){
       
    $Activo = $_POST["Activo"];      

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

    $sql = "SELECT  Department_ID, Name FROM departments WHERE Activo = $Activo ORDER BY Name ASC";
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

//BLOQUEAR / DESBLOQUEAR CASILLERO
if(isset($_POST["Locker_ID"], $_POST["Status"])){
        
    $Locker_ID = $_POST["Locker_ID"];
    $Status = $_POST["Status"];
    
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
    $sql = "UPDATE lockers SET Status=$Status WHERE Locker_ID=$Locker_ID";

    if (mysqli_query($conexion, $sql)) {
        echo "\nRegistro modificados.";
    } else {
        echo "Error: ".mysqli_error($conexion);
    }
    mysqli_close($conexion);
}


//GUARDAR DATOS TABLA RETURNS
if(isset($_POST["Return"], $_POST["Reception"])){
        
    $Reception_ID =$_POST["Reception"];
    $Return_ID = $_POST["Return"];
    
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
    $sql = "INSERT INTO returns (Reception_ID, Return_ID)
    VALUES ('".addslashes($Reception_ID)."', '".addslashes($Return_ID)."')";

    if (mysqli_query($conexion, $sql)) {
        echo "\nRegistros guardados.";
        
    } else {
        echo "Error: ".mysqli_error($conexion);
    }
    mysqli_close($conexion);
}


//GUARDAR DATOS TABLA QUALITY
if(isset($_POST["Quality_ID"], $_POST["ReceptionQ"])){
        
    $Reception_ID =$_POST["ReceptionQ"];
    $Quality_ID = $_POST["Quality_ID"];
    
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
    $sql = "INSERT INTO quality (Reception_ID, Quality_ID)
    VALUES ('".addslashes($Reception_ID)."', '".addslashes($Quality_ID)."')";

    if (mysqli_query($conexion, $sql)) {
        echo "\nRegistros guardados.";
        
    } else {
        echo "Error: ".mysqli_error($conexion);
    }
    mysqli_close($conexion);
}

//BORRAR REGISTROS DE RETURNS AL CANCELAR 
if(isset($_POST["Devolucion"])){
        
    $Return_ID = $_POST["Devolucion"];
    
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
    $sql = "DELETE FROM returns WHERE Return_ID = $Return_ID";

    if (mysqli_query($conexion, $sql)) {
        echo "\nRegistro modificados.";
    } else {
        echo "Error: ".mysqli_error($conexion);
    }
    mysqli_close($conexion);
}


/* //BORRAR dobles REGISTROS DE TRACKING 
if(isset($_POST["ActualizarTabla"])){
        
    $Costumer_ID = $_POST["ActualizarTabla"];
    
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
    $sql = "DELETE FROM tracking WHERE Customer_ID = $Customer_ID";

    if (mysqli_query($conexion, $sql)) {
        echo "\nRegistro modificados.";
    } else {
        echo "Error: ".mysqli_error($conexion);
    }
    mysqli_close($conexion);
} */


//BORRAR REGISTROS DE quality AL CANCELAR 
if(isset($_POST["ControlQ"])){
        
    $Quality_ID = $_POST["ControlQ"];
    
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
    $sql = "DELETE FROM quality WHERE Quality_ID = $Quality_ID";

    if (mysqli_query($conexion, $sql)) {
        echo "\nRegistro modificados.";
    } else {
        echo "Error: ".mysqli_error($conexion);
    }
    mysqli_close($conexion);
}





?>