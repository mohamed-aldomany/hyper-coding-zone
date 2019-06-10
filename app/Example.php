<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
class Example extends Model
{
    protected $table ='example';

    public function users(){
        return $this->belongsTo('App\User','user_id','id');
    }

}
