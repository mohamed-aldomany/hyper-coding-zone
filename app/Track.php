<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
class Track extends Model
{
    protected $table = 'track';

    protected $fillable = [
        'name', 'description', 'sorting'
    ];

    public function articles(){
        return $this->hasMany('App\Article');
    }
    public function profiles(){
        return $this->belongsToMany('App\Profile','profile_track');
    }
    public function courses(){
        return $this->belongsToMany('App\Course','track_course');
    }
    public function users(){
        return $this->belongsToMany('App\User','user_track');
    }
}
