<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
class Profile extends Model
{
    protected $table ='profile';

    protected $fillable = [
        'name', 'description'
    ];

    public function users(){
        return $this->belongsToMany('App\User','user_profile');
    }
    public function tracks(){
        return $this->belongsToMany('App\Track','profile_track');
    }
}
