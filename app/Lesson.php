<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
//use Laravel\Passport\HasApiTokens;
class Lesson extends Model
{
    protected $table ='lesson';

    protected $fillable = [
        'name', 'description', 'url', 'duration', 'sorting', 'course_id'
    ];

    public function courses(){
        return $this->belongsTo('App\Course','course_id','id');
    }
    public function attachs(){
        return $this->belongsToMany('App\Attach','lesson_attach');
    }
    public function users(){
        return $this->belongsToMany('App\User','user_lesson');
    }
}
