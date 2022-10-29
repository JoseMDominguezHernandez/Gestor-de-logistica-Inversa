<?php
  //CONSULTA CUENTA DE IMPUTACION RETORNOS POR AGENCIA
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

    $sql = "SELECT Agency_ID, ReturnsAccount FROM transportagencies WHERE Disponible = $Disponible ORDER BY ReturnsAccount ASC";
    $select = mysqli_query($conexion, $sql);
    while ($dat=mysqli_fetch_assoc($select)){
        $arr[]=$dat;
    }
        
    if (mysqli_query($conexion, $sql)) {
    } else {
        echo "Error: ".mysqli_error($conexion);
    }
    mysqli_close($conexion);
    echo json_encode($arr); 
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

        $sql = "SELECT PickUp_ID FROM pickups WHERE Received = $Received";      
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

    //SOLICITUDES YA RECIBIDAS MARCA UN 1 EN PICUPS
    if(isset($_POST["PickUp_ID"])){
           
        $PickUp_ID = $_POST["PickUp_ID"];
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
        $sql = "UPDATE pickups SET Received = $Received WHERE PickUp_ID = $PickUp_ID";      
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

//CONSULTA EMBALAJES
if(isset($_POST["ActivePackage"])){
        
    $ActivePackage = $_POST["ActivePackage"];      

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

    $sql = "SELECT PackageType_ID, Description FROM packagestypes WHERE ActivePackage = $ActivePackage";      
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

/* returns */
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

   $sql = "SELECT Reception_ID, Locker_ID FROM tracking WHERE LastStatus = $LastStatus ORDER BY Tracking_ID ASC"; 
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

//OBTENER EL NUMERO DE ORDEN ASOCIADA A UN Reception_ID
if(isset($_POST["Recepcion"])){
        
    $Reception_ID = $_POST["Recepcion"];      

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

    $sql = "SELECT AssociatedOrder_ID, MerchandiseRemarks FROM pickups WHERE PickUp_ID = (SELECT PickUp_ID FROM receptions WHERE Reception_ID=$Reception_ID LIMIT 1)"; 
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


//OBTENER EL ITEM Y CANTIDAD DE UNA ORDEN
if(isset($_POST["Orden"])){
        
    $Order_ID = $_POST["Orden"];      

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

    $sql = "SELECT Item_ID, Qty FROM orders WHERE Order_ID = $Order_ID";     
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

//OBTENER EL ITEM Y CANTIDAD DESDE PICKUPS >>> Las que hay que abonar
if(isset($_POST["detalleAbono"])){
        
    $Reception_ID = $_POST["detalleAbono"];      

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

    $sql = "SELECT Item, Remarks, Qty FROM returns WHERE Reception_ID = $Reception_ID";     
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

//OBTENER EL NOMBRE Y TELEFONO DE UN CLIENTE
if(isset($_POST["Cliente"])){
        
    $Customer_ID = $_POST["Cliente"];      

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

    $sql = "SELECT Name, Phone1 FROM customers WHERE Customer_ID = $Customer_ID";     
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


//OBTENER LA DESCRIPCION DE UN ITEM
if(isset($_POST["Item"])){
        
    $Item_ID = $_POST["Item"];      

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

    $sql = "SELECT Reference, Description FROM warehouseitems WHERE Item_ID = $Item_ID";     
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



//OBTENER MOTIVOS DE DEVOLUCION
if(isset($_POST["ReturnReason_ID"])){
        
    $ReturnReason_ID = $_POST["ReturnReason_ID"];      

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

    $sql = "SELECT ReturnReason_ID, Description FROM returnreasons WHERE ReturnReason_ID >= $ReturnReason_ID";     
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

//OBTENER MOTIVOS DEVOLUCION POR ID
if(isset($_POST["CodeDev"])){
        
    $ReturnReason_ID = $_POST["CodeDev"];      

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

    $sql = "SELECT Description FROM returnreasons WHERE ReturnReason_ID >= $ReturnReason_ID";     
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


?>