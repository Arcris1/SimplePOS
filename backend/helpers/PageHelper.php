<?php 
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

function generate_jwt() {
    $key = 'arcris_igop'; // Change this to your secret key
    $payload = [
        'iss' => 'http://example.org', // Change this to your domain
        'aud' => 'http://example.com', // Change this to your domain
        'iat' => 1356999524,
        'nbf' => 1357000000
    ];

    $jwt = JWT::encode($payload, $key, 'HS256');
    return $jwt;
}