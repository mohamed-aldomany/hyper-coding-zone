<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements MustVerifyEmail
{
    use Notifiable;

    protected $fillable = [
        'name', 'email','password','firstname','lastname','phone'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    public function articles(){
        return $this->hasMany('App\Article');
    }
    public function suggests(){
        return $this->hasMany('App\Suggest');
    }
    public function comments(){
        return $this->hasMany('App\Comment');
    }
    public function profiles(){
        return $this->belongsToMany('App\Profile','user_profile');
    }
    public function tracks(){
        return $this->belongsToMany('App\Track','user_track');
    }
    public function courses(){
        return $this->belongsToMany('App\Course','user_course');
    }
    public function lessons(){
        return $this->belongsToMany('App\Lesson','user_lesson');
    }
    public function examples(){
        return $this->hasMany('App\Example');
    }
    public function replies(){
        return $this->hasMany('App\Reply');
    }

    public function exams(){
        return $this->belongsToMany('App\Exam','user_exam');
    }

}
