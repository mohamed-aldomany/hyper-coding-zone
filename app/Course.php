<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;
class Course extends Model
{
    protected $table ='course';

    protected $fillable = [
        'name', 'description', 'no_lessons', 'level', 'sorting', 'course_img', 'exam_id'
    ];

    public function exams(){
        return $this->belongsTo('App\Exam','exam_id','id');
    }
    public function lessons(){
        return $this->hasMany('App\Lesson');
    }
    public function tracks(){
        return $this->belongsToMany('App\Track','track_course');
    }
    public function users(){
        return $this->belongsToMany('App\User','user_course');
    }
}