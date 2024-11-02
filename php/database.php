<?php
header('Access-Control-Allow-Origin: *'); 
header('Content-Type: application/json');

header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit;
}

$jsonFile = '../database/products.json';

if (file_exists($jsonFile)) {
    $jsonData = file_get_contents($jsonFile);
    $products = json_decode($jsonData, true);

    echo json_encode($products);
} else {
    echo json_encode(['error' => 'Arquivo JSON não encontrado.']);
}
