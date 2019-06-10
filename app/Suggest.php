<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
class Suggest extends Model
{
    protected $table ='suggest';


    public function users(){
        return $this->belongsTo('App\User','user_id','id');
    }

}






        