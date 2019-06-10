<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Auth;

class WebController extends Controller
{

    public function ActiveUser()
    {
        return Auth::user();
    }

    public function test_code()
    {
        return view('/components/User/IDE/ide');
    }    
}