<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
class Exam extends Model
{
    protected $table ='exam';

    protected $fillable = [
        'name', 'result', 'passing', 'course_id'
    ];

    public function questions(){
        return $this->hasMany('App\Question');
    }
    public function courses(){
        return $this->hasMany('App\Course');
    }
    public function users(){
        return $this->belongsToMany('App\User','user_exam');
    }

    public function user_exams(){
        return $this->belongsToMany('App\User','acad_exam');
    }

}
