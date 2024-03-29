<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Stripe, Mailgun, SparkPost and others. This file provides a sane
    | default location for this type of information, allowing packages
    | to have a conventional place to find your various credentials.
    |
    */
    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
        'endpoint' => env('MAILGUN_ENDPOINT', 'api.mailgun.net'),
    ],

    'ses' => [
        'key' => env('SES_KEY'),
        'secret' => env('SES_SECRET'),
        'region' => env('SES_REGION', 'us-east-1'),
    ],

    'sparkpost' => [
        'secret' => env('SPARKPOST_SECRET'),
    ],

    'stripe' => [
        'model' => App\User::class,
        'key' => env('STRIPE_KEY'),
        'secret' => env('STRIPE_SECRET'),
        'webhook' => [
            'secret' => env('STRIPE_WEBHOOK_SECRET'),
            'tolerance' => env('STRIPE_WEBHOOK_TOLERANCE', 300),
        ],
    ],

    'facebook' => [
        'client_id' => '625628797909250',// Your facbook Client ID
        'client_secret' => 'f71ea082e457fd5e4a28630faecdf4d6', // Your facbook Client Secret
        'redirect' => 'http://localhost:8000/login/facebook/callback',
    ],
    
    'google' => [
        'client_id' => '1019507147821-ns6r9bjurudkhrlvf30h5gml5bolpl34.apps.googleusercontent.com',// Your google Client ID
        'client_secret' => '4JLBZ0A13i1F3Ku1fE01Qhzc', // Your google Client Secret
        'redirect' => 'http://127.0.0.1:8000/auth/google/callback'
    ],

];
