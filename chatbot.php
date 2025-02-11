<?php
include 'db_connection.php';  // Conexión a la base de datos

if (isset($_POST['menu'])) {
    //$user_question = $_POST['question'];

    // Preparar la consulta para obtener la respuesta desde la base de datos
    //$stmt = $pdo->prepare("SELECT * FROM qa_pairs WHERE question LIKE :question LIMIT 1");
    $stmt = $pdo->prepare(" SELECT GROUP_CONCAT(CONCAT(NUMERO_CATEGORIA ,'. ', DETALLE_CATEGORIA) SEPARATOR '<br>') answers 
                            FROM UA_CATEGORIA 
                            WHERE ESTATUS = 1
                            ORDER BY  NUMERO_CATEGORIA ASC");
    //$stmt->execute(['question' => "%$user_question%"]);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($result) {
        $answers = $result['answers'];
    } else {
        $answers = "Lo siento, no tengo una respuesta para esa pregunta.";
    }

    // Devolver la respuesta como JSON
    echo json_encode(['answers' => $answers]);
    exit;  // Salir para evitar el resto del código PHP
}

if (isset($_POST['question'])) {
    $user_question = $_POST['question'];

    // Preparar la consulta para obtener la respuesta desde la base de datos
    //$stmt = $pdo->prepare("SELECT * FROM qa_pairs WHERE question LIKE :question LIMIT 1");
    $stmt = $pdo->prepare(" SELECT ID_CATEGORIA answer
                            FROM UA_SUBCATEGORIA 
                            WHERE ESTATUS = 1
                              AND ID_CATEGORIA LIKE :question");
    $stmt->execute(['question' => "%$user_question%"]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($result) {
        $stmt = $pdo->prepare(" SELECT GROUP_CONCAT(CONCAT(NUMERO_SUBCATEGORIA ,'. ', DETALLE_SUBCATEGORIA) SEPARATOR '<br>') answer 
                            FROM UA_SUBCATEGORIA 
                            WHERE ESTATUS = 1
                              AND ID_CATEGORIA LIKE :question
                            ORDER BY  NUMERO_SUBCATEGORIA ASC");
        $stmt->execute(['question' => "%$user_question%"]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($result) {
            $answer = $result['answer'];

        } else {
            $answer = "Lo siento, no tengo una respuesta para esa pregunta.";
        }
    } else {
        $stmt = $pdo->prepare(" SELECT RESPUESTA answer 
                                FROM UA_RESPUESTAS 
                                WHERE ESTATUS = 1
                                  AND ID_CATEGORIA LIKE :question");
        $stmt->execute(['question' => "%$user_question%"]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($result) {
            $answer = $result['answer'];
        } else {
            $answer = "Lo siento, no tengo una respuesta para esa pregunta.";
        }
    }

    // Devolver la respuesta como JSON
    echo json_encode(['answer' => $answer]);
    exit;  // Salir para evitar el resto del código PHP
}


?>