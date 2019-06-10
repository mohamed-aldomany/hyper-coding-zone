<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
class Attach extends Model
{
    protected $table ='attach';

    public function lessons(){
        return $this->belongsToMany('App\Lesson','lesson_attach');
    }
}
